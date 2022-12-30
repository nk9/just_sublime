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

# CUR_DIR_NAME := ```
# basename `pwd`
# #         ^^^ string.quoted.backtick.just
# ```

# This backtick evaluates the command `echo foo\necho bar\n`, which produces the value `foo\nbar\n`.
stuff := ```
# <- variable.other.just
#     ^^ keyword.operator.assignment.just
#        ^^^ string.quoted.backtick.just
    echo foo
    echo bar
#   ^^^^^^^^^ string.quoted.backtick.just
  ```
# ^^^ string.quoted.backtick.just

single_incorrect_block := ''Testing
#                         ^^ invalid.illegal.just

double_block := """
Long string
Many lines
Hello world"""

double_incorrect_block := ""Testing
#                         ^^ invalid.illegal.just

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

