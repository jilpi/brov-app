# Makefile inspired from https://github.com/technoweenie/coffee-resque/blob/master/Makefile

generate-js: deps
	@find src/bin -name '*.coffee' | xargs coffee -c -o bin

remove-js:
	@rm -fr bin/

deps:
	@test `which coffee` || echo 'You need to have CoffeeScript in your PATH.\nPlease install it using `brew install coffee-script` or `npm install coffee-script`.'

#test: deps
#	@find test -name '*_test.coffee' | xargs -n 1 -t coffee

publish: generate-js
	@test `which npm` || echo 'You need npm to do npm publish... makes sense?'
	npm publish
	@remove-js

link: generate-js
	@test `which npm` || echo 'You need npm to do npm link... makes sense?'
	npm link
	@remove-js

dev: generate-js
	@coffee -wc -o bin src/bin/*.coffee
#	@coffee -wc --no-wrap -o bin src/bin/*.coffee
