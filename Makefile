.PHONY: \
	ci \
	fresh-build \
	deps \
	deps-get \
	deps-update \
	select_plt \
	compile \
	test \
	clean \
	dialyze

ci: \
	deps \
	compile \
	test

select_plt:
	@./plt/select.sh

fresh-build: \
	clean \
	deps \
	compile

deps: \
	deps-get \
	deps-update

deps-get:
	@rebar get-deps

deps-update:
	@rebar update-deps

compile:
	@rebar compile

test:
	@rebar ct skip_deps=true --verbose=0

clean:
	@rebar clean
	@rm -rf ebin/

dialyze:
	@dialyzer ebin deps/*/ebin/*.beam
