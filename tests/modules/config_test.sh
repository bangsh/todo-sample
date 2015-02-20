b.module.require config

function b.test.load_configuration_from_file () {
  local filename=$(mktemp -t config_file.XXXX)
  echo "file=some/path" > "$filename"

  b.unittest.assert_equal "" "$(todo.config.path)"
  todo.config.load "$filename"
  b.unittest.assert_equal "some/path" "$(todo.config.path)"

  rm "$filename"
}

function b.test.load_default_configurations () {
  b.unittest.assert_equal "" "$(todo.config.path)"
  todo.config.load "this_file_do_not_exist"
  b.unittest.assert_equal "$HOME/.todorc" "$(todo.config.path)"
}
