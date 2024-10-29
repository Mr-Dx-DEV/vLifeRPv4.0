import { writable } from 'svelte/store';

export const wallpaper_url1 = writable(localStorage.getItem('wallpaper_url1') ? localStorage.getItem('wallpaper_url1') : '');