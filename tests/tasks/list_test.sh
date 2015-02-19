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

function b.test.lists_todo_content () {
  local config_file="$(todo.config.path)"

  echo "First todo" >> $config_file
  echo "Second todo" >> $config_file

  local output="$(b.task.run list)"

  echo -e "$output" | grep -q "^\s*1\s*First todo$"
  b.unittest.assert_success $?

  echo -e "$output" | grep -q "^\s*2\s*Second todo$"
  b.unittest.assert_success $?
}
