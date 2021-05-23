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

```zsh
autoload -Uz vcs_info

-U  Mark as autoloading, lazy loaded function
-z  use zsh shell rather than ksh

functions
```

### Plugin Manager

- [x] zplug
