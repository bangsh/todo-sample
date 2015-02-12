function b.test.deletes_a_todo_item () {
  local config_file="$(mktemp -t config_file.XXX)"
  b.set 'todo.config.file' $config_file
  echo "First todo" >> $config_file
  echo "Second todo" >> $config_file

  b.task.run 'del' '1'

  cat $config_file | grep -q "First todo"
  b.unittest.assert_error $?
}
