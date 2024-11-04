import { fetchNui } from "../utils/fetchNui";

export const hideUI = (action: "open" | "close") => {
    const UI = document.querySelector('.app-container') as HTMLElement;
    if (UI) {
        UI.style.display = action === "close" ? "none" : "flex";
    }
    fetchNui('setNuiFocus', action === "close" ? false : true);
};

export const useCamera = (): Promise<string | false> => {
    return new Promise((resolve) => {
        const handleMessage = (event: MessageEvent) => {
            if (event.data.action === "cameraResult") {
                hideUI("open");
                window.removeEventListener("message", handleMessage);
                if (event.data.link) {
                    resolve(event.data.link);
                } else {
                    resolve(false);
                }
            }
        };

        window.addEventListener("message", handleMessage);
        hideUI("close");
        fetchNui("useCamera");
    });
};
