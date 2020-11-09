fn call(remote_addr) {
    gst-launch-1.0 -v "pulsesrc ! alawenc ! rtppcmapay ! udpsink host=10.0.0.1 port=5001 async=false udpsrc port=5001 caps=application/x-rtp,media=audio,payload=8,clock-rate=8000,encoding-name=PCMA ! rtppcmadepay ! pulsesink"
}

bindfn call call
