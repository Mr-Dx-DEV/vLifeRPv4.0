import React, { useContext, useEffect, useRef, useState } from 'react'
import { useLocation, useNavigate, useParams } from 'react-router-dom'
import { PageProvider } from '../../providers/PageProvider'
import { Form, Input, Button, Divider, Select, Popconfirm } from 'antd'
import './Note.scss'
const { TextArea } = Input
import { ThemeContext } from '../../providers/ThemeProvider'
import { MdKeyboardDoubleArrowRight, MdLocalPolice } from 'react-icons/md'
import { FaCarSide } from 'react-icons/fa'
import { IoBag } from 'react-icons/io5'
import { FaUserAlt } from 'react-icons/fa'
import { MdEdit } from 'react-icons/md'
import { navigateWithAnimation } from '../../utils/misc'
import { fetchNui } from '../../utils/fetchNui'
import { IoTrashSharp } from 'react-icons/io5'
import { useNotification } from '../../providers/NotificationProvider'
import { formatDate } from '../../utils'
import { t } from '../../hooks/useLocale'
import { hasPermission } from '../../utils/permissions'
import { FaBriefcaseMedical, FaUserDoctor } from 'react-icons/fa6'
const exampleData = {
    author: 'char1:5391100698a418d396c0551706828177ef2532a1',
    created_at: '2024-05-27 21:02:47',
    description: ';uabnspdiluhaysbduolyhjabvduolyhsavdsougadv',
    vehicles: ['01DWM646', '01ZLH458', '08DFJ201', '09UZM183'],
    title: 'NIezly tytulek cipulek',
    doctors: [
        { label: 'Pixel Precision', value: 'char1:5391100698a418d396c0551706828177ef2532a1' },
        { label: 'identyfikator2', value: 'identyfikator2' },
        { label: 'identyfikator6', value: 'identyfikator6' },
        { label: 'Adaz Def', value: 'char1:20073b6a7c809fdba6d4a2701e515fd5a58118bf' },
    ],
    citizens: [
        { label: 'Mufasa Montana', value: 'char1:20073b6a7c809fdba6d4a2701e515fd5a58118bf' },
        { label: 'Jay Rose', value: 'char1:00e8b6b5d83571f1023452cd6da375146df62217' },
        { label: 'Zbonzi Kalafior', value: 'char1:0120b16685aac1616904610717778c96bb08cf91' },
        { label: 'Sander Sicollo', value: 'char1:05aed0ef7205458236209679427f6788bc13091d' },
        { label: 'George Harrison', value: 'char1:05b897f5a85a6bdb2ea38e2b99b4e89fc0c61582' },
        { label: 'identyfikator7', value: 'char1:20073b6a7c809fdba6d4a2701e515fd5a58118bf' },
        { label: 'identyfikator8', value: 'char1:00e8b6b5d83116116904610717778c96bb08cf91' },
        { label: 'identyfikator9', value: 'char1:05aed0ef720545811236209679427f6788bc13091d' },
        { label: 'identyfikator10', value: 'char1:05b897f5a85a6bdb2ea38e2b99b4e89fc0c61582' },
    ],
    evidences: [{ label: '1235', value: '1235' }],
    cases: [{ label: '1235', value: '1235' }],
    weapons: [{ label: 'Glock 17', value: 'glock17' }],
}

type Option = {
    value: string
    label: string
}

type noteData = {
    created_at: string
    description: string
    title: string
    doctors: Option[]
    citizens: Option[]
    cases: Option[]
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
}

type SectionKey = keyof Pick<noteData, 'citizens' | 'doctors' | 'cases'>

const Note = () => {
    const { id } = useParams<{ id: string }>()
    const [data, setData] = useState<noteData | undefined>()
    const [isEditing, setIsEditing] = useState(false)
    const { theme } = useContext(ThemeContext)
    const [form] = Form.useForm()
    const [isPageLoading, setIsPageLoading] = useState(true)
    const [citizens, setCitizens] = useState<Option[]>([])
    const [doctors, setDoctors] = useState<Option[]>([])
    const [cases, setCases] = useState<Option[]>([])
    const showNotification = useNotification()
    const gridItemRefs = useRef<(HTMLDivElement | null)[]>([])
    const location = useLocation()
    const haveEditPerms = hasPermission('note.edit')
    const haveRemovePerms = hasPermission('note.remove')
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

    const handleRemove = () => {
        setIsPageLoading(true)
        fetchNui('deleteNote', { id: id }).then((response: any) => {
            if (response) {
                showNotification({
                    title: 'Success',
                    description: 'Note deleted successfully #' + id,
                    type: 'success',
                })
                navigateWithAnimation('/notes')
            } else {
                showNotification({
                    title: 'Error',
                    description: response.message || 'An error occurred while deleting the note.',
                    type: 'error',
                })
            }
            setIsPageLoading(false)
        })
    }

    const handleFinish = (values: noteData) => {
        const updatedData = {
            ...values,
            citizens: form.getFieldValue('citizens'),
            doctors: form.getFieldValue('doctors'),
            cases: form.getFieldValue('cases'),
        }
        setIsPageLoading(true)
        setIsEditing(false)
        fetchNui('updateNotes', { values: updatedData, id: id }).then((response: any) => {
            fetchDetails()
        })
    }

    const sections = [
        {
            title: 'Citizens',
            key: 'citizens' as SectionKey,
            path: 'citizen',
            data: data?.citizens || [],
            icon: <FaUserAlt style={{ color: theme.token.colorPrimary }} />,
            edit: true,
        },
        {
            title: 'Doctors',
            key: 'doctors' as SectionKey,
            path: 'citizen',
            data: data?.doctors || [],
            icon: <FaUserDoctor style={{ color: theme.token.colorPrimary }} />,
            edit: true,
        },
        {
            title: 'Cases',
            key: 'cases' as SectionKey,
            path: 'case',
            data: data?.cases || [],
            icon: <FaBriefcaseMedical style={{ color: theme.token.colorPrimary }} />,
            edit: true,
        },
    ]

    const fetchDetails = () => {
        fetchNui('getNoteDetails', { id: id }, exampleData)
            .then((response: any) => {
                setData(response)
                form.setFieldsValue(response)
            })
            .finally(() => setIsPageLoading(false))
    }

    const handleSearch = (type: string, value: string) => {
        fetchNui(`search${type}`, { query: value || '' })
            .then((data: any) => {
                switch (type) {
                    case 'Citizens':
                        setCitizens(data)
                        break
                    case 'Doctors':
                        setDoctors(data)
                        break
                    case 'Cases':
                        setCases(data)
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
        handleSearch('Cases', '')
    }, [])

    const isSectionKey = (key: string): key is SectionKey => {
        return ['citizens', 'doctors', 'cases'].includes(key)
    }

    return (
        <PageProvider
            onBack={location.state?.onBack || `/notes`}
            title={`${t('note.title')} ${id}`}
            description={t('note.description')}
            loading={isPageLoading}
        >
            <div className="note-container">
                <div className="top-container">
                    <div className="info-container">
                        <Divider orientation="left">
                            {t('note.details')}
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
                            {haveRemovePerms ? (
                                <Popconfirm
                                    placement="bottom"
                                    title={t('global.warning')}
                                    description={t('note.delete_confirm')}
                                    okText={t('global.yes')}
                                    onConfirm={() => handleRemove()}
                                    cancelText={t('global.no')}
                                >
                                    <IoTrashSharp
                                        style={{
                                            marginLeft: '10px',
                                            cursor: 'pointer',
                                            color: theme.token.colorPrimary,
                                        }}
                                    />
                                </Popconfirm>
                            ) : null}
                        </Divider>

                        <div className="author">
                            <p className="author">{t('note.author')}:</p>
                            <p style={{ marginLeft: '5px' }} className="name">
                                {data?.author.label}
                            </p>
                            <MdKeyboardDoubleArrowRight
                                onClick={() =>
                                    navigateWithAnimation(
                                        `/citizen/${data?.author.value}`,
                                        `/note/${id}`,
                                    )
                                }
                            />
                        </div>
                        {data?.created_at && (
                            <p>
                                <strong>{t('note.created_at')}:</strong>{' '}
                                {formatDate(data.created_at)}
                            </p>
                        )}
                        {data?.edited?.by?.value && (
                            <div className="edited">
                                <p className="label">{t('note.last_edited')}:</p>
                                <div className="data">
                                    <div>
                                        <p className="name">
                                            <strong>{t('note.by')}:</strong> {data?.edited.by.label}
                                        </p>
                                        <MdKeyboardDoubleArrowRight
                                            onClick={() =>
                                                navigateWithAnimation(
                                                    `/citizen/${data?.edited?.by?.value}`,
                                                    `/note/${id}`,
                                                )
                                            }
                                        />
                                    </div>
                                    <p className="name">
                                        <strong>{t('note.at')}:</strong>{' '}
                                        {formatDate(data?.edited.at)}
                                    </p>
                                </div>
                            </div>
                        )}

                        {isEditing && (
                            <div className="buttons">
                                <Button type="primary" htmlType="submit" onClick={form.submit}>
                                    {t('global.save')}
                                </Button>
                                <Button onClick={handleCancel} style={{ marginLeft: '8px' }}>
                                    {t('global.cancel')}
                                </Button>
                            </div>
                        )}
                    </div>
                    <Form
                        form={form}
                        layout="vertical"
                        onFinish={handleFinish}
                        initialValues={data}
                        className="edit-form"
                    >
                        <Form.Item style={{ width: '100%' }} name="title" label="Title">
                            <Input readOnly={!isEditing} />
                        </Form.Item>
                        <Form.Item
                            className="description"
                            style={{ width: '100%', height: '100%' }}
                            name="description"
                            label="Description"
                        >
                            <TextArea
                                style={{ resize: 'none', height: '100%' }}
                                readOnly={!isEditing}
                            />
                        </Form.Item>
                    </Form>
                </div>

                <div className="bottom-container">
                    <div className="grid-container">
                        {sections.map((section, sectionIndex) => {
                            if (!isEditing && section.data.length === 0) {
                                return null
                            }
                            return (
                                <div
                                    ref={(el) => (gridItemRefs.current[sectionIndex] = el)}
                                    className="grid-item"
                                    key={section.key}
                                >
                                    <Divider>{section.title}</Divider>
                                    <div className="values-container">
                                        {isEditing && section.edit && (
                                            <Form.Item name={section.key}>
                                                <Select
                                                    mode="multiple"
                                                    placeholder={`Add ${section.title}`}
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
                                                    defaultValue={section.data.map(
                                                        (item) => item.value,
                                                    )}
                                                    onChange={(values, options) => {
                                                        if (isSectionKey(section.key)) {
                                                            const newItems = values.map(
                                                                (value, index) => {
                                                                    const option = options.find(
                                                                        (opt: any) =>
                                                                            opt.value === value,
                                                                    )

                                                                    return {
                                                                        value: value,
                                                                        label: option
                                                                            ? option.children
                                                                            : value,
                                                                    }
                                                                },
                                                            )
                                                            setData((prevData) => {
                                                                const updatedData = {
                                                                    ...prevData,
                                                                    [section.key]: newItems,
                                                                } as noteData
                                                                form.setFieldsValue({
                                                                    [section.key]: newItems,
                                                                })
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

                                                    {section.key === 'cases' &&
                                                        cases.map((caseItem) => (
                                                            <Select.Option
                                                                key={caseItem.value}
                                                                value={caseItem.value}
                                                            >
                                                                {caseItem.label}
                                                            </Select.Option>
                                                        ))}
                                                </Select>
                                            </Form.Item>
                                        )}
                                        {section.data.map((item, index) => (
                                            <div
                                                onClick={() => {
                                                    !isEditing &&
                                                        navigateWithAnimation(
                                                            `/${section.path}/${item.value}`,
                                                            `/note/${id}`,
                                                        )
                                                }}
                                                className="item"
                                                style={{
                                                    background: theme.token.colorBgContainer,
                                                    border: `1px solid ${theme.token.colorPrimaryBorder}`,
                                                }}
                                                key={index}
                                            >
                                                {section.icon}
                                                <p>{item.label}</p>
                                            </div>
                                        ))}
                                    </div>
                                </div>
                            )
                        })}
                    </div>
                </div>
            </div>
        </PageProvider>
    )
}

export default Note
