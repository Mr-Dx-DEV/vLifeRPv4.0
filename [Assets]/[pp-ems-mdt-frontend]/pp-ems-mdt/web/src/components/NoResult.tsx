import React from "react";
import { LuSearchX } from "react-icons/lu";

interface NoResultProps {
    align?: "top" | "center" | "bottom";
    title?: string;
    subtitle?: string;
}

const NoResult: React.FC<NoResultProps> = ({ align, title, subtitle }) => {
    var verticalAlign = "center";
    switch (align) {
        case "top":
            verticalAlign = "top";
        case "center":
            verticalAlign = "center";
        case "bottom":
            verticalAlign = "bottom";
    }
    return (
        <div
            style={{
                display: "flex",
                justifyContent: verticalAlign,
                alignItems: "center",
                height: "100%",
                width: "100%",
                flexDirection: "column",
            }}>
            <LuSearchX style={{ fontSize: "3em" }} />
            <h3 style={{ margin: "0", color: "var(---token-colorText)" }}>{title ? title : "No result"}</h3>
            <p style={{ margin: "0", color: "var(---token-colorTextPrimary)" }}>
                {subtitle ? subtitle : "No results found for this query."}
            </p>
        </div>
    );
};

export default NoResult;
