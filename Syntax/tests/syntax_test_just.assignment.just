# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

#
# aliases
#

alias s := serve
# <- support.function.export.just
#^^^^ support.function.export.just
#     ^ variable.other.just
#       ^^ keyword.operator.assignment.just
#          ^^^^^ entity.name.function.just

# Aliases with leading whitespace aren't valid
 alias fail := nope
#^^^^^ source.just

#
# Variables
#
bt := '0'
# <- variable.other.just
#^ variable.other.just
#  ^^ keyword.operator.assignment.just
#     ^^^ string.quoted.single.just

log := "warn"
# <- variable.other.just
#   ^^ keyword.operator.assignment.just
#      ^^^^^^ string.quoted.double.just

varname := "testme # not a comment" # comment
#       ^^ keyword.operator.assignment.just
#          ^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.just - comment
#                                   ^^ comment.line.number-sign.just punctuation.definition.comment.begin.just
#                                     ^^^^^^^ comment.line.number-sign.just

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

escapes := '\t\n\r\"\\'
# <- variable.other.just
#       ^^ keyword.operator.assignment.just
#          ^^^^^^^^^^^^ string.quoted.single.just

string-with-no-newline := "\
#                      ^^ keyword.operator.assignment.just
#                         ^^ string.quoted.double.just
"

#
# Export assignments
#
export RUST_BACKTRACE_1 := bt
# <- keyword.declaration.variable.just
#      ^^^^^^^^^^^^^^^^ variable.other.just
#                       ^^ keyword.operator.assignment.just
#                          ^^ variable.other.just


# Sequential exports
export RUST_BACKTRACE_2 := bt
export RUST_BACKTRACE_3 := bt
# <- keyword.declaration.variable.just
#      ^^^^^^^^^^^^^^^^ variable.other.just
#                       ^^ keyword.operator.assignment.just
#                          ^^ variable.other.just

export JUST_LOG := (log + "ing" + `grep loop /etc/networks | cut -f2`)
# <- keyword.declaration.variable.just
#      ^^^^^^^^ variable.other.just
#               ^^ keyword.operator.assignment.just
#                  ^ meta.group.just punctuation.section.group.begin.just
#                   ^^^ meta.group.just variable.other.just
#                       ^ keyword.operator.arithmetic.just
#                         ^^^^^ string.quoted.double.just
#                               ^ keyword.operator.arithmetic.just
#                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.backtick.just
#                                                                    ^ meta.group.just punctuation.section.group.end.just

# comment
# <- comment.line.number-sign.just punctuation.definition.comment.begin.just
# ^^^^^^^ comment.line.number-sign.just
