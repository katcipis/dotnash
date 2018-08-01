fn ac() {
	var cfgfmt = "%s\n/mnt/font/Go Mono/13a/font\n/lib/font/bit/lucm/unicode.9.font\n  0.0000000  12.6760563  42.2253521  72.0281690\nw Newcol Kill Putall Dump Exit \nc          0 New Cut Paste Snarf Sort Zerox Delcol \nc          1 New Cut Paste Snarf Sort Zerox Delcol \nc          2 New Cut Paste Snarf Sort Zerox Delcol \nc          3 New Cut Paste Snarf Sort Zerox Delcol \nf          0           1           0           0   2.0019066 \n          1          55          56           1           0 %s/ Del Snarf Get | Look"

	var wd <= pwd
	var cfg <= format($cfgfmt, $wd, $wd)
	var cfgfile <= format("%s/%s", $HOME, "acme")

	echo $cfg > $cfgfile

	setenv PATH = $ACMETOOLS+":"+$PATH

	# acme -c 4 -a -f "/mnt/font/Go Mono/13a/font" -W 3550x1070
	acme -l $cfgfile -W "3550x1070"
}

bindfn ac ac
