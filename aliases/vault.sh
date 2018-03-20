fn vault(credname) {
        var credentialsdir <= format("%s/credentials", $HOME)
        var ciphered <= format("%s/%s.sh.gpg", $credentialsdir, $credname)
        var credential = "/tmp/credential.sh"

        rm -f $credential

        var stty_orig <= stty -g
        stty -echo
        print("Enter password: ")
        var password <= head -n1 /dev/stdin
        stty $stty_orig

        echo $password | gpg -q --passphrase-fd 0 --batch --output $credential -d $ciphered
        import /tmp/credential
        rm -f $credential
}

bindfn vault vault
