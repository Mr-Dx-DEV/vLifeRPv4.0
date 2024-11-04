import React, { useState } from "react";
import { Form, Input, Button } from "antd";
import { RichTextEditor } from "@mantine/rte";
import "./Form.scss";
import { fetchNui } from "../../../utils/fetchNui";
import { t } from "../../../hooks/useLocale";
import { useConfig } from "../../../hooks/useConfig";
import { navigateWithAnimation } from "../../../utils/misc";

const AnnouncementForm = () => {
    const [value, setValue] = useState("");
    const [form] = Form.useForm();
    const config = useConfig()
    const handleSubmit = () => {
        form.validateFields()
            .then((values) => {
                const finalValues = {
                    ...values,
                    content: value
                };
                fetchNui('createAnnouncement', { values: finalValues }).then((response: any) => {
                    if (response.success) {
                        navigateWithAnimation(`/announcement/${response.id}`);
                    }
                });
            })
            .catch((info) => {
                console.error("Validate Failed:", info);
            });
    };

    return (
        <Form
            form={form}
            className="announcements-form"
            layout="vertical"
            onFinish={handleSubmit}
            initialValues={{ content: value }}
        >
            <Form.Item
                name="title"
                label={t('announcements.form.title.label')}
                rules={[{ required: true, message: t('announcements.form.title.rule') }]}
            >
                <Input className="ant-input-no-focus-border" placeholder={t('announcements.form.title.placeholder')} />
            </Form.Item>
            <Form.Item
                name="content"
                label={t('announcements.form.content.label')}
                rules={[
                    {
                        required: true,
                        validator: () =>
                            value && value.trim().replace(/<[^>]+>/g, "").length >= config.announcements.minContentLength
                                ? Promise.resolve()
                                : Promise.reject(t('announcements.form.content.rule', {minLength: config.announcements.minContentLength})),
                    },
                ]}
            >
                <div className="editor-wrapper">
                    <RichTextEditor value={value} onChange={(content) => setValue(content)} />
                </div>
            </Form.Item>
            <Form.Item>
                <Button className="button" type="default" htmlType="submit">
                {t('announcements.form.submit')}
                </Button>
            </Form.Item>
        </Form>
    );
};

export default AnnouncementForm;
