import React, { useContext, useEffect, useState } from 'react'
import { Radio, Tooltip } from 'antd'
import Form from './Form/Form'
import { MdAnnouncement } from 'react-icons/md'
import './Announcements.scss'
import { ThemeContext } from '../../providers/ThemeProvider'
import { FaArrowRightToBracket } from 'react-icons/fa6'
import { IoTimeOutline } from 'react-icons/io5'
import { FiUser } from 'react-icons/fi'
import { PageProvider } from '../../providers/PageProvider'
import { fetchNui } from '../../utils/fetchNui'
import NoResult from '../../components/NoResult'
import { formatDate } from '../../utils'
import { navigateWithAnimation } from '../../utils/misc'
import { Announcement } from '../../types'
import { hasPermission } from '../../utils/permissions'
import { t } from '../../hooks/useLocale'
import { motion, AnimatePresence } from 'framer-motion'

const extractTextFromHTML = (html: string) => {
    const tempDiv = document.createElement('div')
    tempDiv.innerHTML = html
    return tempDiv.textContent || tempDiv.innerText || ''
}

const Announcements = () => {
    const { theme } = useContext(ThemeContext)
    const [announcementsPage, setAnnouncementsPage] = useState<'preview' | 'create'>('preview')
    const [announcements, setAnnouncements] = useState<Announcement[]>()
    const [isPageLoading, setIsPageLoading] = useState(true)

    const fetchAnnouncements = () => {
        fetchNui('getAnnouncements')
            .then((response: any) => {
                const sortedAnnouncements = response.sort(
                    (a: Announcement, b: Announcement) => b.id - a.id,
                )
                setAnnouncements(sortedAnnouncements)
            })
            .finally(() => setIsPageLoading(false))
    }

    useEffect(() => {
        fetchAnnouncements()
    }, [])

    const hasCreatePerms = hasPermission('announcements.create')

    const pageVariants = {
        initial: (direction: number) => ({
            x: direction > 0 ? 300 : -300,
            opacity: 0,
        }),
        animate: {
            x: 0,
            opacity: 1,
            transition: { duration: 0.25 },
        },
        exit: (direction: number) => ({
            x: direction > 0 ? -300 : 300,
            opacity: 0,
            transition: { duration: 0.25 },
        }),
    }

    const [direction, setDirection] = useState(1)

    const handlePageChange = (newPage: 'preview' | 'create') => {
        setDirection(newPage === 'create' ? 1 : -1)
        setAnnouncementsPage(newPage)
    }

    return (
        <PageProvider
            title={t('announcements.title')}
            loading={isPageLoading}
            description={t('announcements.description')}
        >
            <div className="announcements-container">
                <div className="buttons">
                    <Radio.Group
                        value={announcementsPage}
                        onChange={(e) => handlePageChange(e.target.value)}
                    >
                        <Radio.Button value="preview">{t('announcements.preview')}</Radio.Button>
                        {!hasCreatePerms ? (
                            <Tooltip title={t('global.no_perms')}>
                                <Radio.Button disabled value="create">
                                    {t('announcements.create')}
                                </Radio.Button>
                            </Tooltip>
                        ) : (
                            <Radio.Button value="create">{t('announcements.create')}</Radio.Button>
                        )}
                    </Radio.Group>
                </div>

                {}
                <AnimatePresence mode="wait" custom={direction}>
                    <motion.div
                        style={{ overflow: 'hidden' }}
                        key={announcementsPage}
                        custom={direction}
                        initial="initial"
                        animate="animate"
                        exit="exit"
                        variants={pageVariants}
                    >
                        {announcementsPage === 'preview' ? (
                            <div className="announcements-table">
                                {announcements && announcements.length > 0 ? (
                                    announcements.map((item) => (
                                        <div
                                            key={item.id}
                                            style={{
                                                border: `1px solid ${theme.components.Card.colorBorderSecondary}`,
                                            }}
                                            className="item"
                                            onClick={() =>
                                                navigateWithAnimation(`/announcement/${item.id}`)
                                            }
                                        >
                                            <MdAnnouncement className="first-icon" />
                                            <div className="text">
                                                <div className="row">
                                                    <div className="line">
                                                        <FiUser />
                                                        {item.author}
                                                    </div>
                                                    <div className="line">
                                                        <IoTimeOutline />
                                                        {formatDate(item.created_at)}
                                                    </div>
                                                </div>
                                                <h2>{item.title}</h2>
                                                <p
                                                    style={{
                                                        color: 'var(---token-colorTextPrimary)',
                                                    }}
                                                >
                                                    {extractTextFromHTML(item.description)}
                                                </p>
                                            </div>
                                            <FaArrowRightToBracket className="second-icon" />
                                        </div>
                                    ))
                                ) : (
                                    <NoResult align="center" />
                                )}
                            </div>
                        ) : (
                            <Form />
                        )}
                    </motion.div>
                </AnimatePresence>
            </div>
        </PageProvider>
    )
}

export default Announcements
