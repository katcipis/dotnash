#!/usr/bin/env nash

import "aliases/cd"
import "aliases/go"
import "aliases/git"
import "aliases/vpn"
import "aliases/vault"
import "aliases/ssh"
import "aliases/vi"
import "aliases/plan9"
import "aliases/mount"
import "aliases/essentials"

# Setup environment variables
setenv GOPATH     = $HOME + "/workspace/go"
setenv GOROOT     = $HOME + "/go"
setenv NASHPATH   = $HOME + "/nash"
setenv NASHROOT   = $HOME + "/nashroot"
setenv PYTHONROOT = $HOME + "/.local/bin"
setenv PLAN9 = "/usr/local/plan9"
setenv PATH <= format("%s:%s/bin:%s/bin:%s/bin", $PATH, $GOPATH, $GOROOT, $PLAN9)
setenv SHELL = "/usr/bin/env nash"

refreshPrompt()

fn plan9start() {
    fn startifnot(name, initfn) {
	var _, status <= 9p ls $name >[2] /dev/null
	if $status != "0" {
	    $initfn()
	}
    }

    fn initsources() {
        9fs sources
    }

    fn initplumb() {
        plumber
    }

    startifnot("sources", $initsources)
    startifnot("plumb", $initplumb)
}

plan9start()
