"=============================================================================
" FILE: git.vim
" AUTHOR: motemen <motemen@gmail.com>(Original)
"         Shougo Matsushita <Shougo.Matsu@gmail.com>(Modified)
" Last Modified: 11 Jul 2010
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" Version: 1.8, for Vim 7.0
"-----------------------------------------------------------------------------
" ChangeLog: "{{{
"   1.8:
"     - Fixed mapping.
"     - Changed g:git_no_map_default into g:git_no_default_mappings.
"     - Added git#rm().
"
"   1.7:
"     - Improved fold.
"     - Improved git commit buffer.
"     - Improved system().
"
"   1.6:
"     - Improved git commit.
"     - Improved git completion.
"     - Delete buffer when git commit.
"
"   1.5:
"     - Added :GitVimDiff(Thanks harajune).
"     - Fixed completion error.
"     - Fixed git cat-file bug.
"     - Fixed commit message.
"
"   1.4:
"     - Fixed git current directory bug.
"     - Fixed GitCommit bug.
"
"   1.3:
"     - Use autoload.
"     - Refactored.
"
"   1.2:
"     - Don't delete blank line.
"
"   1.1:
"     - Merged latest version.
"     - Supported vimproc.
"     - Added g:git_use_vimproc option.
"
"   1.0:
"     - Initial version.
"     - Complete settings.
""}}}
"=============================================================================

if v:version < 700
    echoerr 'git-vim does not work this version of Vim "' . v:version . '".'
    finish
elseif exists('g:loaded_git_vim')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:git_command_edit')
  let g:git_command_edit = 'new'
endif

if !exists('g:git_bufhidden')
  let g:git_bufhidden = 'delete'
endif

if !exists('g:git_bin')
  let g:git_bin = 'git'
endif

if !exists('g:git_author_highlight')
  let g:git_author_highlight = {}
endif

if !exists('g:git_use_vimproc')
  let g:git_use_vimproc = 0
endif

if !exists('g:git_no_default_mappings') || !g:git_no_default_mappings
  nnoremap <silent><Leader>gd :<C-u>GitDiff<Enter>
  nnoremap <silent><Leader>gD :<C-u>GitDiff --cached<Enter>
  nnoremap <silent><Leader>gvd :<C-u>GitVimDiff<Enter>
  nnoremap <silent><Leader>gvD :<C-u>GitVimDiff --cached<Enter>
  nnoremap <silent><Leader>gs :<C-u>GitStatus<Enter>
  nnoremap <silent><Leader>gl :<C-u>GitLog<Enter>
  nnoremap <silent><Leader>ga :<C-u>GitAdd<Enter>
  nnoremap <silent><Leader>gA :<C-u>GitAdd <cfile><Enter>
  nnoremap <silent><Leader>gc :<C-u>GitCommit<Enter>
  nnoremap <silent><Leader>gp :<C-u>GitPullRebase<Enter>
endif


command! -nargs=1 -complete=customlist,git#list_commits   GitCheckout call git#checkout(<q-args>)
command! -nargs=* -complete=customlist,git#list_commits   GitDiff     call git#diff(<q-args>)
command! -nargs=* -complete=customlist,git#list_commits   GitVimDiff  call git#vimdiff(<q-args>)
command!          GitStatus           call git#status()
command! -nargs=? -complete=file                        GitAdd      call git#add(<q-args>)
command! -nargs=* GitLog              call git#log(<q-args>)
command! -nargs=* GitCommit           call git#commit(<q-args>)
command! -nargs=1 GitCatFile          call git#cat_file(<q-args>)
command!          GitBlame            call git#blame()
command! -nargs=+ -complete=customlist,git#list_commands  Git         call git#do_command(<q-args>)
command!          GitVimDiffMerge     call git#vimdiff_merge()
command!          GitVimDiffMergeDone call git#vimdiff_merge_done()
command! -nargs=* GitPull             call git#pull(<q-args>)
command!          GitPullRebase       call git#pull('--rebase')
command! -nargs=* GitPush             call git#push(<q-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_git_vim = 1

" vim: foldmethod=marker
