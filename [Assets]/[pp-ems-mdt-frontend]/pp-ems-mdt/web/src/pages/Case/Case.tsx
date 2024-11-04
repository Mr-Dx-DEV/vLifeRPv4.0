import React, { useContext, useEffect, useRef, useState } from 'react'
import { useLocation, useNavigate, useParams } from 'react-router-dom'
import { PageProvider } from '../../providers/PageProvider'
import { Form, Input, Button, Divider, Select, Tooltip } from 'antd'
import './Case.scss'
import { ThemeContext } from '../../providers/ThemeProvider'
import { MdKeyboardDoubleArrowRight } from 'react-icons/md'
const { TextArea } = Input
import { IoBag } from 'react-icons/io5'
import { FaUserAlt } from 'react-icons/fa'
import { MdEdit } from 'react-icons/md'
import { navigateWithAnimation } from '../../utils/misc'
import { fetchNui } from '../../utils/fetchNui'
import { formatDate } from '../../utils'
import { FaUserDoctor } from 'react-icons/fa6'
import { t } from '../../hooks/useLocale'
import { hasPermission } from '../../utils/permissions'

type Option = {
    value: string
    label: string
    id: number
    count?: number
}

type Injury = {
    price: number;
    type: string;
    x: number;
    y: number;
    id: number;
    bodyPart?: string;
}

type CaseData = {
    author: {
        value: string
        label: string
    }
    edited: {
        by: {
            value: string
            label: string
        }
        at: string
    }
    created_at: string
    description: string
    title: string
    doctors: Option[]
    citizens: Option[]
    injuries: {
        injuries: Injury[]
        fineReduction: number
    }
}

type SectionKey = keyof Pick<CaseData, 'citizens' | 'doctors'>

const Case: React.FC = () => {
    const { id } = useParams<{ id: string }>()
    const [data, setData] = useState<CaseData | undefined>()
    const [isEditing, setIsEditing] = useState(false)
    const { theme } = useContext(ThemeContext)
    const [form] = Form.useForm()
    const [isPageLoading, setIsPageLoading] = useState(true)
    const [citizens, setCitizens] = useState<Option[]>([])
    const [doctors, setDoctors] = useState<Option[]>([])
    const navigate = useNavigate()
    const [currentTime, setCurrentTime] = useState(new Date())
    const haveEditPerms = hasPermission('case.edit')
    const gridItemRefs = useRef<(HTMLDivElement | null)[]>([])

    const handleEdit = () => {
        setIsEditing(true)
        setTimeout(() => {
            const lastEditableItem = gridItemRefs.current.filter((item) => item !== null).pop()
            lastEditableItem?.scrollIntoView({ behavior: 'smooth', block: 'end' })
        }, 110)
    }

    const handleCancel = () => {
        setIsEditing(false)
        form.setFieldsValue(data)
    }

    const handleFinish = (values: CaseData) => {
        const updatedData = {
            ...values,
            citizens: form.getFieldValue('citizens'),
            doctors: form.getFieldValue('doctors'),
            injuries: form.getFieldValue('injuries'),
        }
        setIsPageLoading(true)
        setIsEditing(false)
        fetchNui('updateCase', { values: updatedData, id: id }).then((response: any) => {
            fetchDetails()
        })
    }

    const sections = [
        {
            title: t('case.sections.citizens'),
            key: 'citizens' as SectionKey,
            path: 'citizen',
            data: data?.citizens,
            icon: <FaUserAlt />,
            edit: false,
        },
        {
            title: t('case.sections.doctors'),
            key: 'doctors' as SectionKey,
            path: 'citizen',
            data: data?.doctors,
            icon: <FaUserDoctor />,
            edit: true,
        },
        {
            title: t('case.sections.injuries'),
            key: 'injuries',
            path: null,
            data: data?.injuries?.injuries,
            icon: <IoBag />,
            edit: false,
        },
    ]

    const fetchDetails = () => {
        fetchNui('getCaseDetails', { id: id })
            .then((response: any) => {
                setData(response)
                form.setFieldsValue(response)
            })
            .finally(() => setIsPageLoading(false))
    }

    const handleSearch = (type: string, value: string) => {
        fetchNui(`search${type}`, { query: value || '' })
            .then((data: unknown) => {
                const options = data as Option[]
                switch (type) {
                    case 'Citizens':
                        setCitizens(options)
                        break
                    case 'Doctors':
                        setDoctors(options)
                        break
                    default:
                        break
                }
            })
            .catch((err) => console.error(`Error fetching ${type.toLowerCase()}:`, err))
    }

    useEffect(() => {
        fetchDetails()
    }, [id])

    useEffect(() => {
        handleSearch('Citizens', '')
        handleSearch('Doctors', '')
    }, [])

    useEffect(() => {
        const intervalId = setInterval(() => {
            setCurrentTime(new Date())
        }, 1000)

        return () => clearInterval(intervalId)
    }, [])

    const isSectionKey = (key: string): key is SectionKey => {
        return ['citizens', 'doctors'].includes(key)
    }

    const renderSections = () => {
        return sections
            .filter((section) => isEditing || (section.data && section.data.length > 0))
            .map((section, sectionIndex) => {
                return (
                    <div
                        ref={(el) => (gridItemRefs.current[sectionIndex] = el)}
                        className="grid-item"
                        key={section.key}
                    >
                        <Divider>{section.title}</Divider>
                        <div className={`values-container`}>
                            {isEditing && section.edit && (
                                <Form.Item name={section.key}>
                                    <Select
                                        mode="multiple"
                                        placeholder={t('case.sections.add', {
                                            section: section.title,
                                        })}
                                        onSearch={(value) =>
                                            handleSearch(
                                                section.key.charAt(0).toUpperCase() +
                                                    section.key.slice(1),
                                                value,
                                            )
                                        }
                                        filterOption={false}
                                        showSearch
                                        placement="topLeft"
                                        defaultValue={section.data?.map((item: any) => item.value)}
                                        onChange={(values, options) => {
                                            if (isSectionKey(section.key)) {
                                                const newItems = values.map((value, index) => {
                                                    const option = options.find(
                                                        (opt: any) => opt.value === value,
                                                    )

                                                    return {
                                                        value: value,
                                                        label: option ? option.children : value,
                                                    }
                                                })
                                                setData((prevData) => {
                                                    const updatedData = {
                                                        ...prevData,
                                                        [section.key]: newItems,
                                                    } as CaseData
                                                    form.setFieldsValue({ [section.key]: newItems })
                                                    return updatedData
                                                })
                                            }
                                        }}
                                    >
                                        {section.key === 'citizens' &&
                                            citizens.map((citizen) => (
                                                <Select.Option
                                                    key={citizen.value}
                                                    value={citizen.value}
                                                >
                                                    {citizen.label}
                                                </Select.Option>
                                            ))}
                                        {section.key === 'doctors' &&
                                            doctors.map((doctor) => (
                                                <Select.Option
                                                    key={doctor.value}
                                                    value={doctor.value}
                                                >
                                                    {doctor.label}
                                                </Select.Option>
                                            ))}
                                    </Select>
                                </Form.Item>
                            )}
                            {section.data &&
                                section.data.map((item: Option | Injury, index: number) => {
                                    if (section.key === 'injuries') {
                                        const injury = item as Injury
                                        const finalFine = data?.injuries.fineReduction
                                            ? injury.price * (1 - data.injuries.fineReduction / 100)
                                            : injury.price

                                        return (
                                            <div
                                                key={index}
                                                className="item"
                                                style={{
                                                    background: theme.token.colorBgContainer,
                                                    border: `1px solid ${theme.token.colorPrimaryBorder}`,
                                                }}
                                            >
                                                {section.icon}
                                                <p>
                                                    {injury.type} -{' '}
                                                    {data?.injuries.fineReduction ? (
                                                        <>
                                                            <span>{Math.round(finalFine)}</span>
                                                            <sup>{injury.price}</sup>
                                                            <span>$</span>
                                                        </>
                                                    ) : (
                                                        <span>{injury.price} $</span>
                                                    )}
                                                </p>
                                            </div>
                                        )
                                    } else {
                                        const option = item as Option
                                        return (
                                            <div
                                                key={index}
                                                onClick={() => {
                                                    if (!isEditing && section.path) {
                                                        navigateWithAnimation(
                                                            `/${section.path}/${option.value}`,
                                                            `/case/${id}`,
                                                        )
                                                    }
                                                }}
                                                className="item"
                                                style={{
                                                    background: theme.token.colorBgContainer,
                                                    border: `1px solid ${theme.token.colorPrimaryBorder}`,
                                                }}
                                            >
                                                {section.icon}
                                                <p>{option.label}</p>
                                            </div>
                                        )
                                    }
                                })}
                        </div>
                    </div>
                )
            })
    }

    const location = useLocation()

    return (
        <PageProvider
            title={t('case.title', { id: `${id}` })}
            description={t('case.description')}
            onBack={location.state?.onBack || '/cases'}
            loading={isPageLoading}
        >
            <div className="case-page-wrapper">
                <div className="case-container">
                    <div className="top-container">
                        <div className="info-container">
                            <Divider orientation="left">
                                {t('case.details')}
                                {haveEditPerms ? (
                                    <MdEdit
                                        style={{
                                            marginLeft: '10px',
                                            cursor: 'pointer',
                                            color: theme.token.colorPrimary,
                                        }}
                                        onClick={handleEdit}
                                    />
                                ) : null}
                            </Divider>
                            <div className="dates">
                                {data?.author?.value ? (
                                    <div className="edited">
                                        <p className="label">{t('case.created')}: </p>
                                        <div className="data">
                                            <div>
                                                <p className="name">
                                                    <strong>{t('case.by')}: </strong>
                                                    {data?.author?.label}
                                                </p>
                                                <MdKeyboardDoubleArrowRight
                                                    onClick={() =>
                                                        navigateWithAnimation(
                                                            `/citizen/${data?.author?.value}`,
                                                            `/case/${id}`,
                                                        )
                                                    }
                                                />
                                            </div>
                                            <p className="name">
                                                <strong>{t('case.at')}: </strong>
                                                {formatDate(data?.created_at)}
                                            </p>
                                        </div>
                                    </div>
                                ) : null}
                                {data?.edited?.by?.value ? (
                                    <div className="edited">
                                        <p className="label">{t('case.last_edited')}: </p>
                                        <div className="data">
                                            <div>
                                                <p className="name">
                                                    <strong>{t('case.by')}: </strong>
                                                    {data?.edited?.by?.label}
                                                </p>
                                                <MdKeyboardDoubleArrowRight
                                                    onClick={() =>
                                                        navigateWithAnimation(
                                                            `/citizen/${data?.edited?.by?.value}`,
                                                            `/case/${id}`,
                                                        )
                                                    }
                                                />
                                            </div>
                                            <p className="name">
                                                <strong>{t('case.at')}: </strong>
                                                {formatDate(data?.edited.at)}
                                            </p>
                                        </div>
                                    </div>
                                ) : null}
                            </div>
                            <div className="buttons">
                                {isEditing && (
                                    <>
                                        <Button
                                            type="primary"
                                            htmlType="submit"
                                            onClick={form.submit}
                                        >
                                            {t('case.save')}
                                        </Button>
                                        <Button onClick={handleCancel}>{t('case.cancel')}</Button>
                                    </>
                                )}
                            </div>
                        </div>
                        <Form
                            form={form}
                            layout="vertical"
                            onFinish={handleFinish}
                            initialValues={data}
                            className="edit-form"
                        >
                            <Form.Item
                                style={{ width: '100%' }}
                                name="title"
                                label={t('case.title_label')}
                            >
                                <Input readOnly={!isEditing} />
                            </Form.Item>
                            <Form.Item
                                className="description"
                                style={{ width: '100%', height: '100%' }}
                                name="description"
                                label={t('case.description_label')}
                            >
                                <TextArea
                                    style={{ resize: 'none', height: '100%' }}
                                    readOnly={!isEditing}
                                />
                            </Form.Item>
                        </Form>
                    </div>

                    <div className="bottom-container">
                        <div className="grid-container">{renderSections()}</div>
                    </div>
                </div>
                <div className="case-body-diagram">
                    <img src="./public/body_diagram.png" alt="Body diagram" />
                    {data?.injuries?.injuries &&
                        data.injuries?.injuries.map((injury) => (
                            <Tooltip key={injury.id} title={`${injury.type} - ${injury.bodyPart}`}>
                                <div
                                    className="injury-marker"
                                    style={{
                                        top: injury.y,
                                        left: injury.x,
                                    }}
                                />
                            </Tooltip>
                        ))}
                </div>
            </div>
        </PageProvider>
    )
}

export default Case
