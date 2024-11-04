import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

function addBaseHrefPlugin() {
    return {
        name: 'add-base-href',
        transformIndexHtml(html) {
            const isProd = process.env.NODE_ENV === 'production'

            if (isProd) {
                return html.replace(/<head>/, `<head>\n<base href="/web/build/">`)
            }

            return html
        },
    }
}

export default defineConfig({
    plugins: [
        react(),
        addBaseHrefPlugin(),
    ],
    base: './',
    build: {
        outDir: 'build',
    },
    server: {
        hmr: {
            overlay: false,
        },
    },
})
