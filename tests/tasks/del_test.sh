b.module.require config

function b.unittest.setup () {
  b.set 'test.config.todo.file' "$(mktemp -t config_file.XXXX)"
  b.unittest.double.do todo.config.path _todo_config_path
}

function _todo_config_path () {
  b.get 'test.config.todo.file'
}

function b.unittest.teardown () {
  rm $(_todo_config_path)
  b.unset 'test'
}

function b.test.deletes_a_todo_item () {
  local config_file="$(todo.config.path)"
  echo "First todo" >> "$config_file"
  echo "Second todo" >> "$config_file"

  b.task.run 'del' '1'

  cat $config_file | grep -q "First todo"
  b.unittest.assert_error $?
}
