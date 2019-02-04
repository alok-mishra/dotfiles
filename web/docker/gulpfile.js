var gulp = require('gulp'),
    sync = require('browser-sync'),
    sass = require('gulp-sass');

var PATH = 'wp-content/themes/**/';

gulp.task('default', function() {
    sync.init({
        proxy: process.platform == 'linux' ? 'http://localhost' : 'http://192.168.99.100',
    });

    gulp.watch(PATH + '/*.scss').on('change', file =>
        gulp
            .src(file.path, { base: './' })
            .pipe(sass({ outputStyle: 'compact' }).on('error', sass.logError))
            .pipe(gulp.dest('./'))
    );

    gulp.watch(PATH + '/*.php', ['reload']);
    gulp.watch(PATH + '/*.css', ['reload']);
});

gulp.task('reload', function() {
    sync.reload();
});
