var config = require('./');

module.exports = {
	watch: [
	config.sourceDirectory + '/css/**/*.styl',
	config.sourceDirectory + '/module/**/style.styl'],
	src: [
	config.sourceDirectory + '/css/**/style.styl',
	// config.sourceDirectory + '/module/**/style.styl',
	config.sourceDirectory + '/css/vendor/*.css'
	],
	srcadmin: [
	config.sourceDirectory + '/css/**/admin.styl',
	// config.sourceDirectory + '/module/**/style.styl',
	'!' + config.sourceDirectory + '/css/vendor/flexislider.css'
	],
	dest: config.publicDirectory + '/css'
};
