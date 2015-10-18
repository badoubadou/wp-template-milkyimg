var config = require('./');

module.exports = {
	watch: [
	config.sourceDirectory + '/core/css/**/*.styl',
	config.sourceDirectory + '/module/**/*.styl',
	config.sourceDirectory + '/page/**/*.styl'
	],
	src: [
	config.sourceDirectory + '/core/css/**/style.styl',
	config.sourceDirectory + '/core/css/vendor/*.css'
	],
	srcpage: [
	config.sourceDirectory + '/page/**/*.styl'
	],
	srcadmin: [
	config.sourceDirectory + '/core/css/**/admin.styl',
	config.sourceDirectory + '/core/css/vendor/flexislider.css'
	// '!' + config.sourceDirectory + '/core/css/vendor/flexislider.css'
	],
	dest: config.publicDirectory + '/css',
	destpage: config.publicDirectory + '/css/page'
};
