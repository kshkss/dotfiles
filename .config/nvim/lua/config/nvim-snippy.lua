require('snippy').setup({
    mappings = {
        is = {
            ['<C-k>'] = 'expand_or_advance',
            ['<Tab>'] = 'next',
            ['<S-Tab>'] = 'previous',
        },
        nx = {
            ['<leader>x'] = 'cut_text',
        },
    },
})
