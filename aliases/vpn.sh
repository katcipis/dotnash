fn vpn() {
	vpncfg <= format("%s/.vpn/client.cfg", $HOME)
	echo $VPN
	twofactor <= 2fa client
	echo $twofactor
	sudo openvpn --config $vpncfg
}

bindfn vpn vpn
