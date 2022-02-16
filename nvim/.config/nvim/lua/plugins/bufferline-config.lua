require('bufferline').setup({
    options = {
        offsets = {
            {
                filetype = 'nerdtree', -- Get this with :echo &filetype
                text = 'NERDTree',
                highlight = 'Directory',
                text_align = 'left'
            }
        }
    }
})
