var config = require('./');

module.exports = {
	watch: [
	config.sourceDirectory + '/core/css/**/*.styl',
	config.sourceDirectory + '/module/**/*.styl'],
	src: [
	config.sourceDirectory + '/core/css/**/style.styl',
	config.sourceDirectory + '/core/css/vendor/*.css'
	],
	srcadmin: [
	config.sourceDirectory + '/core/css/**/admin.styl',
	config.sourceDirectory + '/core/css/vendor/flexislider.css'
	// '!' + config.sourceDirectory + '/core/css/vendor/flexislider.css'
	],
	dest: config.publicDirectory + '/css'
};
