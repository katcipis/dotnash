
fn globerize(args...) {
    globerizedargs = ()
    for arg in $args {
        expandedargs, err <= glob($arg)
        if $err == "" {
            for expandedarg in $expandedargs {
                globerizedargs <= append($globerizedargs, $expandedarg)
            }
        } else {
            globerizedargs <= append($globerizedargs, $arg)
        }
    }

    return $globerizedargs
}
