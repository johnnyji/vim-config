# My VIM Configurations

The following are some common packages I have configured for VIM.

### Packages:

All packages are installed using [Pathogen](https://github.com/tpope/vim-pathogen)

* **elixir-snippets-master** - Elixir snippets
* **fzf.vim** - FuzzyFinder for VIM (Install using Homebrew)
* **the_silver_searcher** - Ag for VIM (Install using Homebrew)
* **ack.vim** - Search in directory for VIM
* **ack** - Ack used in `ack.vim`, (Install using Homebrew)
* **mustache** - Mustache syntax highlighting
* **nerdtree** - Sidebar file navigation
* **supertab** - Tab autocompletion
* **syntastic** - Syntax check highlighting
* **tblib** - Utility functions for VIM
* **vim-addons-mw-utils** - Automatic file caching
* **vim-airline** - Status Bar Plugin
* **vim-airline-themes** - Themes for `vim-airline`
* **vim-css3-syntax** - CSS3 syntax highlighting
* **vim-elixir** - Elixir highlighting
* **vim-es6** - ES6 snippets
* **vim-hybird-material** - Hybrid Material Syntax for VIM
* **vim-javascript** - JavaScript snippets
* **vim-javascript-syntax** - JavaScript syntax
* **vim-jsdoc** - JSDoc snippets
* **vim-jsx** - JSX syntax
* **vim-markdown** - Markdown syntax
* **vim-react-es6-snippets** - Johnny Ji ES6 snippets
* **vim-snipmate** - VIM autocompletion
* **vim-snippets** - Default snippets for VIM
* **vim-graphql** - GraphQL Syntax highlighting for VIM

### .vimrc

See `.vimrc` file in this package

---

### Common Gotchas

**Syntastic is not working for `eslint`**
- Syntastic only works if eslint and all it's dependencies are installed globally. The best way to debug this is to see the entire syntastic log to make sure there's no path finding errors. To do so, set `let g:syntastic_debug = 3` in `.vimrc` and open your test file. This should log a bunch of syntastic messages out and hopefully you'll be able to spot some errors right away. If not, type `:mes` into the VIM prompt
	

