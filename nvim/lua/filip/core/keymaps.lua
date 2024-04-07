-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- clipboard
--keymap.set("n", "y", '"*y', { noremap = true })
--keymap.set("n", "p", '"*p', { noremap = true })
--keymap.set("v", "y", '"*y', { noremap = true })
--keymap.set("v", "p", '"*p', { noremap = true })
--keymap.set("n", "Y", '"+y', { noremap = true })
--keymap.set("n", "P", '"+p', { noremap = true })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>tc", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<S-l>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<S-h>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>t1", "<cmd>1tabnext<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>t2", "<cmd>2tabnext<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>t3", "<cmd>3tabnext<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>t4", "<cmd>4tabnext<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>t5", "<cmd>5tabnext<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>t6", "<cmd>6tabnext<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>t7", "<cmd>7tabnext<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>t8", "<cmd>8tabnext<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>t9", "<cmd>9tabnext<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<cr>", ":noh<cr><cr>", { desc = "Clear search highlight", noremap = true })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down", noremap = true })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up", noremap = true })

-- marks, I always want the marks to be globals
keymap.set("n", "<leader>ma", "mA", { noremap = true })
keymap.set("n", "<leader>mb", "mB", { noremap = true })
keymap.set("n", "<leader>mc", "mC", { noremap = true })
keymap.set("n", "<leader>md", "mD", { noremap = true })
keymap.set("n", "<leader>me", "mE", { noremap = true })
keymap.set("n", "<leader>mf", "mF", { noremap = true })
keymap.set("n", "<leader>mg", "mG", { noremap = true })
keymap.set("n", "<leader>mh", "mH", { noremap = true })
keymap.set("n", "<leader>mi", "mI", { noremap = true })
keymap.set("n", "<leader>mj", "mJ", { noremap = true })
keymap.set("n", "<leader>mk", "mK", { noremap = true })
keymap.set("n", "<leader>ml", "mL", { noremap = true })
keymap.set("n", "<leader>mm", "mM", { noremap = true })
keymap.set("n", "<leader>mn", "mN", { noremap = true })
keymap.set("n", "<leader>mo", "mO", { noremap = true })
keymap.set("n", "<leader>mp", "mP", { noremap = true })
keymap.set("n", "<leader>mq", "mQ", { noremap = true })
keymap.set("n", "<leader>mr", "mR", { noremap = true })
keymap.set("n", "<leader>ms", "mS", { noremap = true })
keymap.set("n", "<leader>mt", "mT", { noremap = true })
keymap.set("n", "<leader>mu", "mU", { noremap = true })
keymap.set("n", "<leader>mv", "mV", { noremap = true })
keymap.set("n", "<leader>mw", "mW", { noremap = true })
keymap.set("n", "<leader>mx", "mX", { noremap = true })
keymap.set("n", "<leader>my", "mY", { noremap = true })
keymap.set("n", "<leader>mz", "mZ", { noremap = true })

keymap.set("n", "ma", "'A", { noremap = true })
keymap.set("n", "mb", "'B", { noremap = true })
keymap.set("n", "mc", "'C", { noremap = true })
keymap.set("n", "md", "'D", { noremap = true })
keymap.set("n", "me", "'E", { noremap = true })
keymap.set("n", "mf", "'F", { noremap = true })
keymap.set("n", "mg", "'G", { noremap = true })
keymap.set("n", "mh", "'H", { noremap = true })
keymap.set("n", "mi", "'I", { noremap = true })
keymap.set("n", "mj", "'J", { noremap = true })
keymap.set("n", "mk", "'K", { noremap = true })
keymap.set("n", "ml", "'L", { noremap = true })
keymap.set("n", "mm", "'M", { noremap = true })
keymap.set("n", "mn", "'N", { noremap = true })
keymap.set("n", "mo", "'O", { noremap = true })
keymap.set("n", "mp", "'P", { noremap = true })
keymap.set("n", "mq", "'Q", { noremap = true })
keymap.set("n", "mr", "'R", { noremap = true })
keymap.set("n", "ms", "'S", { noremap = true })
keymap.set("n", "mt", "'T", { noremap = true })
keymap.set("n", "mu", "'U", { noremap = true })
keymap.set("n", "mv", "'V", { noremap = true })
keymap.set("n", "mw", "'W", { noremap = true })
keymap.set("n", "mx", "'X", { noremap = true })
keymap.set("n", "my", "'Y", { noremap = true })
keymap.set("n", "mz", "'Z", { noremap = true })

keymap.set("n", "<leader>v", "<C-v>", { desc = "Start blockwise visual" })
keymap.set("v", "<leader>v", "<C-v>", { desc = "Start blockwise visual" })
keymap.set("n", "<leader>so", "<cmd>luafile %<CR>", { desc = "source vimrc" })
