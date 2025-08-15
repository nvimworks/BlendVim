return {
    'tomiis4/BufferTabs.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    config = function()
        require('buffertabs').setup({
            ---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
            border = 'single',

            padding = 1,

            icons = true,

            modified = " ",

            hl_group = 'Keyword',

            hl_group_inactive = 'Comment',

            show_all = false,

            show_single_buffer = true,

            ---@type 'row'|'column'
            display = 'row',

            ---@type 'left'|'right'|'center'
            horizontal = 'center',

            ---@type 'top'|'bottom'|'center'
            vertical = 'top',

            --- In ms (recommended 2000)
            timeout = 0,

            show_id = false,

            max_buffers = 0,

            surround_active_buffer = 0,
        })
    end
}
