
fn globerize(args...) {
    globerizedargs = ()
    for arg in $args {
        expandedargs, err <= glob($arg)
        globerizedargs <= _append_glob_res($globerizedargs, $arg, $expandedargs, $err)
    }
    return $globerizedargs
}

fn _append_glob_res(args, arg, expandedargs, err) {
        if $err != "" {
            args <= append($args, $arg)
            return $args
        }

        if len($expandedargs) == "0" {
            args <= append($args, $arg)
            return $args
        }

        for expandedarg in $expandedargs {
            args <= append($args, $expandedarg)
        }

        return $args
}
