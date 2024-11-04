import React, { useContext, useState } from 'react'
import { PageProvider } from '../../providers/PageProvider'
import { ColorPicker, Slider, Button, Divider } from 'antd'
import { ThemeContext } from '../../providers/ThemeProvider'
import { useDispatch, getVolume } from '../../providers/DispatchProvider'
import './Settings.scss'
import { isEnvBrowser } from '../../utils/misc'
import { t } from '../../hooks/useLocale'
type ThemeType = {
    token: {
        colorBgContainer: string
        colorTextBase: string
        colorPrimaryBorder: string
        [key: string]: string
    }
    components: {
        Layout: {
            headerBg: string
            siderBg: string
            bodyBg: string
        }
        Menu: {
            darkItemBg: string
            darkItemSelectedBg: string
            iconSize: number
            itemMarginInline: number
            itemMarginBlock: number
            fontSize: number
            itemHeight: number
        }
        [key: string]: any
    }
}

const Settings = () => {
    const { theme, updateTheme, resetTheme } = useContext(ThemeContext)
    const [tempColors, setTempColors] = useState<ThemeType>(theme)
    const { setVolume, playSound, volume } = useDispatch()
    const currentVolume = getVolume()

    const handleColorChange = (properties: string[]) => (value: any) => {
        const { r, g, b, a } = value.rgb || value.metaColor
        const rgbaColor = `rgba(${r}, ${g}, ${b}, ${a})`

        setTempColors((prevColors: ThemeType) => {
            let updatedColors = { ...prevColors }
            properties.forEach((property) => {
                const [category, ...rest] = property.split('.')
                const key = rest.join('.')
                if (category === 'token') {
                    updatedColors = {
                        ...updatedColors,
                        token: {
                            ...updatedColors.token,
                            [key]: rgbaColor,
                        },
                    }
                } else if (category === 'components') {
                    const [component, subKey] = rest
                    if (!updatedColors.components[component]) {
                        updatedColors.components[component] = {} as any
                    }
                    updatedColors = {
                        ...updatedColors,
                        components: {
                            ...updatedColors.components,
                            [component]: {
                                ...updatedColors.components[component],
                                [subKey]: rgbaColor,
                            },
                        },
                    }
                }
            })
            return updatedColors
        })
    }

    const handleColorChangeComplete = (properties: string[]) => (value: any) => {
        const { r, g, b, a } = value.rgb || value.metaColor
        const rgbaColor = `rgba(${r}, ${g}, ${b}, ${a})`

        const newTheme = { ...theme } as ThemeType

        properties.forEach((property) => {
            const [category, ...rest] = property.split('.')
            const key = rest.join('.')
            if (category === 'token') {
                newTheme.token = {
                    ...newTheme.token,
                    [key]: rgbaColor,
                }
            } else if (category === 'components') {
                const [component, subKey] = rest
                if (!newTheme.components[component]) {
                    newTheme.components[component] = {} as any
                }
                newTheme.components[component][subKey] = rgbaColor
            }
        })

        updateTheme(newTheme)
    }

    const testPlaySound = () => {
        const soundPath = './public/sounds/default.mp3'
        const audio = new Audio(soundPath)
        audio.volume = volume
        audio.play().catch((error) => {
            console.error('Failed to play sound:', error)
        })
    }

    return (
        <PageProvider
            loading={false}
            title={t('settings.title')}
            description={t('settings.description')}
        >
            <div className="settings-container">
                <div className="left">
                    <Divider orientation="left">{t('settings.colors')}</Divider>
                    <div className="row">
                        <h2>{t('settings.color1')}</h2>
                        <ColorPicker
                            disabledAlpha
                            value={tempColors.token.colorBgContainer}
                            onChange={handleColorChange([
                                'token.colorBgContainer',
                                'components.Layout.headerBg',
                                'components.Layout.siderBg',
                                'token.colorBgElevated'
                            ])}
                            onChangeComplete={handleColorChangeComplete([
                                'token.colorBgContainer',
                                'components.Layout.headerBg',
                                'components.Layout.siderBg',
                                'token.colorBgElevated'
                            ])}
                        />
                    </div>
                    <div className="row">
                        <h2>{t('settings.color2')}</h2>
                        <ColorPicker
                            disabledAlpha
                            value={tempColors.components.Layout.bodyBg}
                            onChange={handleColorChange(['components.Layout.bodyBg'])}
                            onChangeComplete={handleColorChangeComplete([
                                'components.Layout.bodyBg',
                            ])}
                        />
                    </div>
                    <div className="row">
                        <h2>{t('settings.color3')}</h2>
                        <ColorPicker
                            style={{ width: '100%' }}
                            disabledAlpha
                            value={tempColors.token.colorPrimary}
                            onChange={handleColorChange(['token.colorPrimary'])}
                            onChangeComplete={handleColorChangeComplete(['token.colorPrimary'])}
                        />
                    </div>
                    <div className="row">
                        <h2>{t('settings.textColor')}</h2>
                        <ColorPicker
                            disabledAlpha
                            value={tempColors.token.colorTextBase}
                            onChange={handleColorChange(['token.colorTextBase', 'token.colorText'])}
                            onChangeComplete={handleColorChangeComplete([
                                'token.colorTextBase',
                                'token.colorText',
                            ])}
                        />
                    </div>
                    <div className="row">
                        <h2>{t('settings.textColor2')}</h2>
                        <ColorPicker
                            disabledAlpha
                            value={tempColors.token.colorTextPrimary}
                            onChange={handleColorChange(['token.colorTextPrimary'])}
                            onChangeComplete={handleColorChangeComplete(['token.colorTextPrimary'])}
                        />
                    </div>
                    <div className="row">
                        <h2>{t('settings.borderColor')}</h2>
                        <ColorPicker
                            disabledAlpha
                            value={tempColors.token.colorPrimaryBorder}
                            onChange={handleColorChange([
                                'token.colorPrimaryBorder',
                                'token.colorBorder',
                                'components.Input.colorBorder',
                                'components.Card.colorBorderSecondary',
                                'components.Collapse.colorBorder',
                                'components.Select.colorBorder',
                            ])}
                            onChangeComplete={handleColorChangeComplete([
                                'token.colorPrimaryBorder',
                                'token.colorBorder',
                                'components.Input.colorBorder',
                                'components.Card.colorBorderSecondary',
                                'components.Collapse.colorBorder',
                                'components.Select.colorBorder',
                            ])}
                        />
                    </div>
                    <Button onClick={resetTheme} style={{ marginTop: '20px' }}>
                        {t('settings.resetButton')}
                    </Button>
                </div>
                <div className="right">
                    <Divider orientation="left">{t('settings.notifications')}</Divider>
                    <div className="row">
                        <h2>{t('settings.volume')}</h2>
                        <Slider
                            min={1}
                            max={100}
                            step={1}
                            value={volume * 100}
                            onChange={(value) => setVolume(value / 100)}
                            onChangeComplete={testPlaySound}
                            style={{ width: '95%' }}
                        />
                    </div>
                </div>
            </div>
        </PageProvider>
    )
}

export default Settings
