local str
if vim.g.neovide == true then
	vim.cmd([[set gfn=CaskaydiaCove\ Nerd\ Font:h12]])
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_floating_blur = true
	vim.g.neovide_floating_blur_amount_x = 7.0
	vim.g.neovide_floating_blur_amount_y = 7.0
	vim.g.neovide_transparency = 0.95
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_cursor_vfx_particle_density = 21.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 2.0
	vim.api.nvim_exec(
		[[  
  function! ChangeScaleFactor(delta)
      let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
  endfunction
  nnoremap <expr><C-=> ChangeScaleFactor(1.1)
  nnoremap <expr><C--> ChangeScaleFactor(1/1.10)
  ]],
		str
	)
end
