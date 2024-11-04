import React, { createContext, useContext, useEffect, useState } from 'react'
import { DispatchNotifications } from '../types'
import DispatchNotification from '../pages/Dispatch/DispatchNotification'
import { isEnvBrowser } from '../utils/misc'

interface DispatchContextProps {
    addDispatchNotification: (notification: DispatchNotifications) => void
    playSound: (sound: string) => void
    setVolume: (volume: number) => void
    volume: number
}

const DispatchContext = createContext<DispatchContextProps | undefined>(undefined)

const saveVolumeToLocalStorage = (volume: number) => {
    localStorage.setItem('EMSdispatchVolume', volume.toString())
}

const getVolumeFromLocalStorage = (): number => {
    const volume = localStorage.getItem('EMSdispatchVolume')
    return volume ? parseFloat(volume) : 1
}

export const DispatchProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    const [dispatchNotifications, setDispatchNotifications] = useState<DispatchNotifications[]>([])
    const [exitingNotifications, setExitingNotifications] = useState<number[]>([])
    const [volume, setVolumeState] = useState<number>(getVolumeFromLocalStorage())

    const setVolume = (volume: number) => {
        setVolumeState(volume)
        saveVolumeToLocalStorage(volume)
    }

    const addDispatchNotification = (notification: DispatchNotifications) => {
        setDispatchNotifications((prev) => [...prev, notification])

        setTimeout(() => {
            removeDispatchNotification(notification.id)
        }, notification.duration || 8000)
    }

    const removeDispatchNotification = (id: number) => {
        setExitingNotifications((prev) => [...prev, id])
        setTimeout(() => {
            setDispatchNotifications((prev) => prev.filter((n) => n.id !== id))
            setExitingNotifications((prev) => prev.filter((exitingId) => exitingId !== id))
        }, 500)
    }

    const playSound = (sound: string) => {
        const audio = new Audio(`./public/sounds/${sound}.mp3`)
        audio.volume = volume
        audio.play().catch((error) => {
            console.error('Failed to play sound:', error)
        })
    }

    useEffect(() => {
        const handleEvent = (event: any) => {
            if (event.data.action === 'dispatchNotification') {
                const { sound, ...notificationData } = event.data.data
                addDispatchNotification(notificationData)

                playSound(sound || 'default')
            }
        }

        window.addEventListener('message', handleEvent)

        return () => {
            window.removeEventListener('message', handleEvent)
        }
    }, [volume])

    return (
        <DispatchContext.Provider value={{ addDispatchNotification, playSound, setVolume, volume }}>
            {children}
            <div
                style={{
                    position: 'fixed',
                    top: 0,
                    right: 0,
                    margin: '5px',
                    zIndex: 1000,
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'flex-end',
                    gap: '5px',
                }}
            >
                {dispatchNotifications
                    .sort((a, b) => b.id - a.id)
                    .map((notification) => (
                        <DispatchNotification
                            key={notification.id}
                            notification={notification}
                            onClick={() => {}}
                            selected={false}
                            provider
                            isExiting={exitingNotifications.includes(notification.id)}
                            onExitComplete={() => removeDispatchNotification(notification.id)}
                        />
                    ))}
            </div>
        </DispatchContext.Provider>
    )
}

export const useDispatch = () => {
    const context = useContext(DispatchContext)
    if (context === undefined) {
        throw new Error('useDispatch must be used within a DispatchProvider')
    }
    return context
}

export const getVolume = () => {
    return getVolumeFromLocalStorage()
}
