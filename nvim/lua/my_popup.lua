local M = {}

local sources = {
  lua = {
    -- keywords
    "local", "function", "end", "if", "then", "else", "elseif", "for", "while", "do",
    "return", "break", "in", "pairs()", "ipairs()", "require()", "print()",
    "table.insert()", "table.concat()", "string.format()", "vim.inspect()",

    -- vim api (most used)
    "vim.api.nvim_create_autocmd()", "vim.api.nvim_set_keymap()", "vim.keymap.set()",
    "vim.fn.expand()", "vim.fn.stdpath()", "vim.bo.filetype", "vim.opt",
    "vim.lsp.start()", "vim.lsp.completion.enable()", "vim.api.nvim_buf_get_lines()",
    "vim.api.nvim_get_current_line()", "vim.tbl_contains()",

    -- common patterns
    "M.", "function M.setup()", "local M = {}", "return M",
    "if vim.fn.pumvisible() == 1 then", "vim.fn.complete()",

    -- after you type vim.
    "api", "fn", "keymap", "lsp", "opt", "bo", "g", "cmd", "loop", "inspect",
    -- after you type table.
    "insert", "remove", "concat", "sort", "contains",
    -- after you type string.
    "format", "match", "gmatch", "sub", "gsub", "find", "upper", "lower",
    -- after you type math.
    "floor", "ceil", "random", "max", "min",
  }
}

-- add buffer words
local function buffer_words()
  local seen, words = {}, {}
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    for w in line:gmatch("[%w_%.%:]+") do
      if #w > 3 and not seen[w] then
        seen[w] = true
        table.insert(words, w)
      end
    end
  end
  return words
end

function M.complete()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local before_cursor = line:sub(1, col)

  -- get prefix, handles vim.api and table.insert
  local prefix = before_cursor:match("[%w_%.%:\"'_%(%)]*$") or ""
  local last_word = prefix:match("[%w_]+$") or prefix

  -- decide what to show based on dot
  local items = {}

  if before_cursor:match("vim%.$") then
    items = { "api", "fn", "keymap", "lsp", "opt", "bo", "cmd", "g", "loop", "inspect" }
  elseif before_cursor:match("vim%.api%.$") then
    items = { "nvim_create_autocmd", "nvim_buf_get_lines", "nvim_get_current_line", "nvim_set_keymap", "nvim_win_get_cursor" }
  elseif before_cursor:match("table%.$") then
    items = { "insert()", "remove()", "concat()", "sort()", "contains()" }
  elseif before_cursor:match("string%.$") then
    items = { "format()", "match()", "sub()", "gsub()", "find()", "gmatch()" }
  else
    -- normal keyword completion
    for _, label in ipairs(sources.lua) do
      if last_word == "" or label:find(last_word, 1, true) then
        table.insert(items, label)
      end
    end
    for _, w in ipairs(buffer_words()) do
      if w:find(last_word, 1, true) then
        table.insert(items, w)
      end
    end
  end

  if #items > 0 then
    -- calculate start column
    local start_col = col - #last_word + 1
    if before_cursor:match("%.$") then start_col = col + 1 end
    vim.fn.complete(start_col, items)
  end
end

return M
