Log("glsl.lua", "LOADING")
return {
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = { "*.vert", "*.frag", "*.tesc", "*.tese", "*.geom", "*.comp" },
		command = "set filetype=glsl"
	})
}
