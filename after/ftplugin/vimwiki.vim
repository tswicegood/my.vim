" pull in my settings for marking things as complete
inoremap <silent> <buffer> <C-D-CR> <ESC>:call Vimwiki_toggle_task_status()<CR>i
noremap <silent> <buffer> <C-D-CR> :call Vimwiki_toggle_task_status()<CR>

