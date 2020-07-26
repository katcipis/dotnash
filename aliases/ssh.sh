fn sshtunnel(
    localport,
    remotehost,
    remoteport,
    bastionhost,
    user,
    keyfile
) {
    var portforward <= format("%s:%s:%s", $localport, $remotehost, $remoteport)
    var authinfo <= format("%s@%s", $user, $bastionhost)
    ssh -v -nNTL $portforward $authinfo -i $keyfile
}

fn nwytunnel(
    localport,
    remotehost,
    remoteport,
    bastionhost
) {
    var user = "tiago.katcipis"
    var keyfile <= format("%s/.ssh/platform-bastion-katcipis", $HOME)
    sshtunnel($localport, $remotehost, $remoteport, $bastionhost, $user, $keyfile)
}

bindfn sshtunnel sshtunnel
bindfn nwytunnel nwytunnel
