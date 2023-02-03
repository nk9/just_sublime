# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

string-with-no-newline := "\
#                      ^^ keyword.operator.assignment.just
#                         ^^ string.quoted.double.just
"


# Single-quoted strings don't recognize escape sequences
single_backslash := '\'
#                    ^ string.quoted.single.just - constant.character.escape.just

single_escapes := '\t\n\r\"\\\'
#                  ^^^^^^^^^^^ string.quoted.single.just - constant.character.escape.just


# Double-quoted strings DO recognize escape sequences
double_escapes := "\t\n\r\"\\"
#                  ^^^^^^^^^^ string.quoted.double.just constant.character.escape.just

backtick_code := `echo 'hello'`
#                ^ punctuation.section.interpolation.begin.just
#                             ^ punctuation.section.interpolation.end.just
#                ^^^^^^^^^^^^^^ meta.interpolation.command.shell

# Just interpolation doesn't work inside backticks
backtick_no_interp := `echo {{single_backslash}}`
#                      ^^^^^^^^^^^^^^^^^^^^^^^^^ meta.interpolation.command.shell - meta.interpolation.just

CUR_DIR_NAME := ```
#               ^^^ punctuation.section.interpolation.begin.just
basename `pwd`
#^^^^^^^^^^^^^ meta.interpolation.command.shell
```

# This backtick evaluates the command `echo foo\necho bar\n`, which produces the value `foo\nbar\n`.
stuff := ```
# <- variable.other.just
#     ^^ keyword.operator.assignment.just
#        ^^^ meta.interpolation.command.shell punctuation.section.interpolation.begin.just
    echo foo
    echo bar
#   ^^^^^^^^ meta.interpolation.command.shell
  ```
# ^^^ punctuation.section.interpolation.end.just

single_block_with_nested_quotes := '''
#                                  ^^^ string.quoted.single.block.just punctuation.definition.string.begin.just
  "Gentlemen," I said, "I've studied the maps
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.block.just
  And if what I'm thinking is right
'''
# <- string.quoted.single.block.just punctuation.definition.string.end.just
#^^ string.quoted.single.block.just punctuation.definition.string.end.just

double_block_with_nested_quotes := """
#                                  ^^^ string.quoted.double.block.just punctuation.definition.string.begin.just
  There's another new world at the top of the world
  For whoever can break through the ice"
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.block.just
  I looked round the room
# ^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.block.just
"""
# <- string.quoted.double.block.just punctuation.definition.string.end.just
#^^ string.quoted.double.block.just punctuation.definition.string.end.just

big_echo INPUT=("""
# <- meta.function.just entity.name.function.just - meta.function.parameters
#^^^^^^^ meta.function.just entity.name.function.just - meta.function.parameters
#        ^^^^^^^^^^ meta.function.parameters.just
#        ^^^^^ variable.parameter.just
#               ^^^ string.quoted.double.block.just punctuation.definition.string.begin.just
multiline
#^^^^^^^^ string.quoted.double.block.just
test
"""):
# <- string.quoted.double.block.just punctuation.definition.string.end.just
#^^ string.quoted.double.block.just punctuation.definition.string.end.just
