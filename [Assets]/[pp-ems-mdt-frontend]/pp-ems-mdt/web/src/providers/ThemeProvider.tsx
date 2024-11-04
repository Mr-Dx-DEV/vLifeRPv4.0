import React, { createContext, useState, ReactNode, useEffect } from 'react'
import _ from 'lodash'

export const defaultTheme = {
    token: {
        colorBgContainer: '#260405',
        colorTextBase: 'white',
        colorBorder: '#371F1F',
        colorPrimaryBorder: '#371F1F',
        colorPrimary: '#E91014',
        colorPrimaryHover: '#E91014',
        colorBgElevated: '#260405',
        colorText: 'rgb(255, 255, 255)',
        colorTextPrimary: 'rgba(255, 255, 255, 0.6)',
    },
    components: {
        Layout: {
            headerBg: '#260405',
            siderBg: '#260405',
            bodyBg: '#110202',
        },
        Menu: {
            darkItemBg: 'rgba(25, 117, 204, 0)',
            darkItemSelectedBg: 'transparent',
            iconSize: 19,
            itemMarginInline: 0,
            itemMarginBlock: 6,
            fontSize: 17,
            itemHeight: 21,
        },
        Typography: {
            colorText: 'rgb(255, 255, 255)',
        },
        Input: {
            activeBg: 'rgba(255, 255, 255, 0)',
            colorTextPlaceholder: 'gray',
            colorBorder: '#371F1F',
        },
        Card: {
            colorBorderSecondary: '#371F1F',
        },
        Tooltip: {
            colorBgSpotlight: '#E91014',
        },
        Message: {
            contentBg: 'rgb(32, 56, 116)',
            colorText: 'rgb(255, 255, 255)',
        },
        Tabs: {
            itemColor: 'rgba(212, 211, 211, 0.88)',
            lineWidth: 1,
        },
        Table: {
            colorText: 'rgb(255, 255, 255)',
        },
        Collapse: {
            colorBorder: '#371F1F',
        },
        Tag: {
            defaultBg: 'transparent',
            colorFillSecondary: 'rgba(0, 0, 0, 0.45)',
        },
        Divider: {
            colorSplit: '#E91014',
            colorTextHeading: 'white',
        },
        Notification: {
            colorBgElevated: '#260405',
        },
        Select: {
            colorBgElevated: '#260405',
            colorBorder: '#371F1F',
            optionSelectedBg: 'rgba(255, 255, 255, 0.1);',
        },
        Modal: {
            contentBg: '#260405',
            headerBg: 'transparent',
        },
        Alert: {
            colorErrorBg: 'rgba(255, 242, 240, 0.15)',
        },
    },
}

export const ThemeContext = createContext({
    theme: defaultTheme,
    updateTheme: (newTheme: any) => {},
    resetTheme: () => {},
})

const mergeWithDefaultTheme = (customTheme: any) => {
    return _.merge({}, defaultTheme, customTheme)
}

const generateCssVariables = (theme: any, prefix: string = '--') => {
    const variables: { [key: string]: string } = {}

    const generate = (obj: any, currentPrefix: string) => {
        for (const key in obj) {
            if (typeof obj[key] === 'object' && obj[key] !== null) {
                generate(obj[key], `${currentPrefix}-${key}`)
            } else {
                variables[`${currentPrefix}-${key}`] = obj[key]
            }
        }
    }

    generate(theme, prefix)
    return variables
}

const applyCssVariables = (variables: { [key: string]: string | null }) => {
    const root = document.documentElement
    Object.entries(variables).forEach(([key, value]) => {
        root.style.setProperty(key, value || '')
    })
}

export const ThemeProvider = ({ children }: { children: ReactNode }) => {
    const [theme, setTheme] = useState(() => {
        const savedTheme = localStorage.getItem('EMSthemee')
        return savedTheme ? mergeWithDefaultTheme(JSON.parse(savedTheme)) : defaultTheme
    })

    useEffect(() => {
        const cssVariables = generateCssVariables(theme)
        applyCssVariables(cssVariables)
        localStorage.setItem('EMSthemee', JSON.stringify(theme))
    }, [theme])

    const updateTheme = (newTheme: any) => {
        if (!newTheme) return
        const mergedTheme = mergeWithDefaultTheme(newTheme)
        setTheme(mergedTheme)
        const cssVariables = generateCssVariables(mergedTheme)
        applyCssVariables(cssVariables)
        localStorage.setItem('EMSthemee', JSON.stringify(mergedTheme))
    }

    const resetTheme = () => {
        setTheme(defaultTheme)
        const cssVariables = generateCssVariables(defaultTheme)
        applyCssVariables(cssVariables)
        localStorage.setItem('EMSthemee', JSON.stringify(defaultTheme))
    }

    return (
        <ThemeContext.Provider value={{ theme, updateTheme, resetTheme }}>
            {children}
        </ThemeContext.Provider>
    )
}
