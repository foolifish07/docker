#!/bin/bash -exu

function run_with_uid2222(){
	docker run --rm -it \
		--env="uid=2222" \
	    'foolifish07/base' \
	    bash
}

run_with_uid2222