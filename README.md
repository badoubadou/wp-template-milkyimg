Beton from : gulp-starter
============
## Features
- Compile stylus
  - Autoprefix (to do )
  - Minify
- Compile JS with coffee
  - Uglify and optimizes for production builds (to do)
- Compile jade php
- Compile an SVG Spritesheet from a folder of SVGs (might remove)
- Compile an Icon Font (woff, woff2, ttf, svg, eot) from a folder of SVGs
- File Watching + Live reloading with [BrowserSync](http://www.browsersync.io/) (to do)
- Optimizes Images
- Production task revs and compress all assets, and updates references
- Quickly deploy `public` folder to gh-pages (`gulp deploy` task)
- Handles WebFonts
- Testing with Karma, Mocha, Chai, Sinon
- Travis CI integration
- Local production sever for testing

## Live Demo
http://greypants.github.io/gulp-starter/
Result of running `gulp deploy`

## Install dependencies
```
npm install
```

## Start gulp for local development
```
npm run watch
```
or

```
gulp
```
To use gulp commands directly, you may need to alias `gulp` to `node_modules/.bin/gulp`, or `npm install -g gulp`.

Start editing assets and views from the `gulp/assets` and `gulp/views` folder. Files compile to `public`.

## Preview production environment
```
npm start
```

or

```
gulp build:production (should look at it)
gulp server
```

## Deploy to GitHub pages
```
npm run deploy
```
This will run karma, build your files, revision and compress them, and copy the contents of the public folder to a `gh-pages` branch, and push it up to GitHub.

[![Build Status](https://travis-ci.org/greypants/gulp-starter.svg?branch=static-server)](https://travis-ci.org/greypants/gulp-starter)
