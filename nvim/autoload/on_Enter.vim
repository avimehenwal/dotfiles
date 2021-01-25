" Maintain indentation, List Character onEnter
"
" https://github.com/tpope/vim-markdown/blob/master/ftplugin/markdown.vim

function! on_Enter#ListCharacter() abort
  " comments, from a vim
  setlocal autoindent
  setlocal nosmartindent
  setlocal nocindent

  " Print *,-,> for unordered list on Enter
  setlocal comments=b:-      " auto wrap
  setlocal comments+=mb:*    " also break asian chars above 255
  setlocal comments+=b:>      
  setlocal commentstring=<!--%s-->

  " setlocal formatoptions-=t  " auto-wrap text
  " setlocal formatoptions-=c  " auto-wrap comments
  " setlocal formatoptions-=w  " do not use trailing whitespace as paragraph marker
  " setlocal formatoptions-=a  " no automatic formating
  setlocal formatoptions=q     " do not allow comment formatting with "gq"
  setlocal formatoptions+=r    " print on Enter
  setlocal formatoptions+=o    " print comment leader on o or O
  setlocal formatoptions+=n    " numbered list

  " setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*[-*+]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:
  setlocal formatlistpat=^\\s*                     " Optional leading whitespace
  setlocal formatlistpat+=[                        " Start character class
  setlocal formatlistpat+=\\[({]\\?                "   Optionally match opening punctuation
  setlocal formatlistpat+=\\(                      "   Start group
  setlocal formatlistpat+=[0-9]\\+                 "     Numbers
  setlocal formatlistpat+=\\\|                     "     or
  setlocal formatlistpat+=[a-zA-Z]\\+              "     Letters
  setlocal formatlistpat+=\\)                      "   End group
  setlocal formatlistpat+=[\\]:.)}                 "   Closing punctuation
  setlocal formatlistpat+=]                        " End character class
  setlocal formatlistpat+=\\s\\+                   " One or more spaces
  setlocal formatlistpat+=\\\|                     " or
  setlocal formatlistpat+=^\\s*[-–+o*•]\\s\\+      " Bullet points
endfunction
