import React, { useEffect, useState } from 'react';
import './Announcement.scss';
import { useLocation, useParams } from 'react-router-dom';
import { PageProvider } from '../../providers/PageProvider';
import { fetchNui } from '../../utils/fetchNui';
import { RichTextEditor } from '@mantine/rte';
import { Button, Popconfirm, Tooltip } from 'antd';
import { CiEdit } from 'react-icons/ci';
import { FaTrash } from 'react-icons/fa6';
import { Announcement as AnnouncementProp } from '../../types';
import { formatDate } from '../../utils';
import { IoTimeOutline } from 'react-icons/io5';
import { FiUser } from 'react-icons/fi';
import { navigateWithAnimation, showNotification } from '../../utils/misc';
import { hasPermission } from '../../utils/permissions';
import { MdOutlineCancel } from "react-icons/md";
import { t } from '../../hooks/useLocale';

const Announcement = () => {
    const { id } = useParams();
    const [isPageLoading, setIsPageLoading] = useState(true);
    const [isEditing, setIsEditing] = useState(false);
    const [announcementContent, setAnnouncementContent] = useState<AnnouncementProp>();
    const location = useLocation();
    
    const fetchAnnouncement = () => {
        setIsPageLoading(true);
        fetchNui('getAnnouncement', { id: id })
            .then((response: any) => {
                setAnnouncementContent(response);
            })
            .finally(() => setIsPageLoading(false));
    };

    useEffect(() => {
        fetchAnnouncement();
    }, [id]);

    const handleRemove = () => {
        setIsPageLoading(true);
        fetchNui('deleteAnnouncement', { id: id }).then((response: any) => {
            if (response.success) {
                navigateWithAnimation('/announcements');
                setIsPageLoading(false);
            }
        });
    };

    const handleSaveEdit = (finalText: string) => {
        setIsPageLoading(true);
        fetchNui('editAnnouncement', { id: id, text: finalText }).then((response: any) => {
            if (response.success) {
                setIsEditing(false);
                fetchAnnouncement();
                showNotification(t('announcement.edit.success', { id: `${id}` }), 'success');
            } else {
                showNotification(t('announcement.edit.error', { id: `${id}` }), 'error');
            }
        }).catch((error) => {
            showNotification(t('announcement.edit.error', { id: `${id}` }), 'error');
            console.error(t('announcement.edit.error_log'), error);
        });
    };

    useEffect(() => {
        if (!announcementContent) {
            setIsPageLoading(true);
        } else {
            setIsPageLoading(false);
        }
    }, [announcementContent]);

    const hasEditPerms = hasPermission('announcement.edit');
    const hasRemovePerms = hasPermission('announcement.remove');

    return (
        <PageProvider
            title={t('announcement.title')}
            description={t('announcement.description', {id: `${id}`})}
            onBack={location.state?.onBack || '/announcements'}
            loading={isPageLoading}
        >
            {announcementContent ? (
                <div className="announcement-page">
                    <h1>{announcementContent.title}</h1>
                    <div className="buttons">
                        {hasEditPerms ? (
                            <Button
                                onClick={() => {
                                    if (isEditing) {
                                        handleSaveEdit(announcementContent.description);
                                    } else {
                                        setIsEditing(true);
                                    }
                                }}
                                type="default"
                                icon={<CiEdit style={{ fontSize: '1.3em' }} />}
                            >
                                {!isEditing ? t('announcement.edit.label') : t('global.save')}
                            </Button>
                        ) : (
                            <Tooltip title={t('announcement.no_permissions')}>
                                <Button
                                    type="default"
                                    disabled
                                    icon={<CiEdit style={{ fontSize: '1.3em' }} />}
                                >
                                    {!isEditing ? t('announcement.edit.label') : t('global.save')}
                                </Button>
                            </Tooltip>
                        )}

                        {isEditing && (
                            <Button
                                onClick={() => setIsEditing(false)}
                                type="default"
                                icon={<MdOutlineCancel style={{ fontSize: '1.3em' }} />}
                            >
                                {t('global.cancel')}
                            </Button>
                        )}
                        {!isEditing && (hasRemovePerms ? (
                            <Popconfirm
                                placement="top"
                                title={t('announcement.remove_warning_title')}
                                description={t('announcement.remove_warning_description')}
                                okText={t('announcement.remove_confirm')}
                                onConfirm={() => handleRemove()}
                                cancelText={t('announcement.remove_cancel')}
                            >
                                <Button
                                    type="default"
                                    icon={<FaTrash style={{ fontSize: '1.3em' }} />}
                                >
                                    {t('announcement.remove')}
                                </Button>
                            </Popconfirm>
                        ) : (
                            <Tooltip title={t('announcement.no_permissions')}>
                                <Button
                                    disabled
                                    type="default"
                                    icon={<FaTrash style={{ fontSize: '1.3em' }} />}
                                >
                                    {t('announcement.remove')}
                                </Button>
                            </Tooltip>
                        ))}
                    </div>
                    <div className="text-editor">
                        <div className="author">
                            <span>
                                <FiUser className="icon" />
                                <p>{announcementContent.author}</p>
                            </span>
                            <span>
                                <IoTimeOutline className="icon" />
                                <p>{formatDate(announcementContent.created_at)}</p>
                            </span>
                        </div>
                        <RichTextEditor
                            className={isEditing ? 'edit' : ''}
                            value={announcementContent.description}
                            onChange={(value) => setAnnouncementContent({ ...announcementContent, description: value })}
                            readOnly={!isEditing}
                        />
                    </div>
                </div>
            ) : null}
        </PageProvider>
    );
};

export default Announcement;
