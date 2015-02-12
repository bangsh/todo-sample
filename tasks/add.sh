function btask.add.run () {
  local filename="$(todo.config.path)"

  echo "$1" >> "$filename"
}
