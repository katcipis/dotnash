# cd alias add the branch name to prompt
# PROMPT is a special variable used by nash command line to
# setup your prompt.
PROMPTSYM = "λ> "
DEFPROMPT = $NASH_RED+$PROMPTSYM+$NASH_RESET
setenv PROMPT = $DEFPROMPT

fn getDir() {
        currentdir <= pwd
        dirname <= basename $currentdir | tr -d "\n"
        return $dirname
}

fn nash_repl_after(arg1, arg2) {
        refreshPrompt()
}

fn refreshPrompt() {
        dirname <= getDir()
        PROMPT = "(" + $dirname + ")" + $DEFPROMPT
        -git rev-parse > [2=]
        if $status == "0" {
                branch <= git rev-parse --abbrev-ref HEAD | xargs echo -n
                PROMPT = "(" + $dirname + "(git "+$NASH_GREEN+$branch+$NASH_RESET+"))"+$DEFPROMPT
        }
        setenv PROMPT
}

# cd overrides built-in cd
# Add the current branch before prompt (if current directory is a git repo)
fn cd(path) {
        path <= echo -n $path | sed "s#^~#"+$HOME+"#g" | tr -d "\n"
        chdir($path)
}

bindfn cd cd