import React from "react";
import "./Loading.scss";

interface LoadingProviderProps {
    children?: React.ReactNode;
}

const LoadingProvider: React.FC<LoadingProviderProps> = ({ children }) => {
    const childrenCount = React.Children.count(children);

    return (
        <div style={{ position: "relative", width: "100%", height: "100%" }}>
            {childrenCount === 0 ? (
                <div className="lds-ripple">
                    <div></div>
                    <div></div>
                </div>
            ) : (
                children
            )}
        </div>
    );
};

export default LoadingProvider;
