import {
    differenceInSeconds,
    differenceInMinutes,
    differenceInHours,
    differenceInDays,
    differenceInWeeks,
    differenceInMonths,
    differenceInYears,
    format,
} from 'date-fns'
import { useConfig } from './hooks/useConfig'
import { t } from './hooks/useLocale';

const getLabel = (value: number, ranges: { min: number; max: number; label: string }[]) => {
    for (let range of ranges) {
        if (value >= range.min && value <= range.max) {
            return range.label.replace('x', value.toString())
        }
    }
    return ''
}

export const formatTimeUntil = (date: Date) => {
    const config = useConfig()
    const localeLabels = config.dispatch.timeLabels
    const now = new Date()
    const secondsDiff = differenceInSeconds(date, now)

    const years = differenceInYears(date, now)
    if (years > 0) {
        return `${t('global.time_in')} ${getLabel(years, localeLabels.years)}`
    }

    const months = differenceInMonths(date, now)
    if (months > 0) {
        return `${t('global.time_in')} ${getLabel(months, localeLabels.months)}`
    }

    const weeks = differenceInWeeks(date, now)
    if (weeks > 0) {
        return `${t('global.time_in')} ${getLabel(weeks, localeLabels.weeks)}`
    }

    const days = differenceInDays(date, now)
    if (days > 0) {
        return `${t('global.time_in')} ${getLabel(days, localeLabels.days)}`
    }

    const hours = differenceInHours(date, now)
    if (hours > 0) {
        return `${t('global.time_in')} ${getLabel(hours, localeLabels.hours)}`
    }

    const minutes = differenceInMinutes(date, now)
    if (minutes > 0) {
        return `${t('global.time_in')} ${getLabel(minutes, localeLabels.minutes)}`
    }

    return `${t('global.time_in')} ${getLabel(secondsDiff, localeLabels.seconds)}`
}

export const formatDate = (dateString: string) => {
    const date = new Date(dateString)
    return format(date, 'yyyy-MM-dd HH:mm:ss')
}

export const formatRelativeTime = (unixTimestamp: number) => {
    const config = useConfig()
    const localeLabels = config.dispatch.timeLabels

    const now = new Date()
    const timestamp = new Date(unixTimestamp * 1000)

    const secondsDiff = differenceInSeconds(now, timestamp)
    if (secondsDiff < 60) {
        return getLabel(secondsDiff, localeLabels.seconds)
    }

    const minutesDiff = differenceInMinutes(now, timestamp)
    if (minutesDiff < 60) {
        return getLabel(minutesDiff, localeLabels.minutes)
    }

    const hoursDiff = differenceInHours(now, timestamp)
    if (hoursDiff < 24) {
        return getLabel(hoursDiff, localeLabels.hours)
    }

    const daysDiff = differenceInDays(now, timestamp)
    if (daysDiff < 7) {
        return getLabel(daysDiff, localeLabels.days)
    }

    const weeksDiff = differenceInWeeks(now, timestamp)
    if (weeksDiff < 5) {
        return getLabel(weeksDiff, localeLabels.weeks)
    }

    const monthsDiff = differenceInMonths(now, timestamp)
    if (monthsDiff < 12) {
        return getLabel(monthsDiff, localeLabels.months)
    }

    const yearsDiff = differenceInYears(now, timestamp)
    return getLabel(yearsDiff, localeLabels.years)
}

export default formatRelativeTime