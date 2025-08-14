local M = {}

function M.smart_delete_buffer()
    local bufnr = vim.api.nvim_get_current_buf()

    -- Get list of valid, listed buffers
    local bufs = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted
    end, vim.api.nvim_list_bufs())

    -- If more than one buffer, go to the next before deleting
    if #bufs > 1 then
        vim.cmd("bnext")
    end

    -- Delete the original buffer
    vim.cmd("bdelete " .. bufnr)
end

return M
