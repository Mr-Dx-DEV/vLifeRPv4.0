// Will return whether the current environment is in a regular browser
// and not CEF
export const isEnvBrowser = (): boolean => !(window as any).invokeNative;

// Basic no operation function
export const noop = () => {};

export const navigateWithAnimation = (path: string, onBack?: string) => {
    window.postMessage({ action: "navigate", path: path, onBack });
};

export const showNotification = (message: string, type: "warning" | "info" | "success" | "error", duration?: number,) => {
    window.postMessage({ action: "showNotification", message: message, type: type, duration: duration });
}

export const toggleUI = (action: "open" | "close") => {
    window.postMessage({ action }, "*");
};

export const isValidImageUrl = (url: string): Promise<boolean> => {
    return new Promise((resolve) => {
        const img = new Image()
        img.onload = () => resolve(true)
        img.onerror = () => resolve(false)
        img.src = url
    })
}

export const getBodyPartByCoordinates = (bodyRegions: {x1: number; x2: number; y1: number; y2: number; name: string}[], x: number, y: number) => {
    for (const region of bodyRegions) {
        if (x >= region.x1 && x <= region.x2 && y >= region.y1 && y <= region.y2) {
            return region.name
        }
    }
    return 'Unknown'
}