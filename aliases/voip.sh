fn call(host) {
    var host <= format("host=%s", $host)

    gst-launch-1.0 -v pulsesrc ! alawenc ! rtppcmapay ! rtpjitterbuffer ! udpsink $host "port=5001" "async=false" udpsrc "port=5001" "caps=application/x-rtp,media=audio,payload=8,clock-rate=8000,encoding-name=PCMA" ! rtpjitterbuffer ! rtppcmadepay ! pulsesink
}

fn callburguesa(host) {
    var host <= format("host=%s", $host)

    gst-launch-1.0 -v pulsesrc ! opusenc ! rtpopuspay ! rtpjitterbuffer ! udpsink $host "port=5002" "async=false" udpsrc "port=5002" "caps=application/x-rtp,media=audio,payload=96,clock-rate=48000,encoding-name=OPUS" ! rtpjitterbuffer ! rtpopusdepay ! opusparse ! opusdec ! pulsesink
}

bindfn call call
bindfn callburguesa callburguesa
