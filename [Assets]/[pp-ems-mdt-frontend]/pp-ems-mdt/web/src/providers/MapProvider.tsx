import React, { useEffect, useState } from "react";
import { MapContainer, TileLayer, Marker, Circle, useMap, LayersControl } from "react-leaflet";
import Leaflet, { extend, Projection, Transformation } from "leaflet";
import "leaflet/dist/leaflet.css";
import { GiCctvCamera } from "react-icons/gi";
import ReactDOMServer from "react-dom/server";
import { fetchNui } from "../utils/fetchNui";
import { isEnvBrowser } from "../utils/misc";
import { useConfig } from "../hooks/useConfig";

const CENTER_X = 117.3;
const CENTER_Y = 172.8;
const SCALE_X = 0.02072;
const SCALE_Y = 0.0205;
const MAX_BOUNDS: [[number, number], [number, number]] = [
    [8000.0, -4000.0],
    [-4000.0, 4000.0],
];

const CRS = extend({}, Leaflet.CRS.Simple, {
    projection: Projection.LonLat,
    scale: (zoom: number) => Math.pow(2, zoom),
    zoom: (sc: number) => Math.log(sc) / 0.6931471805599453,
    distance: (position: any, target: any) => {
        let x_difference: number = target.y - position.y;
        let y_difference: number = target.x - position.x;
        return Math.sqrt(x_difference * x_difference + y_difference * y_difference);
    },
    transformation: new Transformation(SCALE_X, CENTER_X, -SCALE_Y, CENTER_Y),
    infinite: true,
});

const createIcon = (color: string) => {
    return Leaflet.icon({
        iconUrl: `./public/markers/${color}.png`,
        iconSize: [19, 31],
        iconAnchor: [9.5, 31],
        popupAnchor: [1, -24],
        shadowSize: [31, 31],
    });
};

const createCameraIcon = () => {
    return Leaflet.divIcon({
        html: ReactDOMServer.renderToString(<GiCctvCamera size={24} color="black" />),
        className: "",
        iconSize: [24, 24],
        iconAnchor: [12, 24],
        popupAnchor: [0, -24],
    });
};

const FlyToMarker = ({ coords }: { coords: { x: number; y: number } }) => {
    const map = useMap();
    useEffect(() => {
        if (coords) {
            map.flyTo([coords.y, coords.x], map.getZoom(), { animate: true });
        }
    }, [coords, map]);

    return null;
};

interface MapProviderProps {
    dispatchCalls: any[];
    selectedCoords: { x: number; y: number } | null;
    handleMarkerClick: (cameraId: number, coords?: { x: number; y: number }) => void;
    cameras: { id: number; coords: { x: number; y: number } }[];
    selectedCamera: number | null;
}

const fetchPlayerPosition = async () => {
    return fetchNui("getPlayerPosition").then((response: any) => response);
};

const colorsMap: Record<string, string> = {
    "blue": "#0958d9",
    "pink": "#c41d7f",
    "orange": "#d46b08",
    "green": "#389e0d",
    "cyan": "#08979c",
    "purple": "#531dab",
    "black": "#000000",
    "red": "#ab1d1d",
    "gray": "#757379"
};

const MapProvider: React.FC<MapProviderProps> = ({
    dispatchCalls,
    selectedCoords,
    handleMarkerClick,
    cameras,
    selectedCamera,
}) => {
    const [playerPosition, setPlayerPosition] = useState<{ x: number; y: number } | null>(null);
    const config = useConfig();

    const updatePlayerPosition = async () => {
        const position = await fetchPlayerPosition();
        setPlayerPosition(position);
    };

    useEffect(() => {
        updatePlayerPosition();
        const intervalId = setInterval(updatePlayerPosition, config?.playerPositionRefreshRate || 1000);
        return () => clearInterval(intervalId);
    }, []);

    if (!playerPosition) {
        return null;
    }

    return (
        <MapContainer
            className="game-map"
            crs={CRS}
            minZoom={1.5}
            maxZoom={5}
            preferCanvas={true}
            center={[playerPosition.y, playerPosition.x]}
            zoom={4}
            zoomControl={false}
            maxBounds={MAX_BOUNDS}
            attributionControl={false}
            style={{ flex: 1, height: "100%" }}
        >
            <LayersControl position="topright">
                <LayersControl.BaseLayer checked name="Satellite">
                    <TileLayer
                        url="https://www.gtamap.xyz/mapStyles/styleSatelite/{z}/{x}/{y}.jpg"
                        attribution='&copy; <a href="https://www.gtamap.xyz">GTAMap</a>'
                        noWrap={true}
                    />
                </LayersControl.BaseLayer>
                <LayersControl.BaseLayer name="Atlas">
                    <TileLayer
                        url="https://www.gtamap.xyz/mapStyles/styleAtlas/{z}/{x}/{y}.jpg"
                        attribution='&copy; <a href="https://www.gtamap.xyz">GTAMap</a>'
                        noWrap={true}
                    />
                </LayersControl.BaseLayer>
                <LayersControl.BaseLayer name="Grid">
                    <TileLayer
                        url="https://www.gtamap.xyz/mapStyles/styleGrid/{z}/{x}/{y}.png"
                        attribution='&copy; <a href="https://www.gtamap.xyz">GTAMap</a>'
                        noWrap={true}
                    />
                </LayersControl.BaseLayer>
            </LayersControl>

            {dispatchCalls?.length > 0 &&
                dispatchCalls.map((notification) => (
                    <React.Fragment key={notification.id}>
                        <Marker
                            position={[notification.coords.y, notification.coords.x]}
                            icon={createIcon(notification.code.color)}
                            eventHandlers={{
                                click: () => handleMarkerClick(notification.id, notification.coords),
                            }}
                        />
                        {notification.radius && (
                            <Circle
                                center={[notification.coords.y, notification.coords.x]}
                                radius={notification.radius}
                                color={colorsMap[notification.code.color]}
                            />
                        )}
                    </React.Fragment>
                ))}

            <Marker position={[playerPosition.y, playerPosition.x]} icon={createIcon("dot")}></Marker>
            {selectedCoords && <FlyToMarker coords={selectedCoords} />}
            {cameras.map((camera) => (
                camera.coords && camera.coords.x !== undefined && camera.coords.y !== undefined && (
                    <Marker
                        key={camera.id}
                        position={[camera.coords.y, camera.coords.x]}
                        icon={createCameraIcon()}
                        eventHandlers={{
                            click: () => handleMarkerClick(camera.id, camera.coords),
                        }}
                    />
                )
            ))}
        </MapContainer>
    );
};

export default MapProvider;
