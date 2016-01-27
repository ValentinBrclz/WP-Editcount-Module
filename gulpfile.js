var gulp = require('gulp'),
	mediawiki = require('gulp-mediawiki'),
	gitWatch = require('gulp-git-watch'),
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

gulp.task('git-watch', function() {
	//noinspection JSUnresolvedFunction
	gitWatch()
		.on('change', function(newHash, oldHash) {
			gulp.start('default');
		});
});
