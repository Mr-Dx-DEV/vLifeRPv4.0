import { fetchNui } from "./fetchNui";
import { isEnvBrowser } from "./misc";

interface Permissions {
    [key: string]: boolean;
}

let permissions: Permissions = {};

export const fetchPermissions = async () => {
    return fetchNui("getPermissions").then((response: any) => {
        permissions = response.reduce((acc: Permissions, perm: string) => {
            acc[perm] = true;
            return acc;
        }, {});
    });
};

export const hasPermission = (permissionName: string): boolean => {
    const hasPerm = permissions[permissionName] ?? false;
    return isEnvBrowser() ? true : hasPerm;
};
