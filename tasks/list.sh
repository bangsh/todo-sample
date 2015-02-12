function btask.list.run () {
  local filename="$(b.get 'todo.config.file')"

  cat -n "$filename"
}
