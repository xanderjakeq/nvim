let g:goyo_width = 81
let g:limelight_default_coefficient = 0.7

nnoremap <leader>gy :Goyo<CR>
nnoremap <leader>ll :Limelight!!<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
