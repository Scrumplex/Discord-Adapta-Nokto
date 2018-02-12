var gulp = require('gulp');
var pump = require('pump');

// CSS
const sass = require('gulp-sass');

gulp.task('default', function (callback) {
	pump([
			gulp.src('theme/src/adapta-nokto.scss'),
			sass({outputStyle: 'compressed'}),
			gulp.dest('theme/dist')
		],
		callback);

});
