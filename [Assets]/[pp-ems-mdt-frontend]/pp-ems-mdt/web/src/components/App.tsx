import React, { useEffect, useState } from 'react'
import { Routes, Route, useLocation, useNavigate, Navigate } from 'react-router-dom'
import { Layout, Menu, Typography } from 'antd'
import { IoIosHome, IoMdExit } from 'react-icons/io'
import { MdAnnouncement, MdOutlineEventNote } from 'react-icons/md'
import { PiUsersFourFill } from 'react-icons/pi'
import { AnimatePresence, motion } from 'framer-motion'
import { IoDocumentText } from 'react-icons/io5'
import { FaBriefcase, FaCogs } from 'react-icons/fa'
import HomePage from '../pages/HomePage/HomePage'
import Announcements from '../pages/Announcements/Announcements'
import Citizens from '../pages/Citizens/Citizens'
import './App.scss'
import Citizen from '../pages/Citizen/Citizen'
import Dispatch from '../pages/Dispatch/Dispatch'
import Cases from '../pages/Cases/Cases'
import Notes from '../pages/Notes/Notes'
import Settings from '../pages/Settings/Settings'
import { fetchNui } from '../utils/fetchNui'
import { isEnvBrowser } from '../utils/misc'
import Case from '../pages/Case/Case'
import Sider from 'antd/es/layout/Sider'
import Patrols from '../pages/Patrols/Patrols'
import { FaPersonWalking } from 'react-icons/fa6'
import Note from '../pages/Note/Note'
import Announcement from '../pages/Announcement/Announcement'
import { fetchPermissions, hasPermission } from '../utils/permissions'
import { useNotification } from '../providers/NotificationProvider'
import { fetchTranslations, t } from '../hooks/useLocale'

const pages = [
    {
        path: '/',
        icon: <IoIosHome />,
        content: <HomePage />,
        inNav: true,
    },
    {
        path: '/announcements',
        icon: <MdAnnouncement />,
        content: <Announcements />,
        inNav: true,
        highlightPaths: ['/announcement'],
        permission: 'announcements.view',
    },
    {
        path: '/announcement/:id',
        content: <Announcement />,
        inNav: false,
    },
    {
        path: '/patrols',
        icon: <FaPersonWalking />,
        content: <Patrols />,
        inNav: true,
        permission: 'patrols.view',
    },
    {
        path: '/citizens',
        icon: <PiUsersFourFill />,
        content: <Citizens />,
        inNav: true,
        highlightPaths: ['/citizen'],
        permission: 'citizens.view',
    },
    {
        path: '/citizen/:id',
        content: <Citizen />,
        inNav: false,
    },
    {
        path: '/dispatch',
        icon: <IoDocumentText />,
        content: <Dispatch />,
        inNav: true,
    },
    {
        path: '/cases',
        icon: <FaBriefcase />,
        content: <Cases />,
        inNav: true,
        highlightPaths: ['/case'],
        permission: 'cases.view',
    },
    {
        path: '/case/:id',
        content: <Case />,
        inNav: false,
    },
    {
        path: '/notes',
        icon: <MdOutlineEventNote />,
        content: <Notes />,
        inNav: true,
        highlightPaths: ['/note'],
        permission: 'notes.view',
    },
    {
        path: '/note/:id',
        content: <Note />,
        inNav: false,
    },
    {
        path: '/settings',
        icon: <FaCogs />,
        content: <Settings />,
        inNav: true,
        permission: 'settings.view',
    },
]

const AnimatedRoutes = () => {
    const location = useLocation()

    return (
        <AnimatePresence mode="wait">
            <Routes location={location} key={location.pathname}>
                {pages.map(({ path, content }) => (
                    <Route
                        key={path}
                        path={path}
                        element={
                            <motion.div
                                initial={{ opacity: 0, scale: 0.9 }}
                                animate={{ opacity: 1, scale: 1 }}
                                exit={{ opacity: 0, scale: 0.9 }}
                                transition={{ duration: 0.5 }}
                            >
                                {content}
                            </motion.div>
                        }
                    />
                ))}
                <Route path="*" element={<Navigate to="/" />} />
            </Routes>
        </AnimatePresence>
    )
}

const App = () => {
    const [isVisible, setIsVisible] = useState(isEnvBrowser())
    const navigate = useNavigate()
    const location = useLocation()
    const showNotification = useNotification()

    useEffect(() => {
        fetchTranslations()
        fetchPermissions()
        fetchNui('UILoaded')
    }, [])

    const handleMenuClick = (path: string, onBack?: string) => {
        if (path === 'exit') {
            close()
            return
        }
        if (location.pathname !== path) {
            navigate(path, { state: { onBack: onBack ?? null } })
        }
    }

    const close = () => {
        fetchNui('close')
        setIsVisible(false)
    }

    useEffect(() => {
        const handleKeyDown = (event: KeyboardEvent) => {
            if (event.key === 'Escape') {
                close()
            }
        }

        if (!isEnvBrowser()) {
            window.addEventListener('keydown', handleKeyDown)
        }

        return () => {
            window.removeEventListener('keydown', handleKeyDown)
        }
    }, [])

    const notificationTitle: Record<string, string> = {
        error: t('global.notifications.error'),
        success: t('global.notifications.success'),
        info: t('global.notifications.info'),
        warning: t('global.notifications.warning'),
    }

    useEffect(() => {
        const handleMessage = (event: MessageEvent) => {
            if (event.data.action === 'open') {
                fetchPermissions()

                setIsVisible(true)
                if (event.data.navigate) {
                    navigate(event.data.navigate)
                }
            } else if (event.data.action === 'close') {
                close()
            } else if (event.data.action === 'navigate') {
                handleMenuClick(event.data.path, event.data.onBack)
            } else if (event.data.action === 'showNotification') {
                if (!event.data.type || !event.data.message) return
                showNotification({
                    title: notificationTitle[event.data.type],
                    description: event.data.message || 'Description',
                    type: event.data.type,
                    duration: event.data.duration,
                })
            }
        }

        window.addEventListener('message', handleMessage)

        return () => {
            window.removeEventListener('message', handleMessage)
        }
    }, [navigate])


    return (
        <AnimatePresence>
            {isVisible && (
                <motion.div
                    className="app-container"
                    initial={{ opacity: 0, scale: 0.8 }}
                    animate={{ opacity: 1, scale: 1 }}
                    exit={{ opacity: 0, scale: 0.8 }}
                    transition={{ duration: 0.5 }}
                >
                    <Layout className="site-layout">
                        <Sider
                            theme="dark"
                            breakpoint="lg"
                            width={250}
                            className="sider-layout"
                            collapsedWidth="0"
                        >
                            <div className="sider-logo">
                                <img src={`./public/eelogo.png`} alt="Logo" className="logo-img" />
                            </div>
                            <MenuComponent handleMenuClick={handleMenuClick} />
                        </Sider>
                        <Layout.Content style={{ backgroundColor: 'red !important' }}>
                            <AnimatedRoutes />
                        </Layout.Content>
                    </Layout>
                </motion.div>
            )}
        </AnimatePresence>
    )
}

const MenuComponent = ({ handleMenuClick }: { handleMenuClick: (path: string) => void }) => {
    const location = useLocation()

    const getHighlightedKey = () => {
        for (const page of pages) {
            if (page.highlightPaths) {
                for (const highlightPath of page.highlightPaths) {
                    if (location.pathname.startsWith(highlightPath)) {
                        return page.path
                    }
                }
            }
            if (location.pathname === page.path) {
                return page.path
            }
        }
        return location.pathname
    }

    return (
        <div className="menu-container">
            <div className="main-menu">
                <Menu
                    theme="dark"
                    mode="inline"
                    selectedKeys={[getHighlightedKey()]}
                    className="menu"
                >
                    {pages
                        .filter(
                            (page) =>
                                page.inNav && (!page.permission || hasPermission(page.permission)),
                        )
                        .map((page) => (
                            <Menu.Item
                                onClick={() => handleMenuClick(page.path as string)}
                                key={page.path}
                                icon={page.icon}
                            >
                                {t(
                                    `navigation.${
                                        page.path === '/' ? 'homepage' : page.path.slice(1)
                                    }`,
                                )}
                            </Menu.Item>
                        ))}
                </Menu>
            </div>
            <div className="exit-menu">
                <Menu theme="dark" mode="inline" className="exit-menu">
                    <Menu.Item
                        onClick={() => handleMenuClick('exit')}
                        key={'exit'}
                        icon={<IoMdExit />}
                        className="exit-item"
                    >
                        {t('navigation.exit')}
                    </Menu.Item>
                </Menu>
            </div>
        </div>
    )
}

export default App
