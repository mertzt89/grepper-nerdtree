let s:opts = get(g:, 'nerdtree_grepper', {})
let s:key = get(s:opts, 'key', '<leader>gg')

call NERDTreeAddKeyMap({
      \ 'key': s:key,
      \ 'override': 1,
      \ 'callback': 'NERDTreeGrepperDir',
      \ 'quickhelpText': 'Grepper in dir',
      \ 'scope': 'Node' })

fu! NERDTreeGrepperDir(node) abort
  let path = a:node.path
  let cwd = path.isDirectory ? path.str() : path.getParent().str()
  exec ":Grepper -cd ".cwd
endfu
