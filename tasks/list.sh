function btask.list.run () {
  local filename="$(todo.config.path)"

  cat -n "$filename"
}
