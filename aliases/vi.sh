import globerize

fn vi(args...) {
    var expandedargs <= globerize($args...)
    nvim $expandedargs
}

# bindfn not working with vargs yet
bindfn vi vi
