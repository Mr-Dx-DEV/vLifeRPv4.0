import React, { useEffect } from 'react'
import ReactDOM from 'react-dom/client'
import App from './components/App'
import './index.css'
import { ConfigProvider } from './hooks/useConfig'
import { ConfigProvider as AntdConfigProvider } from 'antd'
import { ThemeProvider, ThemeContext } from './providers/ThemeProvider'
import { NotificationProvider } from './providers/NotificationProvider'
import { BrowserRouter as Router } from 'react-router-dom'
import { DispatchProvider } from './providers/DispatchProvider'
import { isEnvBrowser } from './utils/misc'

const Main = () => {
    useEffect(() => {
        if (isEnvBrowser()) {
            const base = document.createElement('base')
            base.href = '/web/build/'
            document.head.appendChild(base)

            return () => {
                document.head.removeChild(base)
            }
        }
    }, [])

    return (
        <ThemeProvider>
            <ThemeContext.Consumer>
                {({ theme }) => (
                    <AntdConfigProvider theme={theme}>
                        <DispatchProvider>
                            <NotificationProvider>
                                <Router>
                                    <App />
                                </Router>
                            </NotificationProvider>
                        </DispatchProvider>
                    </AntdConfigProvider>
                )}
            </ThemeContext.Consumer>
        </ThemeProvider>
    )
}

ReactDOM.createRoot(document.getElementById('root')!).render(
    <React.StrictMode>
        <ConfigProvider>
            <Main />
        </ConfigProvider>
    </React.StrictMode>,
)
