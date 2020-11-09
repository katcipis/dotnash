fn call(host) {
    var host <= format("host=%s", $host)

    gst-launch-1.0 -v pulsesrc ! opusenc ! rtpopuspay ! rtpjitterbuffer ! udpsink $host "port=5002" "async=false" udpsrc "port=5002" "caps=application/x-rtp,media=audio,payload=96,clock-rate=48000,encoding-name=OPUS" ! rtpjitterbuffer ! rtpopusdepay ! opusparse ! opusdec ! pulsesink
}

fn sendmusic(host, file) {
    var location <= format("location=%s", $file)
    var host <= format("host=%s", $host)

    gst-launch-1.0 -v filesrc $location "do-timestamp=true" ! decodebin ! audioconvert ! audioresample ! opusenc ! rtpopuspay ! rtpjitterbuffer ! udpsink $host "port=5002" "sync=true"
}

bindfn call call
bindfn sendmusic sendmusic
