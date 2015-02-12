function todo.config.load () {
  b.unset 'todo.config'

  if b.path.file? "$1"; then
    _todo.config.load_from_file "$1"
  else
    _todo.config.load_default_config
  fi
}

function _todo.config.load_from_file () {
  local rcfile="$1"

  for line in $(cat "$rcfile"); do
    local option="$(echo $line | cut -f1 -d=)"
    local value="$(echo $line | cut -f2 -d=)"

    b.set "todo.config.$option" "$value"
  done
}

function _todo.config.load_default_config () {
  b.set "todo.config.file" "$HOME/.todorc"
}
