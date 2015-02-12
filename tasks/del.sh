function btask.del.run () {
  local num="$1" filepath=$(b.get 'todo.config.file')

  sed -i '' "${num}d" "$filepath"
}
