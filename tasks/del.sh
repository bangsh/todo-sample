function btask.del.run () {
  local num="$1" filepath=$(todo.config.path)

  sed -i '' "${num}d" "$filepath"
}
