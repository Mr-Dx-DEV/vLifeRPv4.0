import React, { createContext, useContext, useState, useCallback } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';

interface NavigationContextType {
    navigateWithAnimation: (path: string) => void;
    isAnimatingIn: boolean;
    isAnimatingOut: boolean;
}

const NavigationContext = createContext<NavigationContextType | null>(null);

const NavigationProvider = ({ children }: { children: React.ReactNode }) => {
    const [isAnimatingOut, setIsAnimatingOut] = useState(false);
    const [isAnimatingIn, setIsAnimatingIn] = useState(false);
    const navigate = useNavigate();
    const location = useLocation();

    const navigateWithAnimation = useCallback((path: string) => {
        if (location.pathname !== path) {
            setIsAnimatingOut(true);
            setTimeout(() => {
                navigate(path);
                setIsAnimatingIn(true);
                setIsAnimatingOut(false);
                setTimeout(() => setIsAnimatingIn(false), 500);
            }, 500);
        }
    }, [location.pathname, navigate]);

    return (
        <NavigationContext.Provider value={{ navigateWithAnimation, isAnimatingIn, isAnimatingOut }}>
            {children}
        </NavigationContext.Provider>
    );
};

export const useNavigation = () => useContext(NavigationContext);

export { NavigationProvider };
