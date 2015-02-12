function b.test.lists_todo_content () {
  local config_file="$(mktemp -t config_file.XXX)"
  b.set 'todo.config.file' $config_file
  echo "First todo" >> $config_file
  echo "Second todo" >> $config_file

  local output="$(b.task.run list)"

  echo -e "$output" | grep -q "^\s*1\s*First todo$"
  b.unittest.assert_success $?

  echo -e "$output" | grep -q "^\s*2\s*Second todo$"
  b.unittest.assert_success $?
}
