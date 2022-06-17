"   __        _ _ _   _           
"  / _|_   _ (_|_) |_(_)_   _____ 
" | |_| | | || | | __| \ \ / / _ \
" |  _| |_| || | | |_| |\ V /  __/
" |_|  \__,_|/ |_|\__|_| \_/ \___|
"          |__/                   
"
" Toggle git status information in vertical split <F6>

augroup vertical_git_status
  autocmd! * <buffer>
  autocmd BufWinEnter <buffer> wincmd H | vertical resize 60
augroup END
