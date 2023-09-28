
vim.g.neoterm_size = tostring(0.3 * vim.o.columns)
vim.g.neoterm_default_mod = 'botright vertical'
fun! Scratch(cmd)
	new
	setlocal nobuflisted buftype=nofile bufhidden=delete

	let output = call systemlist(a:cmd)
	call append(0, l:output)
endfun
