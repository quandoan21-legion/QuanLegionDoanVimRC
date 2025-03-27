local dap = require 'dap'

dap.adapters.python = {
  type = 'executable',
  command = '/Users/quandoan/Desktop/odoo13dev/myenv/bin/activate',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = '🪲 Launch Odoo',
    program = '/Users/quandoan/Desktop/odoo13dev/odoo-bin',
    pythonPath = '/Users/quandoan/Desktop/odoo13dev/myenv/bin/activate', -- use your correct path
    args = {
      '-c',
      'debian/odoo.conf',
      '-d',
      'odoo13',
      '--limit-memory-hard',
      '0',
    },
    console = 'integratedTerminal', -- or 'externalTerminal'
  },
}
