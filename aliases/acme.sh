fn ac() {
	var cfgfmt = "%s
/mnt/font/Go Mono/13a/font
/lib/font/bit/lucm/unicode.9.font
  0.0000000  28.1126761  55.6338028  83.9436620
w Newcol Kill Putall Dump Exit 
c          0 New Cut Paste Snarf Sort Zerox Delcol 
c          1 New Cut Paste Snarf Sort Zerox Delcol 
c          2 New Cut Paste Snarf Sort Zerox Delcol 
c          3 New Cut Paste Snarf Sort Zerox Delcol 
f          3           2           0           0   2.0019066 
          2          51          56           1           0 %s/ Del Snarf Get | Look"

	var wd <= pwd
	var cfg <= format($cfgfmt, $wd, $wd)
	var cfgfile <= format("%s/%s", $HOME, "acme")

	echo $cfg > $cfgfile

	setenv PATH = $ACMETOOLS+":"+$PATH

	# acme -c 4 -a -f "/mnt/font/Go Mono/13a/font" -W 3550x1070
	acme -l $cfgfile -W "3550x1070"
}

bindfn ac ac
