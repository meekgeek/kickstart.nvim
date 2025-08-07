-- Helper function to merge highlight settings without overwriting existing styles
local function merge_hl(group, settings)
  -- Safely get the current highlight definition
  local ok, current_hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
  if not ok then
    current_hl = {} -- Default to an empty table if the group doesn't exist
  end

  -- Merge the new settings, overwriting any conflicts
  local new_hl = vim.tbl_extend('force', current_hl, settings)

  -- Apply the merged highlight
  vim.api.nvim_set_hl(0, group, new_hl)
end

-- Apply italic style to comments, including the specific foreground color
merge_hl('Comment', { italic = true, fg = '#666666' })
merge_hl('@comment.typescript', { italic = true, fg = '#666666' })
merge_hl('@comment.documentation.typescript', { italic = true, fg = '#666666' })
merge_hl('@variable.builtin.typescript', { bold = false })
merge_hl('@type.builtin.typescript', { bold = false })
merge_hl('@lsp.type.property.typescript', { italic = false })
