if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'e', 'exit'
  Pry.commands.alias_command 'f', 'finish'
end
