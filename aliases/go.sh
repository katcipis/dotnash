fn gitlab_neoway_path() {
        return format("%s/src/gitlab.neoway.com.br", $GOPATH)
}

fn github_path() {
        return format( "%s/src/github.com", $GOPATH)
}

fn changedir(dir) {
        _, status <= ls $dir >[2] /dev/null
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
                        return
                }
        }
}

fn goproject(root, project) {
        groups <= ls $root
        groups <= split($groups, "\n")

        paths = ()

        for group in $groups {
            path <= format("%s/%s/%s", $root, $group, $project)
            paths <= append($paths, $path)
        }

        findproject($paths)
}

fn golab(project) {
        gitlabroot <= gitlab_neoway_path()
        goproject($gitlabroot, $project)
}

fn gohub(project...) {
        if len($project) == "0" {
                d <= format(
                        "%s/src/github.com",
                        $GOPATH,
                )
                changedir($d)
                return
        }

        gitlabroot <= github_path()
        goproject($gitlabroot, $project)
}

bindfn golab golab
bindfn gohub gohub
