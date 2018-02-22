fn archupdate() {
        sudo pacman -Sy archlinux-keyring
        sudo pacman -Syyu
}

fn aur(packagename) {
	wd <= pwd
	tmp <= mktemp -d
	cd $tmp
	giturl <= format("https://aur.archlinux.org/%s.git", $packagename)
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

fn udplisten(port) {
    nc -v -l -u -p $port
}

fn netsniff(host, port) {
    filter = "host " + $host + " and port " + $port
    sudo tcpdump -A -s 0 $filter
}

fn netstart() {
        sudo systemctl start dhcpcd@enp1s0
}

fn play(filepath) {
        location <= format("location=%s", $filepath)
        gst-launch-1.0 filesrc $location ! decodebin ! pulsesink
}

fn playdir(dir) {
	filesraw <= ls $dir
	files <= split($filesraw, "\n")
	for f in $files {
		file <= format("%s/%s", $dir, $f)
		echo
		echo "playing: " + $file
		sleep 2
		play($file)
		echo "done"
	}
}

bindfn archupdate archupdate
bindfn genpassword genpassword
bindfn netstart netstart
bindfn udplisten udplisten
bindfn netsniff netsniff
bindfn io io
bindfn play play
bindfn playdir playdir
bindfn aur aur
