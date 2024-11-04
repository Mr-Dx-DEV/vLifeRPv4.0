import React, { useState, useEffect, createContext, useContext, ReactNode } from "react";
import { fetchNui } from "../utils/fetchNui";

let config: any = null;

const ConfigContext = createContext<any | null>(null);

export const fetchConfig = (): Promise<any> => {
    if (config === null) {
        return fetchNui("getConfig").then((result) => {
            config = result;
            return config;
        });
    } else {
        return Promise.resolve(config);
    }
};

interface ConfigProviderProps {
    children: ReactNode;
}

export const ConfigProvider = ({ children }: ConfigProviderProps) => {
    const [configState, setConfigState] = useState<any | null>(null);

    useEffect(() => {
        fetchConfig().then((config) => {
            setConfigState(config);
        });
    }, []);

    return (
        <ConfigContext.Provider value={configState}>
            {children}
        </ConfigContext.Provider>
    );
};

export const useConfig = () => {
    return useContext(ConfigContext);
};
