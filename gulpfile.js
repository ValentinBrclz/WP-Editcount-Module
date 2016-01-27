var gulp = require('gulp'),
	mediawiki = require('gulp-mediawiki'),
	userinfo = require('./userinfo');

var options = {
	server: 'fr.wikipedia.org',
	port: 80,
	path: '/w',
	username: userinfo.username,
	password: userinfo.password,
	extension: '.lua',
	edit_message: "[AUTO] Update from Github repository"
};

gulp.task('default', function () {
	return gulp.src('lib/*.lua')
		.pipe(mediawiki(options));
});
