fn gcheck(args...) {

	fn removeorigin(b) {
		var parsed <= split($b, "/")
		return $parsed[1]
	}

        if len($args) == "0" {
                var branch <= git branch -r | sed "s/^[* \\t]*//g" | fzf --header "Select the branch: " | xargs echo -n
                branch <= removeorigin($branch)
                git checkout $branch
		refreshPrompt()
                return
        }

	var branch = $args[0]
	branchs <= git branch | sed "s/^[* \\t]*//g"

	for b in $branchs {
		if $b == $branch {
			git checkout $branch

			# break isn't implemented yet
			return $branch
		}
	}

	git checkout -b $branch
	refreshPrompt()
}

fn gclean() {
        git remote prune origin
}

bindfn gcheck gcheck
bindfn gclean gclean
