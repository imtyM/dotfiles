## Requirements

You will need to install `mise` (and make sure its in your path), `zsh`, `nvim` and `ranger` on your own. There is no install script yet

## Usage

The dotfiles use `stow`.

- `apt install stow`
- `stow */`

if it complains about overwriting files, you can use:

```sh
stow */ --adopt
git restore .
```

You can give the install script a try too.

This will create symlinks to the dotfiles in **this** directory.
