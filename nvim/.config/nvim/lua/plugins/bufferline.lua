require('bufferline').setup({
  options = {
    offsets = {
      {
        filetype = 'NvimTree', -- Get this with :echo &filetype
        text = 'NvimTree',
        highlight = 'Directory',
        text_align = 'left'
      }
    }
  }
})
