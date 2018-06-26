
fn ac() {
	setenv PATH = $ACMETOOLS + ":" + $PATH
	acme -c 3 -a -f "/mnt/font/Go Mono/13a/font" -W 2550x1070
}

bindfn ac ac
