return {
  vim.filetype.add {
    extension = {
      yml = 'yaml.ansible',
    },
  },

  vim.filetype.add {
    extension = {
      jinja = 'jinja',
      jinja2 = 'jinja',
      j2 = 'jinja',
    },
  },
}
