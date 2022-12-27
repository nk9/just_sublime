# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

var := if "a" != "a" {"ne"} else {"eq"}
#      ^^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#                           ^^^^^^^^^^^ meta.statement.conditional.else.just
#^^ variable.other.just
#   ^^ keyword.operator.assignment.just
#      ^^ keyword.control.conditional.if.just
#         ^^^ string.quoted.double.just
#             ^^  keyword.operator.comparison.just
#                ^^^ string.quoted.double.just
#                    ^ punctuation.section.block.begin.just
#                     ^^^^ string.quoted.double.just
#                         ^ punctuation.section.block.end.just
#                           ^^^^ keyword.control.conditional.else.just
#                                ^ punctuation.section.block.begin.just
#                                 ^^^^ string.quoted.double.just
#                                     ^ punctuation.section.block.end.just

# Confirm that the if has ended
baa:
#<- meta.function.just entity.name.function.just

# Nested if statements inside statment blocks
var := if "b" == "a" {if "c" == "d" {"w"} else {"x"}} else {if "e" != "f" {"y"} else {"z"}}
#      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#                     ^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#                                         ^^^^^^^^^^ meta.block.just meta.statement.conditional.else.just
#                     ^^ keyword.control.conditional.if.just
#                        ^^^ string.quoted.double.just
#                            ^^ keyword.operator.comparison.just
#                               ^^^ string.quoted.double.just
#                                   ^ punctuation.section.block.begin.just
#                                    ^^^ string.quoted.double.just
#                                       ^ punctuation.section.block.end.just
#                                         ^^^^ keyword.control.conditional.else.just
#                                              ^ punctuation.section.block.begin.just
#                                               ^^^ string.quoted.double.just
#                                                  ^ punctuation.section.block.end.just
#                                                   ^ punctuation.section.block.end.just
#                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.else.just
#                                                           ^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#                                                                               ^^^^^^^^^^ meta.statement.conditional.else.just meta.block.just meta.statement.conditional.else.just
#                                                           ^^ keyword.control.conditional.if.just
#                                                              ^^^ string.quoted.double.just
#                                                                  ^^ keyword.operator.comparison.just
#                                                                     ^^^ string.quoted.double.just
#                                                                         ^ punctuation.section.block.begin.just
#                                                                          ^^^ string.quoted.double.just
#                                                                             ^ punctuation.section.block.end.just
#                                                                               ^^^^ keyword.control.conditional.else.just
#                                                                                    ^ punctuation.section.block.begin.just
#                                                                                     ^^^ string.quoted.double.just
#                                                                                        ^ punctuation.section.block.end.just 

# Confirm that the if has ended
bab:
#<- meta.function.just entity.name.function.just

# Nested if statement as condition operand
var := if if "a" == "a" {"b"} else {"c"} == "c" {"1"} else {"2"}
#      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#         ^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#                             ^^^^^^^^^^ meta.statement.conditional.else.just
#                                                     ^^^^^^^^^^ meta.statement.conditional.else.just

# Confirm that the if has ended
bac:
#<- meta.function.just entity.name.function.just

# Chained single-line if statement
abc := if "a" == "a" {"yes"} else { if "b" != "b" { "c"} else if "d" == "d" {"e"} else {"f"}}
#      ^^^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#                    ^^^^^^^ meta.block.just
#                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.else.just
#                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.block.just
#                                   ^^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#                                                        ^^^^ meta.statement.conditional.else.just keyword.control.conditional.else.just
#                                                             ^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#                                                             ^^ keyword.control.conditional.if.just
#                                                                ^^^ string.quoted.double.just
#                                                                    ^^ keyword.operator.comparison.just
#                                                                       ^^^ string.quoted.double.just
#                                                                                 ^^^^ meta.statement.conditional.else.just keyword.control.conditional.else.just

# Confirm that the if has ended
bad:
#<- meta.function.just entity.name.function.just

# Chained, multiline if statement
foo := if "hello" == "goodbye" {
  "xyz"
} else if "a" == "a" {
# ^^^^ meta.statement.conditional.else.just keyword.control.conditional.else.just
#      ^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#      ^^ keyword.control.conditional.if.just
#                    ^ punctuation.section.block.begin.just
  "abc"
} else {
# ^^^^ meta.statement.conditional.else.just keyword.control.conditional.else.just
  "123"
}
# <- meta.statement.conditional.else.just meta.block.just punctuation.section.block.end.just

# Confirm that the if has ended
bae:
#<- meta.function.just entity.name.function.just

exists := if path_exists(just_executable()) =~ '^/User' { uuid() } else { 'yeah' }
#         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#                                                                  ^^^^^^^^^^^^^^^ meta.statement.conditional.else.just
#                                                                  ^^^^ keyword.control.conditional.else.just 
#                                           ^^ keyword.operator.comparison.just
