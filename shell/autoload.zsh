#!/bin/zsh

# AUTHOR      : avimehenwal
# DATE        : 14-Nov-2021
# PURPOSE     : Autoloading ZSH Functions
# FILENAME    : autoload.zsh
#
# Place to declare autoloading lazy-loaded zsh functions

# ZSH Bulit-In Calender Function System https://zsh.sourceforge.io/Doc/Release/Calendar-Function-System.html#Calendar-Function-System
autoload -U calendar
autoload -U calendar_add
autoload -U calendar_edit
autoload -U calendar_lockfiles
autoload -U calendar_parse
autoload -U calendar_read
autoload -U calendar_scandate
autoload -U calendar_show
autoload -U calendar_showdate
autoload -U calendar_sort

# Custom

echo "AUTOLOADING FUnctions File processed"
# END
