import React, { createContext, useContext, useState, Dispatch, SetStateAction } from 'react';
import { Layout } from 'antd';
import { motion, AnimatePresence } from 'framer-motion';
const { Header, Content } = Layout;
import '../components/App.scss';
import { ThemeContext } from './ThemeProvider';
import { IoCaretBackCircle } from 'react-icons/io5';
import { useNavigate } from 'react-router-dom';
import { isEnvBrowser, navigateWithAnimation } from '../utils/misc';

interface PageContextType {
    pageTitle: string;
    setPageTitle: Dispatch<SetStateAction<string>>;
    pageDescription: string;
    setPageDescription: Dispatch<SetStateAction<string>>;
}

const PageContext = createContext<PageContextType | null>(null);
export const usePage = () => useContext(PageContext);

interface PageProviderProps {
    title: string;
    description: string;
    children: React.ReactNode;
    loading?: boolean;
    onBack?: string;
}

export const PageProvider = ({
    title,
    description,
    children,
    loading = !isEnvBrowser(),
    onBack,
}: PageProviderProps) => {
    const { theme } = useContext(ThemeContext);
    const [pageTitle, setPageTitle] = useState(title);
    const [pageDescription, setPageDescription] = useState(description);

    const handleBackClick = () => {
        if (onBack) {
            navigateWithAnimation(onBack);
        }
    };

    return (
        <PageContext.Provider
            value={{ pageTitle, setPageTitle, pageDescription, setPageDescription }}
        >
            <Layout>
                <Header className="header">
                    <div>
                        <div style={{ display: 'flex' }}>
                            {onBack && (
                                <IoCaretBackCircle
                                    style={{ cursor: 'pointer' }}
                                    onClick={handleBackClick}
                                />
                            )}
                            <h2>{pageTitle}</h2>
                        </div>
                        <p>{pageDescription}</p>
                    </div>
                </Header>
                <Content
                    style={{ backgroundColor: theme.components.Layout.bodyBg }}
                    className="content"
                >
                    <div style={{ position: 'relative', height: '100%' }}>
                        <AnimatePresence mode="wait">
                            {loading && (
                                <motion.div
                                    key="loading"
                                    initial={{ opacity: 1 }}
                                    animate={{ opacity: 1 }}
                                    exit={{ opacity: 0 }}
                                    transition={{ duration: 0.5 }}
                                    style={{
                                        display: 'flex',
                                        justifyContent: 'center',
                                        alignItems: 'center',
                                        position: 'absolute',
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        zIndex: 10,  // Ensure loading stays above content
                                    }}
                                >
                                    <div className="lds-ripple">
                                        <div></div>
                                        <div></div>
                                    </div>
                                </motion.div>
                            )}
                        </AnimatePresence>
                        <AnimatePresence mode="wait"> 
                            {!loading && (
                                <motion.div
                                    key="content"
                                    className="site-layout-background"
                                    initial={{ opacity: 0, scale: 0.95 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    exit={{ opacity: 0, scale: 0.95 }}
                                    transition={{ duration: 0.5, delay: 0.5 }}
                                >
                                    {children}
                                </motion.div>
                            )}
                        </AnimatePresence>
                    </div>
                </Content>
            </Layout>
        </PageContext.Provider>
    );
};
