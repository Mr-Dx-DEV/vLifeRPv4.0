import React, { useContext, useEffect, useState } from 'react'
import { PageProvider } from '../../providers/PageProvider'
import { Dayjs } from 'dayjs'
import {
    Form,
    Input,
    Button,
    List,
    Modal,
    Select,
    Divider,
    Empty,
    Slider,
    Row,
    Col,
    DatePicker,
    Radio,
    Badge,
    Menu,
    Dropdown,
    Tooltip,
    Tag,
} from 'antd'
import { useLocation } from 'react-router-dom'
import './Cases.scss'
import { ThemeContext } from '../../providers/ThemeProvider'
import { fetchNui } from '../../utils/fetchNui'
import { getBodyPartByCoordinates, showNotification } from '../../utils/misc'
import moment from 'moment'
import 'moment/locale/pl'
import { FaBriefcaseMedical, FaMinus, FaPlus } from 'react-icons/fa6'
import { formatDate } from '../../utils'
const { TextArea } = Input
const { Option } = Select
import { GrDocumentTime, GrDocumentVerified, GrDocument } from 'react-icons/gr'
import { TbPrison } from 'react-icons/tb'
import { Case } from '../../types'
import { navigateWithAnimation } from '../../utils/misc'
import { t } from '../../hooks/useLocale'
import { hasPermission } from '../../utils/permissions'
import NoResult from '../../components/NoResult'
import { useConfig } from '../../hooks/useConfig'

type OptionType = {
    value: string
    label: string
}

const Cases = () => {
    const [form] = Form.useForm()
    const [cases, setCases] = useState<Case[]>([])
    const [injuriesModalVisible, setInjurieModalVisible] = useState(false)
    const [injuryOptions, setInjuryOptions] = useState<
        { name: string; price: number; onlyForRegion?: string }[]
    >([
        { name: 'Oparzenie', price: 1000, onlyForRegion: 'Głowa' },
        { name: 'Złamanie', price: 1500, onlyForRegion: 'Lewe ramie' },
        { name: 'Krwawienie', price: 500, onlyForRegion: 'Klatka piersiowa' },
        { name: 'Zawroty głowy', price: 700, onlyForRegion: 'Głowa' },
    ])
    const config = useConfig()
    const [totalFine, setTotalFine] = useState<number>(0)
    const [finePercentage, setFinePercentage] = useState<number>(100)
    const { theme } = useContext(ThemeContext)
    const location = useLocation()
    const [searchCasesTerm, setSearchCasesTerm] = useState<string>('')
    const [isPageLoading, setIsPageLoading] = useState(true)
    const [isButtonLoading, setIsButtonLoading] = useState(false)
    const [citizens, setCitizens] = useState<OptionType[]>([])
    const [doctors, setDoctors] = useState<OptionType[]>([])
    const haveListPerms = hasPermission('cases.listview')
    const haveCreatePerms = hasPermission('cases.create')
    const [isAddingCustomInjury, setIsAddingCustomInjury] = useState(false)
    const [customInjury, setCustomInjury] = useState('')

    const [selectedPosition, setSelectedPosition] = useState<{
        x: number
        y: number
        bodyPart: string
    } | null>(null)
    const [injuryMarkers, setInjuryMarkers] = useState<
        { x: number; y: number; type: string; bodyPart: string; id: number; price: number }[]
    >([])

    const saveFormValuesToLocalStorage = (values: any) => {
        try {
            localStorage.setItem('EMSformValues', JSON.stringify(values))
        } catch (error) {
            console.error('Error saving to localStorage:', error)
        }
    }

    const loadFormValuesFromLocalStorage = () => {
        try {
            const storedValues = localStorage.getItem('EMSformValues')
            const parsedValues = storedValues ? JSON.parse(storedValues) : null
            return {
                ...parsedValues,
                injuries: parsedValues?.injuries || [],
            }
        } catch (error) {
            console.error('Error loading from localStorage:', error)
            return null
        }
    }

    useEffect(() => {
        try {
            const storedValues = loadFormValuesFromLocalStorage()
            const params = new URLSearchParams(location.search)

            const title = params.get('title') || storedValues?.title || ''
            const citizens = params.get('citizens')
                ? JSON.parse(params.get('citizens') || '[]')
                : storedValues?.citizens || []
            const doctors = params.get('doctors')?.split(',') || storedValues?.doctors || []
            const injuries = params.get('injuries')
                ? JSON.parse(params.get('injuries') || '[]')
                : storedValues?.injuries || []

            form.setFieldsValue({
                title,
                citizens,
                doctors,
                injuries,
            })

            setTotalFine(totalFine)
        } catch (error) {
            console.error('Error processing form values:', error)
        }
    }, [location.search])

    const fetchCases = () => {
        fetchNui('getCases', { query: searchCasesTerm })
            .then((data: any) => {
                try {
                    setCases(data || [])
                    setIsPageLoading(false)
                } catch (err) {
                    console.error('Error parsing cases data:', err)
                }
            })
            .catch((err) => console.error('Error fetching cases:', err))
    }

    const fetchInjuriess = () => {
        fetchNui('getInjuryOptions')
            .then((data: any) => {
                try {
                    setInjuryOptions(data)
                } catch (err) {
                    console.error('Error parsing injuries data:', err)
                }
            })
            .catch((err) => console.error('Error fetching injuries:', err))
    }

    useEffect(() => {
        fetchCases()
        fetchInjuriess()
    }, [])

    useEffect(() => {
        fetchCases()
    }, [searchCasesTerm])

    const handleSearch = (type: string, value: string) => {
        fetchNui(`search${type}`, { query: value || '' })
            .then((data: any = []) => {
                switch (type) {
                    case 'Citizens':
                        setCitizens(data || [])
                        break
                    case 'Doctors':
                        setDoctors(data || [])
                        break
                    default:
                        break
                }
            })
            .catch((err) => console.error(`Error fetching ${type.toLowerCase()}:`, err))
    }

    useEffect(() => {
        handleSearch('Citizens', '')
        handleSearch('Doctors', '')
    }, [])

    const handleSubmit = (values: any) => {
        if (injuryMarkers.length === 0) {
            form.setFields([{ name: 'injuries', errors: [t('cases.form.errors.injuries')] }])
        } else {
            setIsButtonLoading(true)
            const fineReduction = 100 - finePercentage

            const formattedCitizens = values.citizens.map((citizen: any) => ({
                identifier: citizen.value,
                name: citizen.label,
            }))

            const payload = {
                ...values,
                citizens: formattedCitizens,
                injuries: injuryMarkers,
                fineReduction,
            }

            fetchNui('submitCase', { values: payload })
                .then((response: any) => {
                    if (response?.success) {
                        navigateWithAnimation(`/case/${response.caseId}`)
                        localStorage.removeItem('EMSformValues')
                    } else {
                        if (response.type) {
                            form.setFields([{ name: response.type, errors: [response.message] }])
                        } else {
                            showNotification(
                                response.message || t('cases.form.errors.submit'),
                                'error',
                            )
                        }
                    }
                })
                .catch((error) => {
                    console.error('Error submitting case:', error)
                    showNotification(t('cases.form.errors.submit'), 'error')
                })
                .finally(() => {
                    setIsButtonLoading(false)
                })
        }
    }

    const handleImageClick = (e: React.MouseEvent<HTMLImageElement>) => {
        const rect = e.currentTarget.getBoundingClientRect()
        const x = e.clientX - rect.left
        const y = e.clientY - rect.top

        const bodyPart = getBodyPartByCoordinates(config.bodyRegions, x, y)

        setSelectedPosition({ x, y, bodyPart })
        setIsDropdownVisible(true)
    }

    const handleAddCustomInjuryMarker = () => {
        if (customInjury.trim() && selectedPosition) {
            const newMarker = {
                ...selectedPosition,
                type: customInjury,
                bodyPart: selectedPosition.bodyPart,
                price: 0,
                id: Date.now(),
            }

            setInjuryMarkers([...injuryMarkers, newMarker])

            setCustomInjury('')
            setIsAddingCustomInjury(false)
            setSelectedPosition(null)
            setIsDropdownVisible(false)
        }
    }

    const handleInjurySelect = (injuryName: string) => {
        if (selectedPosition) {
            const selectedInjury = injuryOptions.find((option) => option.name === injuryName)
            if (selectedInjury) {
                const newMarker = {
                    ...selectedPosition,
                    type: selectedInjury.name,
                    bodyPart: selectedPosition.bodyPart,
                    price: selectedInjury.price,
                    id: Date.now(),
                }

                setInjuryMarkers([...injuryMarkers, newMarker])

                setSelectedPosition(null)
                setIsDropdownVisible(false)
            }
        }
    }

    const menu = (
        <Menu>
            {injuryOptions
                .filter(
                    (option) =>
                        !option.onlyForRegion ||
                        option.onlyForRegion === selectedPosition?.bodyPart,
                )
                .map((option) => (
                    <Menu.Item key={option.name} onClick={() => handleInjurySelect(option.name)}>
                        {option.name}
                    </Menu.Item>
                ))}

            <Menu.Item
                key="add"
                onMouseLeave={() => {
                    if (!customInjury.trim()) {
                        setIsAddingCustomInjury(false)
                    }
                }}
                onMouseEnter={() => setIsAddingCustomInjury(true)}
            >
                {isAddingCustomInjury ? (
                    <Input
                        value={customInjury}
                        style={{ width: '12vh' }}
                        onChange={(e) => setCustomInjury(e.target.value)}
                        placeholder=""
                        onPressEnter={handleAddCustomInjuryMarker}
                        autoFocus
                        size="small"
                        onClick={(e) => e.stopPropagation()}
                        onBlur={() => {
                            if (!customInjury.trim()) {
                                setIsAddingCustomInjury(false)
                            }
                        }}
                    />
                ) : (
                    <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                        <span>{t('cases.injuries.custom_injury')}</span>
                        <FaPlus />
                    </div>
                )}
            </Menu.Item>
        </Menu>
    )

    useEffect(() => {
        const fine = injuryMarkers.reduce((sum, marker) => sum + marker.price, 0)
        setTotalFine(fine)
    }, [injuryMarkers])

    const [isDropdownVisible, setIsDropdownVisible] = useState(false)

    return (
        <PageProvider
            loading={isPageLoading}
            title={t('cases.title')}
            description={t('cases.description')}
            onBack={location.state.onBack}
        >
            <div className="cases-container" style={{ padding: '16px' }}>
                <div
                    style={{ border: `1px solid ${theme.components.Card.colorBorderSecondary}` }}
                    className="left"
                >
                    <Input.Search
                        placeholder={t('cases.search')}
                        value={searchCasesTerm}
                        onChange={(e) => setSearchCasesTerm(e.target.value)}
                        className="search"
                    />

                    {haveListPerms ? (
                        <List
                            className="list"
                            bordered
                            dataSource={cases}
                            renderItem={(item) => (
                                <List.Item
                                    style={{ cursor: 'pointer' }}
                                    onClick={() => navigateWithAnimation(`/case/${item.id}`)}
                                >
                                    <List.Item.Meta
                                        avatar={<FaBriefcaseMedical />}
                                        title={`${item.title}`}
                                        description={`${formatDate(item.date)}`}
                                    />
                                </List.Item>
                            )}
                        />
                    ) : (
                        <NoResult
                            title={t('global.no_perms_title')}
                            subtitle={t('global.no_perms')}
                        />
                    )}
                </div>
                <div
                    style={{ border: `1px solid ${theme.components.Card.colorBorderSecondary}` }}
                    className="right"
                >
                    <Button
                        style={{ marginTop: '15px' }}
                        danger
                        onClick={() => form.resetFields()}
                        disabled={!haveCreatePerms}
                    >
                        {t('cases.reset')}
                    </Button>

                    <Form
                        form={form}
                        layout="vertical"
                        onValuesChange={() => {
                            const values = form.getFieldsValue()
                            saveFormValuesToLocalStorage({
                                ...values,
                                injuries: injuryMarkers,
                                totalFine,
                            })
                        }}
                        onFinish={handleSubmit}
                        disabled={!haveCreatePerms}
                    >
                        <Form.Item
                            name="title"
                            label={t('cases.form.title')}
                            rules={[{ required: true, message: t('cases.form.errors.title') }]}
                        >
                            <Input />
                        </Form.Item>
                        <Form.Item
                            name="description"
                            label={t('cases.form.description')}
                            rules={[
                                { required: true, message: t('cases.form.errors.description') },
                            ]}
                        >
                            <TextArea rows={4} style={{ resize: 'none' }} />
                        </Form.Item>
                        <Form.Item
                            name="citizens"
                            label={t('cases.form.citizens')}
                            rules={[{ required: true, message: t('cases.form.errors.citizens') }]}
                        >
                            <Select
                                mode="multiple"
                                placeholder={t('cases.form.select_citizens')}
                                onSearch={(value) => handleSearch('Citizens', value)}
                                filterOption={false}
                                showSearch
                                labelInValue
                                maxCount={1}
                            >
                                {citizens.map((citizen) => (
                                    <Select.Option key={citizen.value} value={citizen.value}>
                                        {citizen.label}
                                    </Select.Option>
                                ))}
                            </Select>
                        </Form.Item>

                        <Form.Item
                            name="doctors"
                            label={t('cases.form.doctors')}
                            rules={[{ required: true, message: t('cases.form.errors.doctors') }]}
                        >
                            <Select
                                mode="multiple"
                                placeholder={t('cases.form.select_doctors')}
                                onSearch={(value) => handleSearch('doctors', value)}
                                filterOption={false}
                                showSearch
                            >
                                {doctors.map((doctor) => (
                                    <Option key={doctor.value} value={doctor.value}>
                                        {doctor.label}
                                    </Option>
                                ))}
                            </Select>
                        </Form.Item>
                        <Form.Item
                            name="injuries"
                            label={t('cases.form.injuries')}
                            rules={[
                                {
                                    required: true,
                                    message: t('cases.form.errors.injuries'),
                                    validator: (_, value) =>
                                        injuryMarkers.length > 0
                                            ? Promise.resolve()
                                            : Promise.reject(
                                                  new Error(t('cases.form.errors.injuries')),
                                              ),
                                },
                            ]}
                        >
                            <Button
                                style={{ width: '100%' }}
                                type="dashed"
                                onClick={() => setInjurieModalVisible(true)}
                            >
                                {t('cases.form.select_injuries')}
                            </Button>
                        </Form.Item>
                        <div className="selected_injuries">
                            {injuryMarkers.map((injury) => (
                                <Tag
                                    key={injury.id}
                                    closable
                                    color="red"
                                    onClose={() =>
                                        setInjuryMarkers(
                                            injuryMarkers.filter(
                                                (marker) => marker.id !== injury.id,
                                            ),
                                        )
                                    }
                                >
                                    {injury.type} - {injury.bodyPart}
                                </Tag>
                            ))}
                        </div>

                        <Form.Item className="total" label={t('cases.form.total.title')} required>
                            <Input
                                addonBefore={t('cases.form.total.fine')}
                                value={Math.floor(totalFine * (finePercentage / 100))}
                                readOnly
                                style={{ width: '100%' }}
                            />
                        </Form.Item>

                        <Form.Item className="total-sliders">
                            <Slider
                                min={0}
                                max={100}
                                value={finePercentage}
                                onChange={(value) => setFinePercentage(value)}
                                style={{ width: '100%' }}
                                tooltipPlacement="bottom"
                                tipFormatter={(value) =>
                                    t('cases.form.reduction', {
                                        value: `${Math.floor(100 - value!)}`,
                                    })
                                }
                            />
                        </Form.Item>

                        <Form.Item>
                            <Button
                                loading={isButtonLoading}
                                style={{ width: '100%', marginTop: '50px' }}
                                type="primary"
                                htmlType="submit"
                                disabled={!haveCreatePerms}
                            >
                                {t('cases.form.submit')}
                            </Button>
                        </Form.Item>
                    </Form>
                </div>
            </div>
            <Modal
                title={t('cases.form.body_diagram')}
                open={injuriesModalVisible}
                onCancel={() => setInjurieModalVisible(false)}
                centered
                width={'fit-content'}
                footer={null}
            >
                <div style={{ position: 'relative' }}>
                    <img
                        src="./public/body_diagram.png"
                        onClick={handleImageClick}
                        alt={'Body Diagram'}
                        style={{ cursor: isDropdownVisible ? 'default' : 'crosshair' }}
                    />
                    {selectedPosition && (
                        <Dropdown
                            overlayClassName="cases-dropdown"
                            overlay={menu}
                            trigger={['click']}
                            open={isDropdownVisible}
                            onOpenChange={(visible) => {
                                if (!visible) {
                                    setSelectedPosition(null)
                                }
                                setIsDropdownVisible(visible)
                            }}
                        >
                            {selectedPosition && (
                                <div
                                    style={{
                                        position: 'absolute',
                                        top: selectedPosition.y,
                                        left: selectedPosition.x,
                                        width: '10px',
                                        height: '10px',
                                    }}
                                />
                            )}
                        </Dropdown>
                    )}
                    {injuryMarkers.map((marker) => (
                        <Tooltip key={marker.id} title={`${marker.type} - ${marker.bodyPart}`}>
                            <div
                                className="injury-marker"
                                style={{
                                    top: marker.y,
                                    left: marker.x,
                                }}
                            />
                        </Tooltip>
                    ))}
                </div>
            </Modal>
        </PageProvider>
    )
}

export default Cases
