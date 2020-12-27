BEGIN {
  # init code goes here
  print "Grepping Category for Counts"
}

# "body" of the script follows:

/pattern-1/ {
  # what to do with the line matching the pattern?
}

/pattern-n/ {
  # ...
}

END {
  # finalizing
  printf("DONE\n", )
}
