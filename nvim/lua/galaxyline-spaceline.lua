-- https://github.com/glepnir/galaxyline.nvim/blob/main/example/spaceline.lua

local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#282c34',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#0087d7',
  red = '#ec5f67'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    -- provider = function() return '▋' end,
    provider = 'FileSize',
    highlight = {colors.blue,colors.bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {n = '  NORMAL ',i = '  INSERT ',c= '  COMMAND ',V= '  VISUAL ', [''] = '  VISUAL '}
      return alias[vim.fn.mode()]
    end,
    separator = '',
    separator_highlight = {colors.yellow,function()
      if not buffer_not_empty() then
        return colors.purple
      end
      return colors.darkblue
    end},
    highlight = {colors.darkblue,colors.yellow,'bold'},
  },
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.darkblue},
  },
}
gls.left[4] = {
  FileName = {
    -- provider = {'FileName','FileFormat'},
    provider = {'FileName'},
    condition = buffer_not_empty,
    separator = '',
    separator_highlight = {colors.purple,colors.darkblue},
    highlight = {colors.magenta,colors.darkblue}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = buffer_not_empty,
    highlight = {colors.orange,colors.purple},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_not_empty,
    highlight = {colors.grey,colors.purple},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green,colors.purple},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange,colors.purple},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.purple},
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.purple,colors.purple}
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[12] = {
  Space = {
    provider = function () return ' ' end
  }
}
gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
    separator = '',
    separator_highlight = {colors.green,colors.bg},
  }
}
gls.left[14] = {
  BuffersCount = {
    provider = function()
      local buffers = {}
      for _,val in ipairs(vim.fn.range(1,vim.fn.bufnr('$'))) do
        if vim.fn.bufexists(val) == 1 and vim.fn.buflisted(val) == 1 then
          table.insert(buffers,val)
        end
      end
      return " " .. #buffers .. " "
    end,
     separator = '',
    separator_highlight = {colors.green,colors.bg},
    highlight = {colors.darkblue,colors.green}
  }
}

gls.right[1] = {
  FileType = {
    provider = 'FileTypeName',
    highlight = {colors.darkblue, colors.red, 'bold'},
    separator = '',
    separator_highlight = {colors.red,colors.bg},
  }
}
gls.right[2]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = '',
    separator_highlight = {colors.red,colors.purple},
    highlight = {colors.grey,colors.purple},
  }
}
gls.right[3] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.purple},
    highlight = {colors.grey,colors.purple},
  },
}
gls.right[4] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = {colors.darkblue,colors.purple},
    highlight = {colors.grey,colors.darkblue},
  }
}
gls.right[5] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.yellow,colors.purple},
  }
}


gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}

