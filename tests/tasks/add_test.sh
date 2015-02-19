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

function b.test.adds_a_todo_to_the_file () {
  local config_file=$(todo.config.path)

  b.unittest.assert_equal "" "$(cat $config_file)"

  b.task.run "add" "My todo item"

  b.unittest.assert_equal "My todo item" "$(cat $config_file)"
}
