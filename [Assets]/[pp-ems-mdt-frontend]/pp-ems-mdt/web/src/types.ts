export interface SearchProps {
    value: string
    label: string
    type: string
}

export interface DispatchNotifications {
    id: number
    street: string
    title: string
    description: string
    timestamp: number
    citizen?: {
        value?: string
        label?: string
        gender?: string
    }
    code: {
        code: string
        color: 'blue' | 'pink' | 'orange' | 'green' | 'cyan' | 'purple' | 'black' | 'red'
    }
    coords: {
        x: number
        y: number
    }
    responds: respondsProps[]
    duration?: number
    radius?: number
    flash?: boolean
    weapon?: string
    meResponding?: boolean
}

interface respondsProps {
    label: string
    value: string
}

export interface FpProps {
    img: string
    name: string
    grade: string
    badge: string
    radio: number
}

export interface citizensProps {
    img: string
    name: string
    ssn: number
    wanted: boolean
    identifier: string
}

export interface vehiclesProps {
    img: string
    model: string
    plate: string
    wanted: boolean
    owner: string
    ownerWanted: boolean
    ownerIdentifier: string
    manufactuer?: string
    notes?: {
        title: string
        description: string
        id: number
        created_at: string
    }[]
    cases?: {
        title: string
        description: string
        id: number
        wanted: boolean
        created_at: string
        type: 'warrant' | 'used_warrant' | 'expired_warrant' | 'incident'
    }[]
}

export interface NotificationProps {
    title: string
    description: string
    type: 'info' | 'success' | 'error' | 'warning'
    duration?: number
}

export interface weaponsProps {
    serialnumber: string
    model: string
    owner: string
    wanted: boolean
    img: string
}

export interface weaponProps {
    serialnumber: string
    model: string
    owner: string
    wanted: boolean
    img: string
    bought: {
        when: string
        where: string
    }
    notes: {
        title: string
        description: string
        id: number
        created_at: string
    }[]
    cases: {
        title: string
        description: string
        id: number
        created_at: string
        wanted: boolean
        type: 'warrant' | 'used_warrant' | 'expired_warrant' | 'incident'
    }[]
}

export interface Announcement {
    id: number
    title: string
    description: string
    author: string
    created_at: string
}

export interface Case {
    injuries: {
        fineReduction: number
        injuries: {
            id: number
            bodyPart: string
            price: number
            type: string
            x: number
            y: number
        }[]
    }
    title: string
    id: number
    date: string
}
