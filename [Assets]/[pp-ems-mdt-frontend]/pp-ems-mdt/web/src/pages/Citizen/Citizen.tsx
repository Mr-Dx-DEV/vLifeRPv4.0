import React, { useContext, useEffect, useState } from 'react'
import { useParams, useLocation } from 'react-router-dom'
import { PageProvider } from '../../providers/PageProvider'
import {
    Input,
    Divider,
    Button,
    Tag,
    Modal,
    List,
    Image,
    Tooltip,
    Calendar,
    Badge,
    Alert,
} from 'antd'
import './Citizen.scss'
import { fetchNui } from '../../utils/fetchNui'
import { ThemeContext } from '../../providers/ThemeProvider'
import { FaCogs, FaUserAlt, FaUser, FaCar, FaBriefcaseMedical } from 'react-icons/fa'
import { FaRegNoteSticky } from 'react-icons/fa6'
import { BsCalendarDateFill } from 'react-icons/bs'
import { BiIdCard } from 'react-icons/bi'
import { TbWorld } from 'react-icons/tb'
import moment, { Moment } from 'moment'
import NoResult from '../../components/NoResult'
import { useCamera } from '../../hooks/useCamera'
import { isValidImageUrl, navigateWithAnimation } from '../../utils/misc'
import { formatDate } from '../../utils'
import { Case } from '../../types'
import { t } from '../../hooks/useLocale'
import dayjs, { Dayjs } from 'dayjs'
import LinesEllipsis from 'react-lines-ellipsis'
import { hasPermission } from '../../utils/permissions'
const { Search } = Input

interface CitizenProps {
    img: string
    name: string
    ssn: number
    dob: string
    nationality: string
    cases: Case[]
    notes: {
        title: string
        description: string
        id: number
    }[]
}

const Citizen = () => {
    const { theme } = useContext(ThemeContext)
    const { id } = useParams<{ id: string }>()
    const [citizenData, setCitizenData] = useState<CitizenProps>()
    const [searchTerm, setSearchTerm] = useState('')
    const [isPageLoading, setIsPageLoading] = useState(true)
    const [isPasteLinkModalVisible, setIsPasteLinkModalVisible] = useState(false)
    const [isRemovePhotoModalVisible, setIsRemovePhotoModalVisible] = useState(false)
    const [linkInput, setLinkInput] = useState('')
    const [linkInputError, setLinkInputError] = useState<string | null>(null)
    const location = useLocation()
    const [isCalendarOpen, setIsCalendarOpen] = useState(false)
    const [imageValid, setImageValid] = useState(false)
    const havePhotoPerms = hasPermission('citizen.photo')
    const haveCasePerms = hasPermission('citizen.viewcases')
    const haveNotesPerms = hasPermission('citizen.viewnotes')
    const [selectedCalendarDate, setSelectedCalendarDate] = useState<Dayjs | null>(null)

    const fetchCitizen = () => {
        fetchNui('getCitizenDetails', { identifier: id })
            .then((response: any) => {
                if (response.img) {
                    isValidImageUrl(response.img).then((value: boolean) => {
                        setImageValid(value)
                    })
                }
                setCitizenData(response)
            })
            .finally(() => {
                setIsPageLoading(false)
            })
    }

    useEffect(() => {
        fetchCitizen()
    }, [id])

    const filteredRecords = citizenData?.cases
        .sort((a, b) => b.id - a.id)
        .filter((casee) => casee.title.toLowerCase().includes(searchTerm.toLowerCase()))

    const calculateAge = (dob: string) => {
        const dateFormats = ['YYYY-MM-DD', 'DD-MM-YYYY', 'MM-DD-YYYY']
        const birthDate = moment(dob, dateFormats)
        if (!birthDate.isValid()) {
            return 'Invalid date'
        }
        return moment().diff(birthDate, 'years')
    }

    const takePhoto = async () => {
        const result = await useCamera()
        if (result) {
            setIsPageLoading(true)
            fetchNui('updateCitizenPhoto', { identifier: id, url: result }).then(() => {
                fetchCitizen()
            })
        }
    }

    const handlePasteLink = () => {
        setIsPasteLinkModalVisible(true)
    }

    const handleRemovePhoto = () => {
        setIsRemovePhotoModalVisible(true)
    }

    const handleOpenCalendar = () => {
        setIsCalendarOpen(true)
    }

    const confirmPasteLink = async () => {
        isValidImageUrl(linkInput)
            .then((value: boolean) => {
                if (value) {
                    setIsPageLoading(true)
                    fetchNui('updateCitizenPhoto', { identifier: id, url: linkInput }).then(() => {
                        fetchCitizen()
                    })
                    setIsPasteLinkModalVisible(false)
                    setLinkInputError(null)
                } else {
                    setLinkInputError(t('citizen.photo.invalid_url'))
                    throw new Error('')
                }
            })
            .catch((error) => {
                setLinkInputError(t('citizen.photo.not_found'))
            })
    }

    const confirmRemovePhoto = () => {
        setIsPageLoading(true)
        fetchNui('updateCitizenPhoto', { identifier: id, url: '' }).then(() => {
            fetchCitizen()
        })
        setIsRemovePhotoModalVisible(false)
    }

    const previousSearchParams = new URLSearchParams(location.search)
    const page = previousSearchParams.get('page') || '1'
    const search = previousSearchParams.get('search') || ''
    const onBackUrl = `/citizens?page=${page}&search=${search}`
    const events =
        citizenData?.cases
            ?.filter((caseItem) => {
                let parsedInjuries
                if (typeof caseItem.injuries === 'string') {
                    try {
                        parsedInjuries = JSON.parse(caseItem.injuries)
                    } catch (e) {
                        console.error('Error parsing injuries JSON:', e)
                        parsedInjuries = null
                    }
                } else {
                    parsedInjuries = caseItem.injuries
                }

                return parsedInjuries && parsedInjuries.injuries?.length > 0
            })
            ?.map((caseItem) => {
                let injuriesData
                if (typeof caseItem.injuries === 'string') {
                    injuriesData = JSON.parse(caseItem.injuries)
                } else {
                    injuriesData = caseItem.injuries
                }

                const eventDate = moment(caseItem.date)
                return injuriesData.injuries.map(
                    (injury: {
                        id: number
                        bodyPart: string
                        price: number
                        type: string
                        x: number
                        y: number
                    }) => ({
                        date: eventDate,
                        title: injury.type,
                        caseId: caseItem.id,
                    }),
                )
            })
            ?.flat() || []


    const getEventsForDate = (currentDate: Dayjs) => {
        return events.filter((event) => {
            const eventDateStr = dayjs(event.date.toDate()).format('YYYY-MM-DD')

            const currentDateStr = currentDate.format('YYYY-MM-DD')
            return eventDateStr === currentDateStr
        })
    }

    const cellRender = (currentDate: Dayjs, info: any) => {
        const eventsForDate = getEventsForDate(currentDate)
        return (
            <ul className="citizen-calendar-events">
                {eventsForDate.map((event, index) => (
                    <li key={index}>
                        <span className="dot"></span>
                        <span className="title">{event.title}</span>
                    </li>
                ))}
            </ul>
        )
    }

    const onBack = location.state?.onBack || onBackUrl
    return (
        <PageProvider
            title={t('citizen.title')}
            description={t('citizen.description')}
            loading={isPageLoading}
            onBack={onBack}
        >
            {citizenData ? (
                <div className="citizen-container">
                    <div
                        style={{
                            border: `1px solid ${theme.components.Card.colorBorderSecondary}`,
                            padding: '20px',
                        }}
                        className="left"
                    >
                        <h2>{t('citizen.cases.title')}</h2>
                        <Search
                            placeholder={t('citizen.cases.search')}
                            onSearch={(value) => setSearchTerm(value)}
                            style={{ margin: '0 0 20px 0' }}
                            disabled={!haveCasePerms}
                        />
                        {haveCasePerms ? (
                            filteredRecords && filteredRecords.length > 0 ? (
                                <List
                                    bordered
                                    dataSource={filteredRecords}
                                    renderItem={(item) => (
                                        <List.Item
                                            className={`record-list`}
                                            style={{ cursor: 'pointer' }}
                                            onClick={() =>
                                                navigateWithAnimation(`/case/${item.id}`)
                                            }
                                        >
                                            <List.Item.Meta
                                                avatar={<FaBriefcaseMedical />}
                                                title={`${item.title}`}
                                                description={`${formatDate(item.date)}`}
                                            />
                                        </List.Item>
                                    )}
                                />
                            ) : (
                                <NoResult align="top" />
                            )
                        ) : (
                            <NoResult
                                title={t('global.no_perms_title')}
                                subtitle={t('global.no_perms')}
                            />
                        )}
                    </div>
                    <div
                        style={{
                            border: `1px solid ${theme.components.Card.colorBorderSecondary}`,
                            padding: '20px',
                        }}
                        className="right"
                    >
                        <div className="upper">
                            <div className="citizen-img">
                                <div className={`img-wrapper`}>
                                    {imageValid ? (
                                        <Image
                                            width={180}
                                            height={230}
                                            src={citizenData.img}
                                            alt={citizenData.name}
                                        />
                                    ) : (
                                        <div
                                            style={{
                                                width: '180px',
                                                height: '230px',
                                                display: 'flex',
                                                justifyContent: 'center',
                                                alignItems: 'center',
                                            }}
                                        >
                                            <FaUserAlt style={{ fontSize: '4em' }} />
                                        </div>
                                    )}
                                </div>
                                {havePhotoPerms ? (
                                    <div
                                        style={{ opacity: havePhotoPerms ? `1.0` : `0.6` }}
                                        className="controls"
                                    >
                                        <Button onClick={() => takePhoto()} type="default">
                                            {t('citizen.photo.take')}
                                        </Button>
                                        <Button onClick={handlePasteLink} type="default">
                                            {t('citizen.photo.url.button')}
                                        </Button>
                                        <Button onClick={handleRemovePhoto} type="default">
                                            {t('citizen.photo.remove.button')}
                                        </Button>
                                    </div>
                                ) : (
                                    <Tooltip title={t('global.no_perms')}>
                                        <div style={{ opacity: `0.6` }} className="controls">
                                            <Button
                                                disabled
                                                onClick={() => takePhoto()}
                                                type="default"
                                            >
                                                {t('citizen.photo.take')}
                                            </Button>
                                            <Button
                                                disabled
                                                onClick={handlePasteLink}
                                                type="default"
                                            >
                                                {t('citizen.photo.url.button')}
                                            </Button>
                                            <Button
                                                disabled
                                                onClick={handleRemovePhoto}
                                                type="default"
                                            >
                                                {t('citizen.photo.remove.button')}
                                            </Button>
                                        </div>
                                    </Tooltip>
                                )}
                            </div>

                            <div className="citizen-info">
                                {citizenData.name && (
                                    <div id="info">
                                        <div className="title">
                                            {t('citizen.info.name')}
                                            <FaUser className="icon" />
                                        </div>
                                        <div className="data">{citizenData.name}</div>
                                    </div>
                                )}
                                <div id="info-row">
                                    {citizenData.dob && (
                                        <div id="info">
                                            <div className="title">
                                                {t('citizen.info.dob')}
                                                <BsCalendarDateFill className="icon" />
                                            </div>
                                            <div className="data">
                                                {t('citizen.info.dob_format', {
                                                    dob: citizenData.dob,
                                                    dob_calculated: calculateAge(
                                                        citizenData.dob,
                                                    ) as string,
                                                })}
                                            </div>
                                        </div>
                                    )}
                                    {citizenData.ssn && (
                                        <div id="info">
                                            <div className="title">
                                                {t('global.ssn')}
                                                <BiIdCard className="icon" />
                                            </div>
                                            <div className="data">{citizenData.ssn}</div>
                                        </div>
                                    )}
                                </div>
                                {citizenData.nationality && (
                                    <div id="info">
                                        <div className="title">
                                            {t('citizen.info.nationality')}
                                            <TbWorld className="icon" />
                                        </div>
                                        <div className="data">{citizenData.nationality}</div>
                                    </div>
                                )}
                                <div id="info">
                                    <div className="title">
                                        {t('citizen.info.actions.title')}
                                        <FaCogs className="icon" />
                                    </div>
                                    <div
                                        className="data"
                                        style={{
                                            justifyContent: 'center',
                                            alignItems: 'center',
                                            display: 'flex',
                                        }}
                                    >
                                        <Button
                                            type="default"
                                            onClick={() =>
                                                navigateWithAnimation(
                                                    `/cases?type=incident&title=Case ${citizenData.name}&citizens=["${id}"]`,
                                                    `/citizen/${id}`,
                                                )
                                            }
                                        >
                                            {t('citizen.info.actions.incident')}
                                        </Button>

                                        <Button type="default" onClick={handleOpenCalendar}>
                                            Open events calendar
                                        </Button>

                                        <Button
                                            type="default"
                                            onClick={() =>
                                                navigateWithAnimation(
                                                    `/notes?&title=Note ${encodeURIComponent(
                                                        citizenData.name,
                                                    )}&citizens=["${id}"]`,
                                                    `/citizen/${id}`,
                                                )
                                            }
                                        >
                                            {t('citizen.info.actions.note')}
                                        </Button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="bottom">
                            <Divider orientation="center">{t('citizen.notes')}</Divider>
                            <div className="notes-list">
                                {haveNotesPerms ? (
                                    citizenData.notes && citizenData.notes.length > 0 ? (
                                        citizenData.notes.map((note, index) => (
                                            <div
                                                className="note-card"
                                                style={{
                                                    border: `1px solid ${theme.components.Card.colorBorderSecondary}`,
                                                }}
                                                key={index}
                                                onClick={() =>
                                                    navigateWithAnimation(
                                                        `/note/${note.id}`,
                                                        `/citizen/${id}`,
                                                    )
                                                }
                                            >
                                                <div className="upper">
                                                    <div className="note-icon">
                                                        <FaRegNoteSticky />
                                                    </div>
                                                    <div className="note-info">
                                                        <h2>{note.title}</h2>
                                                    </div>
                                                </div>
                                                <div>
                                                    <LinesEllipsis
                                                        text={note.description}
                                                        maxLine={4}
                                                        style={{
                                                            color: 'rgba(255, 255, 255, 0.6)',
                                                        }}
                                                        ellipsis={'...'}
                                                    />
                                                    {}
                                                </div>
                                            </div>
                                        ))
                                    ) : (
                                        <NoResult />
                                    )
                                ) : (
                                    <NoResult
                                        title={t('global.no_perms_title')}
                                        subtitle={t('global.no_perms')}
                                    />
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            ) : (
                <NoResult />
            )}

            <Modal
                title={t('citizen.photo.url.title')}
                visible={isPasteLinkModalVisible}
                onOk={confirmPasteLink}
                centered
                onCancel={() => {
                    setIsPasteLinkModalVisible(false)
                    setLinkInputError(null)
                }}
            >
                <Input
                    placeholder={t('citizen.photo.url.placeholder')}
                    value={linkInput}
                    onChange={(e) => setLinkInput(e.target.value)}
                    status={linkInputError ? 'error' : ''}
                />
                {linkInputError && <div style={{ color: 'red' }}>{linkInputError}</div>}
            </Modal>

            <Modal
                title={t('citizen.photo.remove.title')}
                centered
                visible={isRemovePhotoModalVisible}
                onOk={confirmRemovePhoto}
                onCancel={() => setIsRemovePhotoModalVisible(false)}
            >
                <p>{t('citizen.photo.remove.description')}</p>
            </Modal>
            <Modal
                title="Calendar"
                width={'90vh'}
                centered
                open={isCalendarOpen}
                onClose={() => setIsCalendarOpen(false)}
                onCancel={() => setIsCalendarOpen(false)}
                footer={false}
            >
                {selectedCalendarDate
                    ? (() => {
                          const eventsForDate = getEventsForDate(selectedCalendarDate)
                          return eventsForDate.length > 0 ? (
                              <Alert
                                  type="error"
                                  message={
                                      <div className="calendar-events-alert-content">
                                          <span>{`Injuries: ${eventsForDate
                                              .map((event) => event.title)
                                              .join(', ')}`}</span>
                                          <Button
                                              type="primary"
                                              onClick={() => {
                                                  setIsCalendarOpen(false)
                                                  navigateWithAnimation(
                                                      `/case/${eventsForDate[0]?.caseId}`,
                                                      `/citizen/${id}`,
                                                  )
                                              }}
                                          >
                                              Go to case
                                          </Button>
                                      </div>
                                  }
                              />
                          ) : null
                      })()
                    : null}

                <Calendar
                    className="citizen-calendar"
                    onSelect={(date: Dayjs) => setSelectedCalendarDate(date)}
                    onPanelChange={(date: Dayjs) => setSelectedCalendarDate(date)}
                    cellRender={cellRender}
                />
            </Modal>
        </PageProvider>
    )
}

export default Citizen
