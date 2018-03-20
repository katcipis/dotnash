#!/usr/bin/env nash

import "aliases/cd"
import "aliases/go"
import "aliases/git"
import "aliases/vpn"
import "aliases/vault"
import "aliases/ssh"
import "aliases/vi"
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

# only to apply current PROMPT using new cd alias
# refreshPrompt()
