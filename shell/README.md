# Shell Program config

> Terminal Emulator is different from Shell program.

## Shell Programs I use

1. bash
2. zsh
3. fish

## ZSH

- [x] ✨ [Has autoloading features](https://stackoverflow.com/questions/30840651/what-does-autoload-do-in-zsh) `man zshbuiltins`
- [ ] In zsh, the function search path ($fpath) defines a set of directories, which contain files that can be marked to be loaded automatically when the function they contain is needed for the first time.
- What's the difference between sourcing and autolaoding custom functions in zsh? Preloading vs lazyloading
- Change `zshrc` file location using `ZDOTDIR` environment variable

```zsh
fpath=(~/.zsh/completion $fpath)

autoload -Uz vcs_info or ‘functions -u’ or ‘typeset -fu’

-U  Mark as autoloading, lazy loaded function
-z  use zsh shell rather than ksh

functions
```

#### How to write a zsh plugin

We can run any zsh code inside your plugin, that means that you can automate all sorts of stuff, or set up aliases or functions for frequently-used commands.

To make a plugin you just create a file named <plugin-name>.plugin.zsh and stick it in $ZSH/custom/<plugin-name>/, then enable it in plugins=(... <plugin-name>) in your zshrc file. The wiki explains it best.

Let me know if you have further questions.

[Some awesome plugins examples ](https://github.com/unixorn/awesome-zsh-plugins)

### Plugin Manager

- [x] zplug
- [ ] [GNU Parallel](https://www.gnu.org/software/parallel/)
- [ ] Completions
  - [x] git
  - [ ] find command
  - [ ] yarn command
  - [ ] docker

```bash
#!/usr/bin/env bash
CWD=`pwd`
TMP=${TMP:-/tmp/tmpdir}

# use trap to exit out of application cleanly
trap \
 "{ /usr/bin/rm -r "${TMP}" ; exit 255; }" \
 SIGINT SIGTERM ERR EXIT
```

- Add completions location to `fpath` like so `fpath=($HOME/.local/zsh/completions $fpath)`
- Lazy load completions `autoload -U compinit`
- initialize `compinit -i`

## Resources

- [ZSH Manual](http://zsh.sourceforge.net/Doc/Release/index.html#Top)
- [Shell Expansions 6+ types](http://zsh.sourceforge.net/Doc/Release/Expansion.html)
- [special hook functions](https://stackoverflow.com/questions/3964068/zsh-automatically-run-ls-after-every-cd)
- [What does zsh do?](https://unix.stackexchange.com/questions/214657/what-does-zstyle-do)
