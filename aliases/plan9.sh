import io


fn plan9start() {
    fn startifnot(name, initfn) {
    	io_println("checking if service[%s] is running", $name)
		var _, status <= 9p ls $name >[2] /dev/null
		if $status != "0" {
			io_println("service[%s] is not running, starting it", $name)
	    	$initfn()
	    	io_println("service[%s] started", $name)
	    	return
		}
		io_println("service[%s] already running", $name)
    }

    fn initsources() {
        var _, status <= 9fs sources
        print("sources init status[%s]\n", $status)
    }

    fn initplumb() {
        var out, status <= plumber
        io_println("plumber init status[%s] out: %s", $status, $out)
    }

    # startifnot("sources", $initsources)
    startifnot("plumb", $initplumb)
}

fn ac() {
	plan9start()
	acme -a -f "/mnt/font/Go Mono/13a/font"
}

bindfn ac ac
