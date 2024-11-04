import { notification } from "antd";
import React, { createContext, useContext, ReactNode, useEffect } from "react";
import { NotificationProps } from "../types";

interface NotificationProviderProps {
    children: ReactNode;
}

const NotificationContext = createContext<(props: NotificationProps) => void>(() => {});

export const NotificationProvider: React.FC<NotificationProviderProps> = ({ children }) => {
    const [api, contextHolder] = notification.useNotification({
        stack: false
    });

    const showNotification = ({ title, description, type, duration }: NotificationProps) => {
        api[type]({
            message: title,
            description: description,
            duration: duration || 5
        });
    };


    return (
        <NotificationContext.Provider value={showNotification}>
            {contextHolder}
            {children}
        </NotificationContext.Provider>
    );
};

export const useNotification = () => {
    return useContext(NotificationContext);
};
