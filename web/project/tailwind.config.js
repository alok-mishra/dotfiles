const colors = require('tailwindcss/colors');

module.exports = {
    mode: 'jit',
    purge: ['index.html'],
    darkMode: false, // or 'media' or 'class'
    theme: {
        extend: {
            colors: {
                teal: colors.teal,
                purple: {
                    lighter: '#E3DFE8',
                    light: '#A392BA',
                    DEFAULT: '#4E2B6B',
                    dark: '#472766',
                    grey: '#A49CB6',
                    pink: '#8D79A1',
                },
            },
        },
    },
    variants: {
        extend: {},
    },
    plugins: [],
    corePlugins: {
        // backgroundOpacity: false,
        textOpacity: false,
    },
};
