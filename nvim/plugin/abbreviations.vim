"        _       _           _ 
"   __ _| | ___ | |__   __ _| |
"  / _` | |/ _ \| '_ \ / _` | |
" | (_| | | (_) | |_) | (_| | |
"  \__, |_|\___/|_.__/ \__,_|_|
"  |___/                       
"   __ _| |__ | |__  _ __ _____   _(_) __ _| |_(_) ___  _ __  ___ 
"  / _` | '_ \| '_ \| '__/ _ \ \ / / |/ _` | __| |/ _ \| '_ \/ __|
" | (_| | |_) | |_) | | |  __/\ V /| | (_| | |_| | (_) | | | \__ \
"  \__,_|_.__/|_.__/|_|  \___| \_/ |_|\__,_|\__|_|\___/|_| |_|___/
"                                                                 
" Abbreviations are used in Insert mode, Replace mode and Command-line mode.
" inoreabbrev - Insert-mode abbr only and do not remap
" 
" -----------------------------------------
" inoreabbrev -- ---
inoreabbrev avi Avi Mehenwal
" inoreabbrev email avi.mehenwal@gmai.com
inoreabbrev bang #!/usr/bin/env python
inoreabbrev shebang #!/usr/bin/env bash
inoreabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehe nderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?


" Command Mode Abbreviations
" -----------------------------------------
" command mode :x does the same thing and is shorter
cnoreabbrev hc helpclose
" <F1> with autocommand group vertical_help produces the same result
cnoreabbrev help vertical help
" delete buffer after quick config update
cnoreabbrev ww write\|bdelete

" Emoji shortcuts
" https://www.emojicopy.com/
" -----------------------------------------
inoreabbrev :check: ✅
inoreabbrev :warning: ⚠
inoreabbrev :bulb: 💡
inoreabbrev :pushpin: 📌
inoreabbrev :bomb: 💣
inoreabbrev :pill: 💊
inoreabbrev :construction: 🚧
inoreabbrev :pencil: 📝
inoreabbrev :point_right: 👉
inoreabbrev :book: 📖
inoreabbrev :link: 🔗
inoreabbrev :wrench: 🔧
inoreabbrev :info: 🛈
inoreabbrev :telephone: 📞
inoreabbrev :email: 📧
inoreabbrev :computer: 💻
inoreabbrev :+1: 👍
inoreabbrev :-1: 👎
inoreabbrev :v: ✌️
inoreabbrev :): 😎
inoreabbrev :hi: 🙋

" Markdown abbrevitions
" better use inoremap as they do not leave a
" trailing space after abbr is expanded
" https://stackoverflow.com/questions/11858927/preventing-trailing-whitespace-when-using-vim-abbreviations
" -------------------------------------------------- 
" inoremap ` ``<left>
inoremap ** ****<left><left>
inoremap < <><left>
inoremap [ []<left>
inoremap ( ()<left>
