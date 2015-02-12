function b.unittest.setup () {
  b.set 'todo.config.file' "$(mktemp -t config_file.XXXX)"
}

function b.unittest.teardown () {
  rm $(b.get 'todo.config.file')
}

function b.test.adds_a_todo_to_the_file () {
  local config_file=$(b.get 'todo.config.file')

  b.unittest.assert_equal "" "$(cat $config_file)"
  b.task.run "add" "My todo item"
  b.unittest.assert_equal "My todo item" "$(cat $config_file)"
}
