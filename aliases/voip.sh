fn call(host) {
    var host <= format("host=%s", $host)

    gst-launch-1.0 -v pulsesrc ! alawenc ! rtppcmapay ! rtpjitterbuffer ! udpsink $host "port=5001" "async=false" udpsrc "port=5001" "caps=application/x-rtp,media=audio,payload=8,clock-rate=8000,encoding-name=PCMA" ! rtpjitterbuffer ! rtppcmadepay ! pulsesink
}

bindfn call call
