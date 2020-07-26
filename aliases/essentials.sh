import io

fn archupdate() {
        sudo pacman -Sy archlinux-keyring
        sudo pacman -Syyu
}

fn aur(packagename) {
	var wd <= pwd
	var tmp <= mktemp -d
	cd $tmp
	var giturl <= format("https://aur.archlinux.org/%s.git", $packagename)
	git clone $giturl
	cd $packagename
	makepkg -sri
	cd $wd
	rm -rf $tmp
}

fn genpassword() {
        openssl rand -base64 32
}

fn io() {
        iostat -xmdz 1
}

fn netstart() {
        sudo systemctl start dhcpcd@enp1s0
}

fn play(filepath) {
        var location <= format("location=%s", $filepath)
        gst-launch-1.0 filesrc $location ! decodebin ! pulsesink
}

fn playdir(dir) {
	var filesraw <= ls $dir
	var files <= split($filesraw, "\n")
	for f in $files {
		var file <= format("%s/%s", $dir, $f)
		echo
		echo "playing: " + $file
		sleep 2
		play($file)
		echo "done"
	}
}

fn sub() {
	subliminal download --language eng .
	
	echo "removing .eng from subtitles filenames to match videos"
	var files <= ls | grep "en.srt"
	files <= split($files, "\n")
	
	for f in $files {
		var newfilename <= echo $f | sed "s/.en//g"
		var out, status <= ls $newfilename >[2] /dev/null
		
		if $status != "0" {
			io_println("moving [%s] to [%s]", $f, $newfilename)
			mv $f $newfilename
		} else {
			io_println("ignoring file[%s] that already exists", $newfilename)
		}
		
	}
}

fn history() {
	cat $NASHPATH + "/history"
}

bindfn history history
bindfn archupdate archupdate
bindfn genpassword genpassword
bindfn netstart netstart
bindfn io io
bindfn play play
bindfn playdir playdir
bindfn aur aur
bindfn sub sub
