#  vim / neoVim config

* How to use config from `/dotfile` folder?
* Neovim is heavier than vim

```bash
apt show  vim neovim | grep -i size
```

## Alacritty

* rust bases
* [What is terminfo?](https://man7.org/linux/man-pages/man5/terminfo.5.html)


### vimfm

* Killer feature - undo and redo
* control spilits using CTRL+w s|v
* Save bookmarks with comma `'u`
* Browser preview `w` then `Shift+Tab`

#### vifm | Ranger

* [ ] Image previews
* [ ] Icons

## Q&A

Execute an external command?
:   `:! command`

Execute external command and replace the output of current buffer?
:       `:%! commadn`

Get the output of Ex-mode command in current buffer?
:       kbd:[Shift + Q] to enter Ex mode with multiple commands
        ```
        :redir >> fileName
        :set rtp?
        :redir END
        :visual
        ```

How to reaload the file?
:       `:edit` or `set autoread`

How to configure neovim?
:   `~/.config/nvim/init.vim`

How to configure status line as per your needs?
:   Has its own statusline `:help status-line`