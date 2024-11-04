import React, { useState, useEffect, useContext } from 'react'
import { PageProvider } from '../../providers/PageProvider'
import { Form, Input, Button, List, Select, Row, Col } from 'antd'
import { useLocation } from 'react-router-dom'
import './Notes.scss'
import { ThemeContext } from '../../providers/ThemeProvider'
import { fetchNui } from '../../utils/fetchNui'
import { navigateWithAnimation, showNotification } from '../../utils/misc'
import { formatDate } from '../../utils'
import { RiStickyNoteLine } from 'react-icons/ri'
import { t } from '../../hooks/useLocale'
import { useNotification } from '../../providers/NotificationProvider'
import { hasPermission } from '../../utils/permissions'
import NoResult from '../../components/NoResult'

const { TextArea } = Input
const { Option } = Select

type OptionType = {
    value: string
    label: string
}

const Notes = () => {
    const [form] = Form.useForm()
    const [notes, setNotes] = useState<{ id: number; title: string; created_at: string }[]>()
    const [filteredNotes, setFilteredNotes] =
        useState<{ id: number; title: string; created_at: string }[]>()
    const location = useLocation()
    const { theme } = useContext(ThemeContext)
    const [citizens, setCitizens] = useState<OptionType[]>([])
    const [doctors, setDoctors] = useState<OptionType[]>([])
    const [cases, setCases] = useState<OptionType[]>([])
    const [isPageLoading, setIsPageLoading] = useState(true)
    const [searchTerm, setSearchTerm] = useState('')
    const haveListPerms = hasPermission('notes.listview')
    const haveCreatePerms = hasPermission('notes.create')

    useEffect(() => {
        const params = new URLSearchParams(location.search)
        const title = params.get('title') || ''
        const description = params.get('description') || ''
        const citizens = params.get('citizens') ? JSON.parse(params.get('citizens') || '') : []
        const doctors = params.get('doctors')?.split(',') || []
        const cases = params.get('cases')?.split(',') || []

        form.setFieldsValue({
            title,
            description,
            citizens,
            doctors,
            cases,
        })
    }, [location.search])

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
        Promise.all([
            handleSearch('Citizens', ''),
            handleSearch('Doctors', ''),
            handleSearch('Cases', ''),
            fetchNui('getNotes').then((response: any) => {
                setNotes(response)
                setFilteredNotes(response)
            }),
        ]).then(() => {
            setIsPageLoading(false)
        })
    }, [])

    const handleSubmit = (values: any) => {
        setIsPageLoading(true)
        fetchNui('submitNotes', { values: values })
            .then((response) => {
                if (response) {
                    navigateWithAnimation(`/note/${response}`, `/notes`)
                } else {
                    showNotification(t('notes.form.error'), 'error')
                }
            })
            .catch((error) => {
                console.error('Error submitting form:', error)
            })
            .finally(() => setIsPageLoading(false))
    }

    const handleNoteSearch = (value: string) => {
        setSearchTerm(value)
        if (notes) {
            const filtered = notes.filter((note) =>
                note.title.toLowerCase().includes(value.toLowerCase()),
            )
            setFilteredNotes(filtered)
        }
    }

    return (
        <PageProvider
            loading={isPageLoading}
            title={t('notes.page.title')}
            description={t('notes.page.description')}
        >
            <div className="notes-container" style={{ padding: '16px' }}>
                <div
                    style={{ border: `1px solid ${theme.components.Card.colorBorderSecondary}` }}
                    className="left"
                >
                    <Input.Search
                        placeholder={t('notes.search.placeholder')}
                        onSearch={handleNoteSearch}
                        enterButton
                        className="search"
                        style={{ marginBottom: '30px' }}
                    />
                    {haveListPerms ? (
                        <List
                            bordered
                            dataSource={filteredNotes}
                            renderItem={(item) => (
                                <List.Item
                                    style={{ cursor: 'pointer' }}
                                    onClick={() => navigateWithAnimation(`/note/${item.id}`)}
                                >
                                    <List.Item.Meta
                                        avatar={<RiStickyNoteLine />}
                                        title={`${item.title}`}
                                        description={`${formatDate(item.created_at)}`}
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
                    style={{
                        border: `1px solid ${theme.components.Card.colorBorderSecondary}`,
                        display: 'flex',
                        flexDirection: 'column',
                    }}
                    className="right"
                >
                    <Form
                        disabled={!haveCreatePerms}
                        form={form}
                        layout="vertical"
                        onFinish={handleSubmit}
                        style={{ flex: 1, display: 'flex', flexDirection: 'column' }}
                    >
                        <div style={{ flex: 1 }}>
                            <Form.Item
                                name="title"
                                label={t('notes.form.title.label')}
                                rules={[
                                    { required: true, message: t('notes.form.title.required') },
                                ]}
                            >
                                <Input />
                            </Form.Item>
                            <Form.Item
                                name="description"
                                label={t('notes.form.description.label')}
                                rules={[
                                    {
                                        required: true,
                                        message: t('notes.form.description.required'),
                                    },
                                ]}
                            >
                                <TextArea rows={4} style={{ resize: 'none' }} />
                            </Form.Item>
                            <Form.Item
                                name="citizens"
                                label={t('notes.form.citizens.label')}
                                rules={[
                                    { required: true, message: t('notes.form.citizens.required') },
                                ]}
                            >
                                <Select
                                    mode="multiple"
                                    placeholder={t('notes.form.citizens.placeholder')}
                                    onSearch={(value) => handleSearch('Citizens', value)}
                                    filterOption={false}
                                    showSearch
                                >
                                    {citizens.map((citizen) => (
                                        <Option key={citizen.value} value={citizen.value}>
                                            {citizen.label}
                                        </Option>
                                    ))}
                                </Select>
                            </Form.Item>
                            <Form.Item
                                name="doctors"
                                label={t('notes.form.doctors.label')}
                                rules={[
                                    { required: true, message: t('notes.form.doctors.required') },
                                ]}
                            >
                                <Select
                                    mode="multiple"
                                    placeholder={t('notes.form.doctors.placeholder')}
                                    onSearch={(value) => handleSearch('Doctors', value)}
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
                                        name="cases"
                                        label={t('notes.form.cases.label')}
                                        rules={[
                                            {
                                                required: false,
                                                message: t('notes.form.cases.required'),
                                            },
                                        ]}
                                    >
                                        <Select
                                            mode="multiple"
                                            placeholder={t('notes.form.cases.placeholder')}
                                            onSearch={(value) => handleSearch('Cases', value)}
                                            filterOption={false}
                                            showSearch
                                        >
                                            {cases.map((caseItem) => (
                                                <Option key={caseItem.value} value={caseItem.value}>
                                                    {caseItem.label}
                                                </Option>
                                            ))}
                                        </Select>
                                    </Form.Item>
                        </div>
                        <Form.Item style={{ marginTop: 'auto' }}>
                            <Button
                                disabled={!haveCreatePerms}
                                style={{ width: '100%' }}
                                type="primary"
                                htmlType="submit"
                            >
                                {t('notes.form.submitButton')}
                            </Button>
                        </Form.Item>
                    </Form>
                </div>
            </div>
        </PageProvider>
    )
}

export default Notes
