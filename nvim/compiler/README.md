# Compiler Options

Writing a compiler plugin allows you to supplement the `:make` command
to run any tool you want, and parse the output into the `quickfix` window.

+-----------------+     +--------------+
| compiler plugin | --> | error format |
+-----------------+     +--------------+
  |
  |
  v
+-----------------+
|     makeprg     |
+-----------------+

* How to name compiler plugins?
* How to load them for specific files?
  * `:compiler shellcheck`
* set local or global `!` compiler options 

## Plugins

[Syntastic](https://github.com/vim-syntastic/syntastic)
