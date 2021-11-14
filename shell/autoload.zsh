#!/bin/zsh

# AUTHOR      : avimehenwal
# DATE        : 14-Nov-2021
# PURPOSE     : Autoloading ZSH Functions
# FILENAME    : autoload.zsh
#
# Place to declare autoloading lazy-loaded zsh functions
#
#   -U -> zcompile builtin command the flag -U must be provided when the .zwc file is created,
#   -z -> Please do not expand the aliases (if one already exists with the name)

# ZSH Bulit-In Calender Function System https://zsh.sourceforge.io/Doc/Release/Calendar-Function-System.html#Calendar-Function-System
autoload -Uz calendar
autoload -Uz calendar_add
autoload -Uz calendar_edit
autoload -Uz calendar_lockfiles
autoload -Uz calendar_parse
autoload -Uz calendar_read
autoload -Uz calendar_scandate
autoload -Uz calendar_show
autoload -Uz calendar_showdate
autoload -Uz calendar_sort

# Custom
autoload -Uz avi

# END
