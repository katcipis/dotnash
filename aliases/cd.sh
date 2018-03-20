# cd alias add the branch name to prompt
# PROMPT is a special variable used by nash command line to
# setup your prompt.

var PROMPTSYM = "λ> "
var NASH_RED = "\033[31m"
var NASH_GREEN = "\033[32m"
var NASH_RESET = "\033[0m"
var DEFPROMPT = $NASH_RED+$PROMPTSYM+$NASH_RESET
setenv PROMPT = $DEFPROMPT

fn getDir() {
        var currentdir <= pwd
        var dirname <= basename $currentdir | tr -d "\n"
        return $dirname
}

fn nash_repl_after(arg1, arg2) {
        refreshPrompt()
}

fn refreshPrompt() {
        var dirname <= getDir()
        var PROMPT = "(" + $dirname + ")" + $DEFPROMPT
        var _, status <= -git rev-parse > [2=]
        if $status == "0" {
                var branch <= git rev-parse --abbrev-ref HEAD | xargs echo -n
                PROMPT = "(" + $dirname + "(git "+$NASH_GREEN+$branch+$NASH_RESET+"))"+$DEFPROMPT
        }
        setenv PROMPT
}

fn cd(path) {
        var path <= echo -n $path | sed "s#^~#"+$HOME+"#g" | tr -d "\n"
        chdir($path)
}

bindfn cd cd
