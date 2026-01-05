# Vim Setup with vim-plug and Gruvbox Theme

This guide explains how to set up **Vim plugin management using vim-plug**, install a color scheme, and configure useful Vim settings.

---

## Prerequisites

Make sure the following are installed:

- **Vim**
- **Git**

On Ubuntu/Debian:

```bash
sudo apt update
sudo apt install vim git -y
```

---

## Step-by-Step Installation

### 1. Install vim-plug

Run the following command in your terminal:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

---

### 2. Create Plugin Directory

```bash
mkdir -p ~/.vim/plugged
```

---

### 3. Configure Plugins in `.vimrc`

Open your Vim configuration file:

```bash
vi ~/.vimrc
```

Add the following lines:

```vim
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'

call plug#end()
```

Save and exit.

---

### 4. Install Plugins

Open Vim:

```bash
vim
```

Inside Vim, run:

```vim
:PlugInstall
```

---

### 5. Enable Color Scheme

Edit `.vimrc` again:

```bash
vi ~/.vimrc
```

Add:

```vim
colorscheme gruvbox
set background=dark
```

---

## Recommended Vim Settings

Append the following to your `.vimrc`:

```vim
syntax on
set number
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set incsearch
set smartcase

set scrolloff=8
set noerrorbells
set noswapfile
```

---
