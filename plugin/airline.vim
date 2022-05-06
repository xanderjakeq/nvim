"https://www.youtube.com/watch?v=uD0uot7RPGk
"https://github.com/wincent/wincent/blob/b6d190755b52091a7d1505c5ff3346688880ca73/roles/dotfiles/files/.vim/autoload/wincent/tabline.vim
function TabLine()
    let l:line=''
    let l:current=tabpagenr()
    for l:i in range(1, tabpagenr('$'))
        if l:i == l:current
            let l:line.='%#TabLineSel#'
        else
            let l:line.='%#TabLine#'
        end
        let l:line.='%' . i . 'T' " Starts mouse click target region.
        let l:line.=' %{TablineLabel(' . i . ')} '
    endfor
    let l:line.='%#TabLineFill#'
    let l:line.='%T' " Ends mouse click target region(s).
    return l:line
endfunction

function TablineLabel(n)
    let l:buflist=tabpagebuflist(a:n)
    let l:winnr=tabpagewinnr(a:n)
    return pathshorten(fnamemodify(bufname(buflist[winnr - 1]), ':~:.'))
endfunction

if has('windows')
    set tabline=%!TabLine()
endif


"syntastic stuff

let g:airline#extensions#tabline#enabled = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



