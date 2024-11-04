import React, { useState, useEffect, useRef, useContext } from 'react'
import { Row, Col, Card, Avatar, Tooltip, Input, Button } from 'antd'
import { NotificationOutlined } from '@ant-design/icons'
import { IoLocationOutline, IoCarOutline, IoSend, IoDocumentOutline } from 'react-icons/io5'
import { AiOutlineUser } from 'react-icons/ai'
import { MdKeyboardDoubleArrowRight, MdOutlineSearch } from 'react-icons/md'
import { FaBriefcase, FaFileAlt, FaRegStickyNote } from 'react-icons/fa'
import { GiPistolGun, GiPoliceOfficerHead } from 'react-icons/gi'
import './HomePage.scss'
import { fetchNui } from '../../utils/fetchNui'
import { DispatchNotifications, FpProps, SearchProps } from '../../types'
import { CiStar } from 'react-icons/ci'
import { HiOutlineBadgeCheck } from 'react-icons/hi'
import { SiStatuspal } from 'react-icons/si'
import { PageProvider } from '../../providers/PageProvider'
import DispatchNotification from '../Dispatch/DispatchNotification'
import { ThemeContext } from '../../providers/ThemeProvider'
import NoResult from '../../components/NoResult'
import { FaPhotoFilm, FaRegUser } from 'react-icons/fa6'
import { LiaCarSideSolid } from 'react-icons/lia'
import { navigateWithAnimation } from '../../utils/misc'
import { t } from '../../hooks/useLocale'
import { useConfig } from '../../hooks/useConfig'
import { hasPermission } from '../../utils/permissions'

const defaultimage = 'https://i.imgur.com/dqoG8Qb.png'
const fps: FpProps[] = [
    {
        radio: 2,
        name: 'Kevin McFrommage',
        grade: 'Sergeant II',
        img: defaultimage,
        badge: 'LSPD-101',
    },
    {
        radio: 2,
        name: 'Kevin McFrommage',
        grade: 'Sergeant II',
        img: defaultimage,
        badge: 'LSPD-101',
    },
]

interface messageProps {
    id: number
    text: string
    isMine: boolean
    photo: string
    name: string
    author: string
}

const HomePage = () => {
    const [isPageLoading, setIsPageLoading] = useState(true)
    const { theme } = useContext(ThemeContext)
    const [searchTerm, setSearchTerm] = useState<string>('')
    const [quickSearchResults, setQuickSearchResults] = useState<SearchProps[]>([])
    const [dispatchNotifs, setDispatchNotifs] = useState<Record<string, DispatchNotifications>>({})
    const [doctors, setDoctors] = useState<FpProps[]>([])
    const [messages, setMessages] = useState<messageProps[]>()
    const [messageText, setMessageText] = useState('')
    const messagesEndRef = useRef<HTMLDivElement>(null)
    const [selectedDispatchNotif, setSelectedDispatchNotif] =
        useState<null | DispatchNotifications>(null)
    const [isSearchLoading, setIsSearchLoading] = useState(false)
    const haveMessagesPerms = hasPermission('homepage.chat')
    const haveSearchPerms = hasPermission('homepage.search')
    const getMessages = () => {
        if (haveMessagesPerms) {
            fetchNui('getMessages').then((response: any) => {
                setMessages(response)
            })
        }
    }
    const config = useConfig()
    const handleSendMessage = () => {
        if (messageText.trim()) {
            setMessageText('')
            fetchNui('sendMessage', { message: messageText }).then((response: any) => {
                getMessages()
            })
        }
    }

    useEffect(() => {
        messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' })
    }, [messages])

    useEffect(() => {
        Promise.all([
            fetchNui('getDispatchNotifs', { limit: config?.homepage?.dispatchlimit }).then(
                (notifications: any) => {
                    setDispatchNotifs(notifications)
                },
            ),
            fetchNui<FpProps[]>('getOnlineDoctors', {}, fps).then((doctors) => {
                setDoctors(doctors)
            }),
            getMessages(),
        ])
            .finally(() => {
                setIsPageLoading(false)
            })
            .catch((error) => {
                console.error('Error while fetching home page data:', error)
            })
    }, [])

    const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setMessageText(e.target.value)
    }

    const handleQuickSearch = (value: string) => {
        setIsSearchLoading(true)

        Promise.all([
            fetchNui<SearchProps[]>('searchCitizens', { query: value }),
            fetchNui<SearchProps[]>('searchNotes', { query: value }),
            fetchNui<SearchProps[]>('searchCases', { query: value }),
        ])
            .then((results) => {
                const maxResultsPerCategory = Math.ceil(
                    config.homepage.maxSearchResults / results.length,
                )

                const citizens = results[0]
                    .slice(0, maxResultsPerCategory)
                    .map((item) => ({ ...item, type: 'citizen' }))
                const notes = results[1]
                    .slice(0, maxResultsPerCategory)
                    .map((item) => ({ ...item, type: 'note' }))
                const cases = results[2]
                    .slice(0, maxResultsPerCategory)
                    .map((item) => ({ ...item, type: 'case' }))

                const mergedResults = [...citizens, ...notes, ...cases].slice(
                    0,
                    config.homepage.maxSearchResults,
                )

                setQuickSearchResults(mergedResults)
            })
            .catch((err) => console.error(`Error fetching search results:`, err))
            .finally(() => setIsSearchLoading(false))
    }

    const handleSearchChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (!haveSearchPerms) return
        const value = e.target.value
        setSearchTerm(value)
        handleQuickSearch(value)
    }

    useEffect(() => {
        const handleEvent = (event: any) => {
            if (event.data.action === 'dispatchNotification') {
                fetchNui('getDispatchNotifs', { limit: 5 }).then((notifications: any) => {
                    setDispatchNotifs(notifications)
                })
            } else if (event.data.action === 'refreshMessages') {
                getMessages()
            }
        }

        window.addEventListener('message', handleEvent)

        return () => {
            window.removeEventListener('message', handleEvent)
        }
    }, [])

    const quickSearchIcons: Record<string, JSX.Element> = {
        citizen: <FaRegUser />,
        vehicle: <LiaCarSideSolid />,
        note: <FaRegStickyNote />,
        weapon: <GiPistolGun />,
        case: <IoDocumentOutline />,
    }

    return (
        <PageProvider
            title={t('homepage.title')}
            description={t('homepage.description')}
            loading={isPageLoading}
        >
            <div className="home-page-container" style={{ padding: '16px' }}>
                <Row gutter={16} style={{ height: '100%' }}>
                    <Col
                        span={8}
                        style={{ display: 'flex', flexDirection: 'column', height: '100%' }}
                    >
                        <Card style={{ flex: 2 }} className="chat-container">
                            <div className="chat-content">
                                <h2 className="title">{t('homepage.chat.title')}</h2>
                                <p className="subtitle">{t('homepage.chat.description')}</p>
                                <div className="chat-messages">
                                    {haveMessagesPerms ? (
                                        messages && messages.length > 0 ? (
                                            messages.map((msg, index) => (
                                                <div
                                                    key={index}
                                                    className={`message ${
                                                        msg.isMine ? 'mine' : 'theirs'
                                                    }`}
                                                >
                                                    {!msg.isMine && (
                                                        <Avatar
                                                            onClick={() =>
                                                                navigateWithAnimation(
                                                                    `/citizen/${msg.author}`,
                                                                    `/`,
                                                                )
                                                            }
                                                            src={msg.photo}
                                                            className="avatar"
                                                        />
                                                    )}
                                                    <div className="message-box">
                                                        <div
                                                            style={{
                                                                textAlign: msg.isMine
                                                                    ? 'right'
                                                                    : 'left',
                                                            }}
                                                            className="sender-name"
                                                        >
                                                            {msg.name}
                                                        </div>
                                                        <div
                                                            className={`message-content ${
                                                                msg.isMine ? 'mine' : 'theirs'
                                                            }`}
                                                        >
                                                            {msg.text}
                                                        </div>
                                                    </div>
                                                    {msg.isMine && (
                                                        <Avatar
                                                            onClick={() =>
                                                                navigateWithAnimation(
                                                                    `/citizen/${msg.author}`,
                                                                    `/`,
                                                                )
                                                            }
                                                            src={msg.photo}
                                                            className="avatar"
                                                        />
                                                    )}
                                                </div>
                                            ))
                                        ) : (
                                            <NoResult subtitle={t('homepage.chat.no_messages')} />
                                        )
                                    ) : (
                                        <NoResult
                                            title={t('homepage.chat.no_perms.title')}
                                            subtitle={t('homepage.chat.no_perms.subtitle')}
                                        />
                                    )}
                                    <div ref={messagesEndRef} />
                                </div>
                                <div className="message-input">
                                    <Input
                                        placeholder={t('homepage.chat.send')}
                                        value={messageText}
                                        onChange={handleInputChange}
                                        onPressEnter={handleSendMessage}
                                        disabled={!haveMessagesPerms}
                                        suffix={
                                            <Button
                                                disabled={!haveMessagesPerms}
                                                type="primary"
                                                onClick={handleSendMessage}
                                            >
                                                <IoSend />
                                            </Button>
                                        }
                                    />
                                </div>
                            </div>
                        </Card>
                    </Col>

                    <Col
                        span={8}
                        style={{ display: 'flex', flexDirection: 'column', maxHeight: '100%' }}
                    >
                        <Card
                            className="quicksearch-container"
                            style={{ marginBottom: '16px', flex: 1 }}
                        >
                            <h2 className="title">{t('homepage.search.title')}</h2>
                            <p className="subtitle">{t('homepage.search.description')}</p>
                            <Input
                                className="ant-input-no-focus-border"
                                placeholder={t('homepage.search.search')}
                                prefix={<MdOutlineSearch />}
                                disabled={!haveSearchPerms}
                                onChange={handleSearchChange}
                            />
                            <div className="homepage-search-items">
                                {haveSearchPerms ? (
                                    isSearchLoading ? (
                                        <div
                                            style={{
                                                display: 'flex',
                                                justifyContent: 'center',
                                                alignItems: 'center',
                                                height: '100%',
                                            }}
                                        >
                                            <div
                                                style={{ transform: 'scale(1)' }}
                                                className="lds-ripple"
                                            >
                                                <div></div>
                                                <div></div>
                                            </div>
                                        </div>
                                    ) : quickSearchResults &&
                                      quickSearchResults.length > 0 &&
                                      searchTerm &&
                                      searchTerm.length > 0 ? (
                                        quickSearchResults.map((item) => (
                                            <div
                                                key={item.value}
                                                style={{
                                                    border: `1px solid ${theme.components.Card.colorBorderSecondary}`,
                                                }}
                                                className="search-result-item"
                                                onClick={() =>
                                                    navigateWithAnimation(
                                                        `/${item.type}/${item.value}`,
                                                        `/`,
                                                    )
                                                }
                                            >
                                                {quickSearchIcons[item.type]}
                                                <span>{item.label}</span>
                                                <MdKeyboardDoubleArrowRight
                                                    style={{ cursor: 'pointer' }}
                                                />
                                            </div>
                                        ))
                                    ) : searchTerm && searchTerm.length > 0 ? (
                                        <NoResult
                                            title={t('homepage.search.not_found.title')}
                                            subtitle={t('homepage.search.not_found.subtitle')}
                                        />
                                    ) : (
                                        <NoResult
                                            title={t('homepage.search.no_input.title')}
                                            subtitle={t('homepage.search.no_input.subtitle')}
                                        />
                                    )
                                ) : (
                                    <NoResult
                                        title={t('homepage.search.no_perms.title')}
                                        subtitle={t('homepage.search.no_perms.subtitle')}
                                    />
                                )}
                            </div>
                        </Card>
                        <Card className="fp-container" style={{ flex: 1.5, height: '67%' }}>
                            <h2 className="title">{t('homepage.doctors.title')}</h2>
                            <p className="subtitle">{t('homepage.doctors.description')}</p>
                            <div className="fp-grid">
                                {doctors && doctors.length > 0 ? (
                                    doctors.map((doctor, index) => (
                                        <div
                                            key={index}
                                            style={{
                                                border: `1px solid ${theme.components.Card.colorBorderSecondary}`,
                                            }}
                                            className="doctor-container"
                                        >
                                            <div className="left">
                                                <Avatar
                                                    src={doctor.img}
                                                    alt={doctor.name}
                                                    shape="square"
                                                    style={{
                                                        objectFit: 'cover',
                                                        backgroundColor:
                                                            'rgba(255, 255, 255, 0.25)',
                                                    }}
                                                    size={70}
                                                    icon={<GiPoliceOfficerHead />}
                                                />
                                            </div>
                                            <div className="right">
                                                <h2>{doctor.name}</h2>
                                                <div className="badges">
                                                    <div
                                                        style={{
                                                            backgroundColor:
                                                                'rgba(233, 58, 58, 0.34)',
                                                        }}
                                                        className="line"
                                                    >
                                                        <CiStar
                                                            style={{
                                                                backgroundColor:
                                                                    'rgba(233, 58, 58, 1)',
                                                            }}
                                                        />
                                                        <p>{doctor.grade}</p>
                                                    </div>
                                                    <div
                                                        style={{
                                                            backgroundColor:
                                                                'rgba(233, 128, 58, 0.34)',
                                                        }}
                                                        className="line"
                                                    >
                                                        <HiOutlineBadgeCheck
                                                            style={{
                                                                backgroundColor:
                                                                    'rgba(233, 128, 58, 1)',
                                                            }}
                                                        />
                                                        <p>{doctor.badge}</p>
                                                    </div>
                                                    {doctor.radio && doctor.radio > 0 ? (
                                                        <div
                                                            style={{
                                                                backgroundColor:
                                                                    'rgba(58, 99, 233, 0.34)',
                                                            }}
                                                            className="line"
                                                        >
                                                            <SiStatuspal
                                                                style={{
                                                                    backgroundColor:
                                                                        'rgba(58, 99, 233, 1)',
                                                                }}
                                                            />
                                                            <p>{doctor.radio}.00 MhZ</p>
                                                        </div>
                                                    ) : null}
                                                </div>
                                            </div>
                                        </div>
                                    ))
                                ) : (
                                    <NoResult
                                        title={t('homepage.doctors.noresult.title')}
                                        subtitle={t('homepage.doctors.noresult.subtitle')}
                                    />
                                )}
                            </div>
                        </Card>
                    </Col>
                    <Col
                        span={8}
                        style={{ display: 'flex', flexDirection: 'column', height: '100%' }}
                    >
                        <Card className="dispatch-container" style={{ height: '100%' }}>
                            <div className="notification-header">
                                <h2 className="title">{t('homepage.dispatch.title')}</h2>
                                <p className="subtitle">{t('homepage.dispatch.description')}</p>
                            </div>
                            <div className="notification-container">
                                {dispatchNotifs && Object.values(dispatchNotifs).length > 0 ? (
                                    <>
                                        {Object.values(dispatchNotifs)
                                            .sort((a, b) => b.id - a.id)
                                            .map((notification, index) => (
                                                <DispatchNotification
                                                    key={notification.id}
                                                    notification={notification}
                                                    onClick={() =>
                                                        setSelectedDispatchNotif(notification)
                                                    }
                                                    selected={
                                                        selectedDispatchNotif === notification
                                                            ? true
                                                            : false
                                                    }
                                                />
                                            ))}
                                        <Button
                                            onClick={() => navigateWithAnimation(`/dispatch`, '/t')}
                                            type="default"
                                        >
                                            {t('homepage.dispatch.more')}
                                        </Button>
                                    </>
                                ) : (
                                    <NoResult
                                        title={t('homepage.dispatch.noresult.title')}
                                        subtitle={t('homepage.dispatch.noresult.subtitle')}
                                    />
                                )}
                            </div>
                        </Card>
                    </Col>
                </Row>
            </div>
        </PageProvider>
    )
}

export default HomePage
