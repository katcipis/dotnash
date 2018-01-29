fn vpn() {
	vpncfg <= format("%s/.vpn/client.cfg", $HOME)

	# TODO: get password
	twofactor <= 2fa client

	sudo openvpn --config $vpncfg
}

bindfn vpn vpn
