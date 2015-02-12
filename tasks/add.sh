function btask.add.run () {
  local filename="$(b.get 'todo.config.file')"

  echo "$1" >> "$filename"
}
