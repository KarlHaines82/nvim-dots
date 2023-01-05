if vim.g.neovide == true then
  vim.g.neovide_scale_factor = 0.8
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_cursor_vfx_mode = 'railgun'
  vim.g.neovide_cursor_vfx_particle_density = 15.0
  vim.g.neovide_cursor_vfx_particle_speed = 13.0
  vim.g.neovide_cursor_vfx_particle_phase = 2.5
else
  vim.cmd[[set background=]]
end
