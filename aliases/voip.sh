fn call(remote_addr) {
    var pipeline <= format("pulsesrc ! alawenc ! rtppcmapay ! udpsink host=%s port=5001 async=false udpsrc port=5001 caps=application/x-rtp,media=audio,payload=8,clock-rate=8000,encoding-name=PCMA ! rtppcmadepay ! pulsesink", $remote_addr)
    print($pipeline + "\n")
    gst-launch-1.0 -v $pipeline
}

bindfn call call
