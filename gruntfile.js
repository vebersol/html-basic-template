module.exports = function(grunt) {
	var jsSrcPath = 'src/js/',
		cssSrcPath = 'src/sass/',
		outPath = 'www/assets/',
		outJSPath = outPath + 'js/',
		uglifyDest = outJSPath + '/application.min.js';
	outCSSPath = outPath + 'css/';

	// Project configuration.
	grunt.initConfig({
		compass: {
			dist: {
				options: {
					basePath: 'src',
					config: 'src/config.rb'
				}
			}
		},
		concat: {
			js: {
				"src": [
					jsSrcPath + "lib/jquery.js",
					jsSrcPath + "core/common.js"
				],
				"dest": outJSPath + "application.js"
			},
			options: {
				separator: '\n\n\n',
				stripBanners: true,
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n\n'
			},
		},
		watch: {
			options: {
				livereload: true
			},
			src: {
				files: ['src/js/**/*.js'],
				tasks: ['concat']
			},
			css: {
				files: ['src/sass/**/*.scss'],
				tasks: ['compass']
			}
		},
		uglify: {
			options: {
				mangle: true,
				compress: false
			},
			my_target: {
				files: {
					'www/assets/js/application-min.js': [outJSPath + '/application.js']
				}
			}
		}
	});

	grunt.event.on('watch', function(action, filepath, target) {
		grunt.log.writeln(target + ': ' + filepath + ' has ' + action);
	});

	// Load required modules
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-compass');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-livereload'); // add javascript file to html or use the live reload plugin

	// Default task(s).
	grunt.registerTask('default', ['compass', 'concat']);
	grunt.registerTask('production', ['compass', 'concat', 'uglify']);

};
