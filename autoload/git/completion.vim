"=============================================================================
" FILE: completion.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu@gmail.com>(Modified)
" Last Modified: 17 Mar 2010
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
"=============================================================================

function! git#completion#do_completion(args)"{{{
  return (len(a:args) <= 2)? 
        \git#completion#git(a:args) : 
        \call('git#completion#' . substitute(a:args[1], '-', '_', 'g'), [a:args])
endfunction"}}}

" List all git commands.
function! git#completion#git(args)"{{{
  return ['add', 'bisect', 'branch', 'checkout', 'clone', 'commit', 'diff', 'fetch',
        \'grep', 'init', 'log', 'merge', 'mv', 'pull', 'push', 'rebase', 'reset', 'rm', 
        \'show', 'status', 'tag']
endfunction"}}}

function! git#completion#add(args)"{{{
  return ["-u", "-p", "-A"] + s:get_files()
endfunction"}}}
function! git#completion#blame(args)"{{{
  return []
endfunction"}}}
function! git#completion#branch(args)"{{{
  return ['-r']
endfunction"}}}
function! git#completion#checkout(args)"{{{
  return []
endfunction"}}}
function! git#completion#clone(args)"{{{
  return []
endfunction"}}}
function! git#completion#config(args)"{{{
  return ['--config']
endfunction"}}}
function! git#completion#commit(args)"{{{
  return ['-m', 'a', '-v', '--amend']
endfunction"}}}
function! git#completion#describe(args)"{{{
  return ['--contains']
endfunction"}}}
function! git#completion#diff(args)"{{{
  return ['--cached']
endfunction"}}}
function! git#completion#init(args)"{{{
  return ['--bare', '--shared']
endfunction"}}}
function! git#completion#log(args)"{{{
  return ['-p', '--pretty=short', '--grep=', '--left-right']
endfunction"}}}
function! git#completion#merge(args)"{{{
  return []
endfunction"}}}
function! git#completion#push(args)"{{{
  return []
endfunction"}}}
function! git#completion#pull(args)"{{{
  return []
endfunction"}}}
function! git#completion#reset(args)"{{{
  return ['--hard']
endfunction"}}}
function! git#completion#rebase(args)"{{{
  return ['-i', '--continue']
endfunction"}}}
function! git#completion#revert(args)"{{{
  return []
endfunction"}}}
function! git#completion#rev_parse(args)"{{{
  return []
endfunction"}}}
function! git#completion#show(args)"{{{
  return []
endfunction"}}}
function! git#completion#status(args)"{{{
  return []
endfunction"}}}
function! git#completion#stash(args)"{{{
  return ['pop']
endfunction"}}}
function! git#completion#tag(args)"{{{
  return ['-a', '-l', '-n', '-d']
endfunction"}}}
function! git#completion#var(args)"{{{
  return []
endfunction"}}}

function! s:get_files()
  return split(glob('*'), '\n')
endfunction

