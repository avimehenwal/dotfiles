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

## Static Analysis

* [x] ➕quick feedback loop for developer on frequently occouring problems
* [x] ➕idiomatic approach

shell is a relatively unforgiving environment

* How to teach vim to use a external program for static analysis ❓




## Plugins

[Syntastic](https://github.com/vim-syntastic/syntastic)
