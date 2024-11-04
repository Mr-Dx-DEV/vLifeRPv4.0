import React, { useContext, useState, useEffect } from 'react'
import { PageProvider } from '../../providers/PageProvider'
import './Patrols.scss'
import { ThemeContext } from '../../providers/ThemeProvider'
import { Modal, Button, Select, Form, notification, Alert, Avatar, Tooltip, Popconfirm } from 'antd'
import { CiEdit } from 'react-icons/ci'
import { FaHelicopter, FaCarSide, FaPersonWalking, FaPlus } from 'react-icons/fa6'
import { IoIosBoat } from 'react-icons/io'
import { fetchNui } from '../../utils/fetchNui'
import { useNotification } from '../../providers/NotificationProvider'
import { t } from '../../hooks/useLocale'
import { IoExitOutline } from 'react-icons/io5'
import { BsTrash } from 'react-icons/bs'
import { useConfig } from '../../hooks/useConfig'
import { hasPermission } from '../../utils/permissions'
const { Option } = Select

const iconMap: Record<string, JSX.Element> = {
    heli: <FaHelicopter />,
    car: <FaCarSide />,
    walk: <FaPersonWalking />,
    boat: <IoIosBoat />,
}

interface PatrolsProps {
    id: number
    car: string
    officers: { label: string; value: string }[]
    patrolstatus: string
    canEdit?: boolean
    joinRequest?: boolean
    canLeave?: boolean
    canDelete?: boolean
    creator: string
}

const Patrols: React.FC = () => {
    const [isModalVisible, setIsModalVisible] = useState(false)
    const [form] = Form.useForm()
    const [officersList, setOfficersList] = useState<{ label: string; value: string }[]>([])
    const [editIndex, setEditIndex] = useState<number | null>(null)
    const [modalError, setModalError] = useState<string | null>(null)
    const { theme } = useContext(ThemeContext)
    const [patrols, setPatrols] = useState<PatrolsProps[]>([])
    const notify = useNotification()
    const [isPageLoading, setIsPageLoading] = useState(true)
    const config = useConfig()
    const fetchPatrols = () => {
        fetchNui('getPatrols', null)
            .then((response: any) => {
                setPatrols(response)
            })
            .finally(() => setIsPageLoading(false))
    }

    const fetchOfficers = (query: string) => {
        fetchNui('searchOnlineOfficers', { query: query })
            .then((response: any) => setOfficersList(Array.isArray(response) ? response : []))
            .catch((error: any) => console.error('Error fetching officers:', error))
    }

    useEffect(() => {
        fetchOfficers('')
        fetchPatrols()
    }, [])

    const showCreateModal = () => {
        form.resetFields()
        setEditIndex(null)
        setModalError(null)
        setIsModalVisible(true)
    }

    const showEditModal = (index: number) => {
        setEditIndex(index)

        const { officers, creator, ...rest } = patrols[index]
        const filteredOfficers = officers.filter((officer) => officer.value !== creator)

        form.setFieldsValue({
            ...rest,
            officers: filteredOfficers.map((officer) => ({
                label: officer.label,
                value: officer.value,
            })),
        })

        setModalError(null)
        setIsModalVisible(true)
    }

    const handleInvitationRespond = (id: number, respond: boolean) => {
        setIsPageLoading(true)
        fetchNui('invitationRespond', { id: id, respond: respond }).then((response: any) => {
            fetchPatrols()
        })
    }

    const handleLeavePatrol = (id: number) => {
        setIsPageLoading(true)
        fetchNui('leavePatrol', { id: id }).then((response: any) => {
            fetchPatrols()
            if (response.success) {
                notify({
                    title: t('global.success'),
                    description: response.message,
                    type: 'success',
                    duration: 5,
                })
            } else {
                notify({
                    title: t('global.error'),
                    description: response.message,
                    type: 'error',
                    duration: 5,
                })
            }
        })
    }

    const handleDeletePatrol = (id: number) => {
        setIsPageLoading(true)
        fetchNui('deletePatrol', { id: id }).then((response: any) => {
            fetchPatrols()
            if (response.success) {
                notify({
                    title: t('global.success'),
                    description: response.message,
                    type: 'success',
                    duration: 5,
                })
            } else {
                notify({
                    title: t('global.error'),
                    description: response.message,
                    type: 'error',
                    duration: 5,
                })
            }
        })
    }

    const handleCreateOk = () => {
        form.validateFields()
            .then((values) => {
                const processedValues = {
                    ...values,
                    officers: values.officers
                        ? values.officers.map((officer: { value: string; label: string }) => ({
                              label: officer.label,
                              value: officer.value,
                          }))
                        : [],
                }

                fetchNui('createPatrol', { data: processedValues }).then((response: any) => {
                    if (response.success) {
                        setIsModalVisible(false)
                        form.resetFields()
                        fetchPatrols()
                        if (response.message) {
                            notify({
                                title: t('global.success'),
                                description: response.message,
                                type: 'success',
                                duration: 5,
                            })
                        }
                    } else {
                        setModalError(
                            response.message ? t(response.message) : t('patrols.create.error'),
                        )
                    }
                })
            })
            .catch((info) => {
                console.error('Validate Failed:', info)
            })
    }

    const haveCreatePerms = hasPermission('patrols.create')

    const handleEditOk = () => {
        form.validateFields()
            .then((values) => {
                const processedValues = {
                    ...values,
                    officers: values.officers
                        ? values.officers.map((officer: { value: string; label: string }) => ({
                              label: officer.label,
                              value: officer.value,
                          }))
                        : [],
                }
                fetchNui('editPatrol', { id: patrols[editIndex!].id, data: processedValues }).then(
                    (response: any) => {
                        if (response.success) {
                            setIsModalVisible(false)
                            form.resetFields()
                            fetchPatrols()
                            if (response.message) {
                                notify({
                                    title: t('global.success'),
                                    description: response.message,
                                    type: 'success',
                                    duration: 5,
                                })
                            }
                        } else {
                            setModalError(
                                response.message ? t(response.message) : t('patrols.edit.error'),
                            )
                        }
                    },
                )
            })
            .catch((info) => {
                console.error('Validate Failed:', info)
            })
    }

    const handleOk = () => {
        if (editIndex === null) {
            handleCreateOk()
        } else {
            handleEditOk()
        }
    }

    const handleCancel = () => {
        setIsModalVisible(false)
        form.resetFields()
    }

    return (
        <PageProvider
            title={t('patrols.title')}
            description={t('patrols.description')}
            loading={isPageLoading}
        >
            <div className="patrols-containner">
                <div className="patrols-grid">
                    {patrols && patrols.length > 0
                        ? patrols.map((item, index) => (
                              <div
                                  className="patrol-item"
                                  key={index}
                                  style={{
                                      border: `2px solid ${
                                          item.joinRequest
                                              ? theme.token.colorPrimary
                                              : theme.token.colorPrimaryBorder
                                      }`,
                                      background: theme.token.colorBgContainer,
                                  }}
                              >
                                  <div
                                      className="item-icon"
                                      style={{ color: theme.token.colorPrimary }}
                                  >
                                      {iconMap[item.car] || <FaCarSide />}
                                  </div>
                                  <div className="patrol-icons">
                                      {item.canDelete ? (
                                          <Popconfirm
                                              placement="bottom"
                                              title={t('patrols.remove.title')}
                                              description={t('patrols.remove.description')}
                                              okText={t('global.yes')}
                                              onConfirm={() => handleDeletePatrol(item.id)}
                                              cancelText={t('global.no')}
                                          >
                                              <BsTrash className="edit-icon" />
                                          </Popconfirm>
                                      ) : null}
                                      {item.canLeave ? (
                                          <Popconfirm
                                              placement="bottom"
                                              title={t('patrols.leave.title')}
                                              description={t('patrols.leave.description')}
                                              okText={t('global.yes')}
                                              onConfirm={() => handleLeavePatrol(item.id)}
                                              cancelText={t('global.no')}
                                          >
                                              <IoExitOutline className="edit-icon" />
                                          </Popconfirm>
                                      ) : null}
                                      {item.canEdit ? (
                                          <CiEdit
                                              className="edit-icon"
                                              onClick={() => showEditModal(index)}
                                          />
                                      ) : null}
                                  </div>

                                  <h2>
                                      {t('patrols.patrol')} #{index + 1}
                                  </h2>
                                  <div
                                      className={`notification-tag ${
                                          config?.patrols?.statusColorMap[item.patrolstatus] ||
                                          'red'
                                      }`}
                                  >
                                      {item.patrolstatus}
                                  </div>
                                  <div className="item-officers">
                                      <Avatar.Group>
                                          {item.officers.map((officer, idx) => (
                                              <Tooltip title={officer.label} key={idx}>
                                                  <Avatar
                                                      style={{
                                                          backgroundColor: theme.token.colorPrimary,
                                                      }}
                                                  >
                                                      {officer.label.charAt(0)}
                                                  </Avatar>
                                              </Tooltip>
                                          ))}
                                      </Avatar.Group>
                                  </div>
                                  {item.joinRequest && (
                                      <div className="join-request">
                                          <p>{t('patrols.invitation')}</p>
                                          <div className="buttons">
                                              <Button
                                                  onClick={() =>
                                                      handleInvitationRespond(item.id, true)
                                                  }
                                                  type="primary"
                                              >
                                                  {t('global.accept')}
                                              </Button>
                                              <Button
                                                  onClick={() =>
                                                      handleInvitationRespond(item.id, false)
                                                  }
                                                  type="dashed"
                                              >
                                                  {t('global.decline')}
                                              </Button>
                                          </div>
                                      </div>
                                  )}
                              </div>
                          ))
                        : null}
                    {haveCreatePerms ? (
                        <div
                            className="patrol-item"
                            style={{
                                border: `2px dashed ${theme.token.colorPrimaryBorder}`,
                                opacity: haveCreatePerms ? `1.0` : `0.6`,
                            }}
                            onClick={showCreateModal}
                        >
                            <FaPlus style={{ color: theme.token.colorPrimary }} />
                        </div>
                    ) : (
                        <Tooltip title={t('patrols.no_perms')}>
                            <div
                                className="patrol-item"
                                style={{
                                    border: `2px dashed ${theme.token.colorPrimaryBorder}`,
                                    opacity: haveCreatePerms ? `1.0` : `0.6`,
                                }}
                                onClick={showCreateModal}
                            >
                                <FaPlus style={{ color: theme.token.colorPrimary }} />
                            </div>
                        </Tooltip>
                    )}
                </div>
            </div>
            <Modal
                className="patrol-modal"
                title={editIndex !== null ? t('patrols.edit.title') : t('patrols.create.title')}
                open={isModalVisible}
                onOk={handleOk}
                centered
                onCancel={handleCancel}
            >
                <Form form={form} layout="vertical">
                    <Form.Item
                        name="car"
                        label={t('patrols.create.form.vehicle.title')}
                        rules={[{ required: true, message: t('patrols.create.form.vehicle.rule') }]}
                    >
                        <Select placeholder={t('patrols.create.form.vehicle.placeholder')}>
                            {config?.patrols?.patrolTypes?.map(
                                (type: { value: string; label: string }) => (
                                    <Option key={type.value} value={type.value}>
                                        <span className="car-option">
                                            {iconMap[type.value] || <FaCarSide />}
                                            {type.label}
                                        </span>
                                    </Option>
                                ),
                            )}
                        </Select>
                    </Form.Item>
                    <Form.Item
                        name="officers"
                        label={t('patrols.create.form.doctors.title')}
                        rules={[{ required: false }]}
                    >
                        <Select
                            onSearch={(value) => fetchOfficers(value)}
                            mode="multiple"
                            placeholder={t('patrols.create.form.doctors.placeholder')}
                            labelInValue
                        >
                            {officersList.map((officer) => (
                                <Option key={officer.value} value={officer.value}>
                                    {officer.label}
                                </Option>
                            ))}
                        </Select>
                    </Form.Item>
                    <Form.Item
                        name="patrolstatus"
                        label={t('patrols.create.form.status.title')}
                        rules={[{ required: true, message: t('patrols.create.form.status.rule') }]}
                    >
                        <Select placeholder={t('patrols.create.form.status.placeholder')}>
                            {config?.patrols?.statusTypes?.map((status: string) => (
                                <Option key={status} value={status}>
                                    {status}
                                </Option>
                            ))}
                        </Select>
                    </Form.Item>
                    {modalError && (
                        <Alert
                            showIcon
                            message={modalError}
                            type="error"
                            style={{ marginTop: '15px' }}
                        />
                    )}
                </Form>
            </Modal>
        </PageProvider>
    )
}

export default Patrols
