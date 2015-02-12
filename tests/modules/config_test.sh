b.module.require config

function b.unittest.setup () {
  b.unset 'todo.config'
}

function b.test.load_configuration_from_file () {
  local filename=$(mktemp -t config_file.XXXX)
  echo "file=some/path" > "$filename"

  b.unittest.assert_equal "" "$(b.get todo.config.file)"
  todo.config.load "$filename"
  b.unittest.assert_equal "some/path" "$(b.get todo.config.file)"

  rm "$filename"
}

function b.test.load_default_configurations () {
  b.unittest.assert_equal "" "$(b.get todo.config.file)"
  todo.config.load "this_file_do_not_exist"
  b.unittest.assert_equal "$HOME/.todorc" "$(b.get todo.config.file)"
}
