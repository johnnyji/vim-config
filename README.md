# My VIM Configurations

The following are some common packages I have configured for VIM.

### Packages:

All packages are installed using [vim-plug](https://github.com/junegunn/vim-plug)

The following are prerequisites that need to be installed via Homebrew beforehand:

* **fzf.vim** - FuzzyFinder for VIM (Install using Homebrew)
* **the_silver_searcher** - Ag for VIM (Install using Homebrew)
* **ack** - Ack used in `ack.vim`, (Install using Homebrew)

### .vimrc

See `.vimrc` file in this package

---

### Common Gotchas

**Syntastic is not working for `eslint`**
- Syntastic only works if eslint and all it's dependencies are installed globally. The best way to debug this is to see the entire syntastic log to make sure there's no path finding errors. To do so, set `let g:syntastic_debug = 3` in `.vimrc` and open your test file. This should log a bunch of syntastic messages out and hopefully you'll be able to spot some errors right away. If not, type `:mes` into the VIM prompt
	

