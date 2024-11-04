import { Avatar, Input, Tag, Pagination } from 'antd'
import React, { useContext, useEffect, useState } from 'react'
import { useNavigate, useLocation, createSearchParams } from 'react-router-dom'
import './Citizens.scss'
import { citizensProps } from '../../types'
import { ThemeContext } from '../../providers/ThemeProvider'
import { FaIdCard, FaUserAlt } from 'react-icons/fa'
import { FaArrowRightToBracket } from 'react-icons/fa6'
import { PageProvider } from '../../providers/PageProvider'
import { fetchNui } from '../../utils/fetchNui'
import { isValidImageUrl, navigateWithAnimation } from '../../utils/misc'
import { t } from '../../hooks/useLocale'
import NoResult from '../../components/NoResult'

const Citizens = () => {
    const [isPageLoading, setIsPageLoading] = useState(true)
    const { theme } = useContext(ThemeContext)
    const [citizens, setCitizens] = useState<citizensProps[]>([])
    const [currentPage, setCurrentPage] = useState(1)
    const [totalCitizens, setTotalCitizens] = useState(0)
    const [searchTerm, setSearchTerm] = useState('')
    const [validImages, setValidImages] = useState<{ [key: string]: boolean }>({})
    const pageSize = 20

    const checkImageValidity = async (imgUrl: string, identifier: string) => {
        const isValid = await isValidImageUrl(imgUrl)
        setValidImages((prev: any) => ({ ...prev, [identifier]: isValid }))
    }

    const navigate = useNavigate()
    const location = useLocation()

    const fetchCitizens = (page: number, search = '') => {
        fetchNui('getCitizens', { page: page, search: search })
            .then((response: any) => {
                if (Array.isArray(response.data)) {
                    setCitizens(response.data)
                    setTotalCitizens(response.total)
                    response.data.forEach((citizen: citizensProps) => {
                        if (citizen.img) {
                            checkImageValidity(citizen.img, citizen.identifier)
                        }
                    })
                } else {
                    setCitizens([])
                }
                setIsPageLoading(false)
            })
            .catch(() => {
                setCitizens([])
                setIsPageLoading(false)
            })
    }

    useEffect(() => {
        const query = new URLSearchParams(location.search)
        const page = parseInt(query.get('page') || '1', 10)
        const search = query.get('search') || ''
        setCurrentPage(page)
        setSearchTerm(search)
        fetchCitizens(page, search)
    }, [location.search])

    const handlePageChange = (page: number) => {
        navigate({
            search: createSearchParams({ page: page.toString(), search: searchTerm }).toString(),
        })
        setCurrentPage(page)
    }

    const handleSearchChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const search = e.target.value
        setSearchTerm(search)
        setCurrentPage(1)
        navigate({
            search: createSearchParams({ page: '1', search: search }).toString(),
        })
    }

    return (
        <PageProvider
            title={t('citizens.title')}
            description={t('citizens.description')}
            loading={isPageLoading}
        >
            <div className="citizens-container">
                <Input
                    className="search"
                    type="default"
                    placeholder={t('citizens.search')}
                    value={searchTerm}
                    onChange={handleSearchChange}
                />
                <div className="citizens-list">
                    {citizens.length > 0 ? (
                        citizens.map((item) => (
                            <div
                                key={item.identifier}
                                className="citizen"
                                style={{
                                    border: `1px solid ${theme.components.Card.colorBorderSecondary}`,
                                    cursor: 'pointer',
                                }}
                                onClick={() =>
                                    navigateWithAnimation(
                                        `/citizen/${item.identifier}${location.search}`, 
                                    )
                                }
                            >
                                <Avatar
                                    src={validImages[item.identifier] ? item.img : undefined}
                                    className="avatar"
                                    shape="square"
                                    style={{ objectFit: 'cover' }}
                                    size={60}
                                    icon={!validImages[item.identifier] ? <FaUserAlt /> : undefined}
                                />

                                <div className="name">
                                    <h2>{item.name}</h2>
                                    <div className="bottom">
                                        {item.ssn && (
                                            <div className="ssn">
                                                <FaIdCard />
                                                <p className="label">{t('global.ssn')}: </p>
                                                <p className="number">{item.ssn}</p>
                                            </div>
                                        )}
                                        {item.wanted && <Tag color="red">{t('global.wanted')}</Tag>}
                                    </div>
                                </div>
                                <FaArrowRightToBracket className="enter" />
                            </div>
                        ))
                    ) : (
                        <NoResult align="top" />
                    )}
                </div>
                <Pagination
                    current={currentPage}
                    pageSize={pageSize}
                    total={totalCitizens}
                    onChange={handlePageChange}
                    showSizeChanger={false}
                />
            </div>
        </PageProvider>
    )
}

export default Citizens
