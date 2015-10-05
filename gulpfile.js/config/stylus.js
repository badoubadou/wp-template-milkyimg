var config = require('./');

module.exports = {
	watch: config.sourceDirectory + '/css/**/*.styl',
	src: [config.sourceDirectory + '/css/**/style.styl', config.sourceDirectory + '/css/vendor/*.css'],
	dest: config.publicDirectory + '/css',
	srcadmin: [
		config.sourceDirectory + '/css/**/admin.styl',
		// config.sourceDirectory + '/css/vendor/*.css',
		'!' + config.sourceDirectory + '/css/vendor/flexislider.css'
	]
};
