#!/usr/bin/env nash

import "aliases/cd"
import "aliases/git"
import "aliases/vault"
import "aliases/vi"
import "aliases/acme"
import "aliases/voip"
import "aliases/essentials"

import "nashcomplete/all"

# Setup environment variables
setenv NASHPATH = $HOME+"/nash"
setenv NASHROOT = $HOME+"/nashroot"
setenv PLAN9 = "/usr/local/plan9"
setenv ACMETOOLS = $PLAN9+"/acme/edit"
setenv PATH <= format("%s:%s/bin", $PATH, $PLAN9)
setenv SHELL = "/usr/bin/nash"
setenv BROWSER = "google-chrome-stable"

refreshPrompt()
