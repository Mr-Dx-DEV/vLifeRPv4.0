import React, { useEffect, useRef, useState } from "react";
import { PageProvider } from "../../providers/PageProvider";
import "./Dispatch.scss";
import { DispatchNotifications } from "../../types";
import DispatchNotification from "./DispatchNotification";
import { fetchNui } from "../../utils/fetchNui";

import MapProvider from "../../providers/MapProvider";
import NoResult from "../../components/NoResult";
import { t } from "../../hooks/useLocale";
import { useNuiEvent } from "../../hooks/useNuiEvent";

const Dispatch: React.FC = () => {
    const [selectedCoords, setSelectedCoords] = useState<{ x: number; y: number } | null>(null);
    const [selectedNotificationId, setSelectedNotificationId] = useState<number | null>(null);
    const notificationRefs = useRef<{ [key: number]: HTMLDivElement | null }>({});
    const [dispatchCalls, setDispatchCalls] = useState<DispatchNotifications[]>([]);
    const [isPageLoading, setIsPageLoading] = useState(true);

    const handleMarkerClick = (notification: DispatchNotifications) => {
        setSelectedCoords(notification.coords);
        setSelectedNotificationId(notification.id);
        notificationRefs.current[notification.id]?.scrollIntoView({ behavior: "smooth", block: "center" });
    };

    const fetchDispatchNotifications = () => {
        fetchNui("getDispatchNotifs").then((response: any) => {
            const sortedNotifications = response ? response.sort((a: DispatchNotifications, b: DispatchNotifications) => b.id - a.id) : [];
            setDispatchCalls(sortedNotifications);
            setIsPageLoading(false);
        });
    };

    useNuiEvent('dispatchNotification', (data: DispatchNotifications) => {
        setDispatchCalls((prevs) => {
            const updatedCalls = [data, ...prevs];
            return updatedCalls.sort((a, b) => b.id - a.id);
        });
    });

    useEffect(() => {
        fetchDispatchNotifications();
    }, []);

    return (
        <PageProvider loading={isPageLoading} title={t('dispatch.title')} description={t('dispatch.description')}>
            <div className="dispatch-page-container">
                <div className="map-container">
                    <MapProvider
                        dispatchCalls={dispatchCalls || []}
                        selectedCoords={selectedCoords}
                        handleMarkerClick={() => handleMarkerClick}
                        selectedCamera={null}
                        cameras={[]}
                    />
                </div>
                <div className="details-container" style={{ overflowY: "auto" }}>
                    {dispatchCalls && dispatchCalls.length > 0 ?
                        dispatchCalls.map((notification) => (
                            <DispatchNotification
                                onClick={() => handleMarkerClick(notification)}
                                key={notification.id}
                                notification={notification}
                                selected={notification.id === selectedNotificationId}
                                onCancelSelect={() => setSelectedNotificationId(null)}
                                ref={(el) => (notificationRefs.current[notification.id] = el)}
                            />
                        )) : <NoResult title={t('dispatch.no_result.title')} subtitle={t('dispatch.no_result.subtitle')}/>}
                </div>
            </div>
        </PageProvider>
    );
};

export default Dispatch;
