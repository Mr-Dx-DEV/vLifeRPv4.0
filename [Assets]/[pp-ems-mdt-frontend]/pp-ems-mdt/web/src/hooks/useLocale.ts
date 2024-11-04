import { fetchNui } from "../utils/fetchNui";

let translations: Record<string, any> | null = null;

export const fetchTranslations = async () => {
    if (translations === null) {
        fetchNui("getLocale")
            .then((locale: any) => {
                translations = locale;
            });
    }
};

export const t = (path: string, replacements?: Record<string, string>): string => {
    if (!translations) {
        return path;
    }

    const keys = path.split(".");
    let result: any = translations;

    for (let key of keys) {
        if (result[key] === undefined) {
            return path;
        }
        result = result[key];
    }

    if (typeof result === "string") {
        if (replacements) {
            Object.keys(replacements).forEach(key => {
                result = result.replace(`{${key}}`, replacements[key]);
            });
        }
        return result;
    }

    return path;
};