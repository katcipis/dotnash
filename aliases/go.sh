fn gitlab_neoway_path() {
        return format("%s/src/gitlab.neoway.com.br", $GOPATH)
}

fn github_path() {
        return format( "%s/src/github.com", $GOPATH)
}

fn changedir(dir) {
        var _, status <= ls $dir >[2] /dev/null
        if $status == "0" {
                cd $dir
                refreshPrompt()
        }
        return $status
}

fn findproject(possibilities) {
        for possibility in $possibilities {
                status <= changedir($possibility)
                if $status == "0" {
                        return "0"
                }
        }

        return "1"
}

fn goproject(root, project) {
        var groups <= ls $root
        groups <= split($groups, "\n")

        var paths = ()

        for group in $groups {
            var path <= format("%s/%s/%s", $root, $group, $project)
            paths <= append($paths, $path)
        }

        status <= findproject($paths)
        if $status != "0" {
            print("unable to find project[%s]\n", $project)
        }
}

fn golab(project) {
        var gitlabroot <= gitlab_neoway_path()
        goproject($gitlabroot, $project)
}

fn gohub(project...) {
        var githubroot <= github_path()
        if len($project) == "0" {
                changedir($githubroot)
                return
        }
        goproject($githubroot, $project)
}

bindfn golab golab
bindfn gohub gohub
