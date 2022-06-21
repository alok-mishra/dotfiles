const colors = require('tailwindcss/colors');

module.exports = {
    content: ['./wp-content/themes/**/*.{html,js,php}', './wp-content/themes/**/templates/*.php'],
    safelist: [],
    theme: {
        extend: {
            colors: {
                teal: colors.teal
            },
            maxWidth: {
                xxs: '16rem'
            }
        }
    },
    plugins: [],

    corePlugins: {
        backgroundOpacity: false,
        preflight: false
    }
};
