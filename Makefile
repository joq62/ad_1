all:
	#INFO: with_ebin_commit STARTED
	#INFO: Cleaning up to prepare build STARTED	 
	#INFO: Deleting crash reports
	rm -rf erl_cra* rebar3_crashreport;
	#INFO: Deleting euinit test applications dirs
	rm -rf log resource_discovery etcd;
	rm -rf inventory;
	rm -rf host_specs catalog application_dir deployment_specs catalog_specs;
	rm -rf doc Mnesia.*;
	rm -rf test_ebin;
	#INFO: Deleting tilde files and beams
	rm -rf *~ */*~ */*/*~;
	rm -rf src/*.beam src/*/*.beam;
	rm -rf test/*.beam test/*/*.beam;
	rm -rf *.beam;
	#INFO: Deleting files and dirs created during builds
	rm -rf _build;
	rm -rf ebin;
	rm -rf rebar.lock
	#INFO: Deleting files and dirs created during execution/runtime 
	rm -rf logs;
	rm -rf *_a;
	#INFO: Compile application
#	mkdir ebin;		
	rebar3 compile;	
#	cp _build/default/lib/*/ebin/* ebin;
	rm -rf _build*;
#	rm -rf ebin;
#	git add *;
	git status
	echo Ok there you go!
	#INFO: no_ebin_commit ENDED SUCCESSFUL
rel:
	#INFO: Build a release and tar ball
#	related to dev and  testing
	rm -rf *~ */*~ */*/*~
	rm -rf erl_cra* rebar3_crashreport;
	rm -rf *.beam */*.beam */*/*.beam;
	rm -rf Mnesia*;
	rm -rf logs;
	rm -rf ebin test_ebin;
#	related to build
	rm -rf rebar.lock;
	rm -rf _build* release;
#	build
	rebar3 compile
	rebar3 release;
	rebar3 as prod tar;
	mkdir release;
	cp _build/prod/rel/ad_1_rel/*.tar.gz release/ad_1.tar.gz;
	rm -rf _build*;
build:
	#INFO: with_ebin_commit STARTED
	#INFO: Cleaning up to prepare build STARTED	 
	#INFO: Deleting crash reports
	rm -rf erl_cra* rebar3_crashreport_GLURK;
	#INFO: Deleting euinit test applications dirs
	rm -rf log resource_discovery etcd;
	rm -rf inventory;
	rm -rf host_specs catalog application_dir deployment_specs catalog_specs;
	rm -rf doc;
	rm -rf test_ebin;
	#INFO: Deleting tilde files and beams
	rm -rf *~ */*~ */*/*~;
	rm -rf src/*.beam src/*/*.beam;
	rm -rf test/*.beam test/*/*.beam;
	rm -rf *.beam;
	#INFO: Deleting files and dirs created during builds
	rm -rf _build;
	rm -rf ebin;
	rm -rf rebar.lock
	#INFO: Deleting files and dirs created during execution/runtime 
	rm -rf logs Mnesia.*;
	rm -rf *_a;
	#INFO: Compile application
	mkdir ebin;		
	rebar3 compile;	
	cp _build/default/lib/*/ebin/* ebin;
#	rm -rf _build*;
	rm -rf ebin;
	#INFO: build ENDED SUCCESSFUL
clean:
	#INFO: clean STARTED
	#INFO: Cleaning up to prepare build STARTED	 
	#INFO: Deleting crash reports
	rm -rf erl_cra* rebar3_crashreport_GLURK;
	#INFO: Deleting euinit test applications dirs
	rm -rf log resource_discovery etcd;
	rm -rf inventory;
	rm -rf host_specs catalog application_dir deployment_specs catalog_specs;
	rm -rf test_ebin;
	#INFO: Deleting tilde files and beams
	rm -rf *~ */*~ */*/*~;
	rm -rf src/*.beam src/*/*.beam;
	rm -rf test/*.beam test/*/*.beam;
	rm -rf *.beam;
	#INFO: Deleting files and dirs created during builds
	rm -rf _build;
	rm -rf ebin;
	rm -rf rebar.lock
	#INFO: Deleting files and dirs created during execution/runtime 
	rm -rf logs  Mnesia.*;
	rm -rf *_a;
	#INFO: clean ENDED SUCCESSFUL
eunit: 
	#INFO: eunit STARTED
	#INFO: Cleaning up to prepare build STARTED	 
	#INFO: Deleting crash reports
	rm -rf erl_cra* rebar3_crashreport_GLURK;
	#INFO: Deleting euinit test applications dirs
	rm -rf log resource_discovery etcd;
	rm -rf inventory;
	rm -rf host_specs catalog application_dir deployment_specs catalog_specs;
	rm -rf doc;
	rm -rf test_ebin;
	#INFO: Deleting tilde files and beams
	rm -rf src/*.beam src/*/*.beam;
	rm -rf test/*.beam test/*/*.beam;
	rm -rf *.beam;
	#INFO: Deleting files and dirs created during builds
	rm -rf _build;
	rm -rf ebin;
	rm -rf rebar.lock
	#INFO: Deleting files and dirs created during execution/runtime 
	rm -rf logs Mnesia.*;
	rm -rf *_a;
	#INFO: Creating eunit test code using test_ebin dir;
	mkdir test_ebin;
	#rm test/dependent_apps.erl;
	#cp /home/joq62/erlang/dev_support/dependent_apps.erl test;
	erlc -I include -I /home/joq62/erlang/include -o test_ebin test/*.erl;
	#INFO: Creating Common applications needed for testing
	#INFO: Compile application
	mkdir ebin;		
	rebar3 compile;	
#	cp _build/default/lib/*/ebin/* ebin;
#	rm -rf _build*;
	#INFO: Starts the eunit testing .................
	erl -pa _build/default/lib/ad_2/ebin\
	 -pa ebin\
	 -pa test_ebin\
	 -sname test_ad_1_a\
	 -run $(m) start\
	 -setcookie a
