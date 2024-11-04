import React, { useEffect, useState, forwardRef, useContext } from 'react'
import { ThemeContext } from '../../providers/ThemeProvider'
import { Avatar, Button, Tooltip } from 'antd'
import { LuTimer } from 'react-icons/lu'
import formatRelativeTime from '../../utils'
import { IoLocationOutline } from 'react-icons/io5'
import { MdKeyboardDoubleArrowRight } from 'react-icons/md'
import { AiOutlineUser } from 'react-icons/ai'
import { GrUserPolice } from 'react-icons/gr'
import { DispatchNotifications } from '../../types'
import { GiPistolGun } from 'react-icons/gi'
import { useConfig } from '../../hooks/useConfig'
import { t } from '../../hooks/useLocale'
import { fetchNui } from '../../utils/fetchNui'
import { showNotification } from '../../utils/misc'

interface DispatchNotificationProps {
    notification: DispatchNotifications
    onClick: () => void
    selected?: boolean
    provider?: boolean
    isExiting?: boolean
    onExitComplete?: () => void
    onCancelSelect?: () => void
}

const availableColors = ['blue', 'pink', 'orange', 'green', 'cyan', 'purple', 'black', 'red']

const getRandomColor = () => {
    return availableColors[Math.floor(Math.random() * availableColors.length)]
}

const DispatchNotification = forwardRef<HTMLDivElement, DispatchNotificationProps>(
    (
        {
            notification,
            onClick,
            selected,
            provider = false,
            isExiting = false,
            onExitComplete,
            onCancelSelect,
        },
        ref,
    ) => {
        const { theme } = useContext(ThemeContext)
        const [notif, setNotif] = useState(notification)
        const [color, setColor] = useState<string>(
            availableColors.includes(notification.code.color)
                ? notification.code.color
                : getRandomColor(),
        )
        const [animationClass, setAnimationClass] = useState<string>(
            provider ? 'notification-enter' : '',
        )
        const [distance, setDistance] = useState<string | null>(null)
        const config = useConfig()

        useEffect(() => {
            if (provider) {
                const enterTimeout = setTimeout(() => {
                    setAnimationClass('')
                }, 500)

                return () => {
                    clearTimeout(enterTimeout)
                }
            }
        }, [provider, notif.id])

        useEffect(() => {
            if (isExiting) {
                setAnimationClass('notification-exit')
                const exitTimeout = setTimeout(() => {
                    if (onExitComplete) {
                        onExitComplete()
                    }
                }, 500)

                return () => {
                    clearTimeout(exitTimeout)
                }
            }
        }, [isExiting, onExitComplete, notif.id])

        useEffect(() => {
            const interval = setInterval(() => {
                setNotif((prevNotif) => ({
                    ...prevNotif,
                    timestamp: prevNotif.timestamp,
                }))
            }, 1000)

            return () => clearInterval(interval)
        }, [])

        if (notif.coords) {
            fetchNui('getDistance', { coords: notif.coords }).then((response: any) => {
                setDistance(response)
            })
        }

        useEffect(() => {
            if (notif.coords) {
                const interval = setInterval(async () => {
                    fetchNui('getDistance', { coords: notif.coords }).then((response: any) => {
                        setDistance(response)
                    })
                }, 1000)

                return () => clearInterval(interval)
            }
        }, [notif.coords])

        const handleStopRespond = () => {
            fetchNui('dispatchStopRespond', { id: notif.id })
                .then((response: any) => {
                    if (response.success && response.respond) {
                        showNotification(
                            response.message || t('dispatch.notification.stoprespond.success'),
                            'success',
                        )

                        setNotif((prevNotif) => ({
                            ...prevNotif,
                            responds: response.respond,
                            meResponding: false,
                        }))
                    } else {
                        showNotification(
                            response.message || t('dispatch.notification.stoprespond.failure'),
                            'error',
                        )
                    }
                })
                .catch((error) => {
                    console.error('Respond error:', error)
                    showNotification(t('dispatch.notification.respond.failure'), 'error')
                })
        }

        const handleRespond = () => {
            fetchNui('dispatchRespond', { id: notif.id })
                .then((response: any) => {
                    if (response.success && response.respond) {
                        showNotification(
                            response.message || t('dispatch.notification.success'),
                            'success',
                        )
                        setNotif((prevNotif) => ({
                            ...prevNotif,
                            responds: [...(prevNotif.responds || []), ...response.respond],
                            meResponding: true,
                        }))
                    } else {
                        showNotification(
                            response.message || 'Nie udało się zareagować na zgłoszenie.',
                            'error',
                        )
                    }
                })
                .catch((error) => {
                    console.error('Respond error:', error)
                    showNotification(
                        'Nie udało się zareagować na zgłoszenie. Spróbuj ponownie później',
                        'error',
                    )
                })
        }

        const handleCancel = () => {
            onCancelSelect && onCancelSelect()
        }

        return (
            <div
                ref={ref}
                style={{
                    border: `1px solid ${theme.components.Card.colorBorderSecondary}`,
                    userSelect: 'none',
                    cursor: 'pointer',
                }}
                className={`dispatch-notification-card ${
                    selected ? 'selected' : ''
                } ${animationClass} ${notif.flash ? 'flash' : ''} ${
                    notif.meResponding ? 'responding' : ''
                }`}
                onClick={onClick}
            >
                <div className="notification-title">
                    <span className={`notification-tag red`}>#{notif.id}</span>
                    {notif.code?.code && (
                        <span
                            className={`notification-tag ${
                                notif.weapon && config.dispatch.weaponColors
                                    ? config.dispatch.weaponColors[notif.weapon]
                                    : color
                            }`}
                        >
                            {notif.code.code}
                        </span>
                    )}
                    <h4>{notif.title}</h4>
                </div>

                <div className="notification-content">
                    <p>{notif.description}</p>
                    <Tooltip title={`${new Date(notif.timestamp * 1000).toLocaleString()}`}>
                        <div className="notification-content-line">
                            <LuTimer />
                            <p className="notification-content-label">
                                {t('dispatch.notification.report_time')}:{' '}
                            </p>
                            <p
                                className="notification-content-data"
                                style={{ width: 'fit-content' }}
                            >
                                {`${formatRelativeTime(notif.timestamp)} ago`}
                            </p>
                        </div>
                    </Tooltip>
                    {notif.coords && (
                        <div className="notification-content-line">
                            <IoLocationOutline />
                            <p className="notification-content-label">
                                {t('dispatch.notification.location')}:{' '}
                            </p>
                            <p className="notification-content-data">{notif.street} - </p>
                            {distance && (
                                <p
                                    style={{ color: 'var(---token-colorTextPrimary)' }}
                                    className="notification-content-data"
                                >
                                    {distance}
                                </p>
                            )}
                            <MdKeyboardDoubleArrowRight className="clickable-icon" />
                        </div>
                    )}
                    {notif.weapon && (
                        <div className="notification-content-line">
                            <GiPistolGun />
                            <p className="notification-content-label">
                                {t('dispatch.notification.weapon')}:{' '}
                            </p>
                            <p className="notification-content-data">{notif.weapon}</p>
                        </div>
                    )}
                    {notif.citizen?.value && (
                        <div className="notification-content-line">
                            <AiOutlineUser />
                            <p className="notification-content-label">
                                {t('dispatch.notification.citizen')}:{' '}
                            </p>
                            <p className="notification-content-data">{notif.citizen.label}</p>
                        </div>
                    )}
                    {notif.citizen?.gender && (
                        <div className="notification-content-line">
                            <AiOutlineUser />
                            <p className="notification-content-label">
                                {t('dispatch.notification.gender')}:{' '}
                            </p>
                            <p className="notification-content-data">{notif.citizen.gender}</p>
                        </div>
                    )}
                    {notif.responds && notif.responds.length > 0 && (
                        <div className="notification-content-line">
                            <GrUserPolice />
                            <p className="notification-content-label">
                                {t('dispatch.notification.responds')}:{' '}
                            </p>
                            <div
                                style={{ display: 'flex', marginLeft: '5px', alignItems: 'center' }}
                            >
                                <Avatar.Group>
                                    {notif.responds.map((doctor, idx) => (
                                        <Tooltip title={doctor.label} key={idx}>
                                            <Avatar
                                                style={{
                                                    backgroundColor: theme.token.colorPrimary,
                                                }}
                                            >
                                                {doctor.label?.charAt(0)}
                                            </Avatar>
                                        </Tooltip>
                                    ))}
                                </Avatar.Group>
                            </div>
                        </div>
                    )}

                    {selected && (
                        <>
                            {!notif.meResponding ? (
                                <div className="buttons">
                                    <Button onClick={handleRespond} type="primary">
                                        {t('dispatch.notification.respond.label')}
                                    </Button>
                                    <Button onClick={handleCancel} type="default">
                                        {t('global.cancel')}
                                    </Button>
                                </div>
                            ) : (
                                <div className="buttons">
                                    <Button onClick={handleStopRespond} type="primary">
                                        {t('dispatch.notification.stoprespond.button')}
                                    </Button>
                                    <Button onClick={handleCancel} type="default">
                                        {t('global.cancel')}
                                    </Button>
                                </div>
                            )}
                        </>
                    )}
                </div>
            </div>
        )
    },
)

export default DispatchNotification
