
" tabspaces.vim

" Determines whether the buffer that was just entered (or loaded) is
" primarily tabbed or spaced, and sets (no)et appropriately.
" 
" Author: Paul King (@nrocy)
" Version: 1.0
" Email: cronald@gmail.com

function! TabSpacesDetect()
	let num_lines_tabbed = 0
	let num_lines_spaced = 0

	let lines = getline(0, line("$"))
	for line in lines
		if match(line, '\v^\t+') > -1 
			let num_lines_tabbed = num_lines_tabbed + 1
		elseif match(line, '\v^ +') > -1
			let num_lines_spaced = num_lines_spaced + 1
		endif
	endfor

	if num_lines_tabbed > num_lines_spaced
		set noet
	else
		if num_lines_tabbed != num_lines_spaced
			set et
		endif
	endif
endfunction

au BufEnter * :call TabSpacesDetect()

