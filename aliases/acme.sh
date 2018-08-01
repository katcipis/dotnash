
fn ac() {
	var cfgfmt = "%s
/mnt/font/Go Mono/13a/font
/lib/font/bit/lucm/unicode.9.font
  0.0000000  12.1690141  39.9436620  72.1126761
w Newcol Kill Putall Dump Exit 
c          0 New Cut Paste Snarf Sort Zerox Delcol putf
c          1 New Cut Paste Snarf Sort Zerox Delcol putf
c          2 New Cut Paste Snarf Sort Zerox Delcol putf
c          3 New Cut Paste Snarf Sort Zerox Delcol putf
f          0           1           0           0   1.9980971 
          1          48          42           1           0 %s Del Snarf Get | Look putf"
          
    var wd <= pwd
    var cfg <= format($cfgfmt, $wd, $wd)
    var cfgfile <= format("%s/%s", $HOME, "acme")
    
    echo $cfg > $cfgfile

	setenv PATH = $ACMETOOLS + ":" + $PATH
	# acme -c 4 -a -f "/mnt/font/Go Mono/13a/font" -W 3550x1070
	acme -l $cfgfile -W "3550x1070"
}

bindfn ac ac
