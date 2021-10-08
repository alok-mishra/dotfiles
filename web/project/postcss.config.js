module.exports = {
    plugins: {
        tailwindcss: {},
        'postcss-nested': {},
        autoprefixer: {},
        'postcss-css-variables': {},
        cssnano: {
            preset: [
                'default',
                {
                    discardComments: {
                        removeAll: true,
                    },
                },
            ],
        },
    },
};
