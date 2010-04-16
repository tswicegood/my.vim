" Vim syntax file
" Language:	Opensocial Gadget spec XML
" Maintainer:	Márton Salomváry <salomvary.marton@virgo.hu>
" Last Change:	2008 Nov 2

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

if !exists("main_syntax")
  let main_syntax = 'gadgetxml'
endif
  
runtime! syntax/xml.vim
unlet b:current_syntax

syn case match
syn include @html syntax/html.vim
syn region htmlContent start=/<Content type="html">\s*\n\?\s*<!\[CDATA\[/ end=/]]>\s*\n\?\s*<\/Content>/ contains=@html

if main_syntax == 'gadgetxml'
  unlet main_syntax
endif

let b:current_syntax = "gadgetxml"

