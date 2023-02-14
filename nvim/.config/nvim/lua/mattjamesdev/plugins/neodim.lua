return {
  'zbirenbaum/neodim', -- Dim text for unused variables, functions, etc.
  event = { 'LspAttach' },
  opts = {
    alpha = 0.75,
    blend_color = "#000000",
    hide = {
      virtual_text = false,
      signs = false,
      underline = true,
    }
  }
}
