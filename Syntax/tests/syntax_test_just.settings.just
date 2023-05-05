# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

#
# Boolean settings
#

set allow-duplicate-recipes
# <- storage.modifier.definition.just
#   ^^^^^^^^^^^^^^^^^^^^^^^ entity.name.definition.just

set dotenv-load := true
#   ^^^^^^^^^^^ entity.name.definition.just
#               ^^ keyword.operator.assignment.just
#                  ^^^^ constant.language.boolean.just

set export
#   ^^^^^^ entity.name.definition.just

set fallback
#   ^^^^^^^^ entity.name.definition.just

set ignore-comments
#   ^^^^^^^^^^^^^^^ entity.name.definition.just

# Sequential set
set ignore-comments := true
set ignore-comments := false
#<- storage.modifier.definition.just
#^^ storage.modifier.definition.just
#   ^^^^^^^^^^^^^^^ entity.name.definition.just -group
#                   ^^ keyword.operator.assignment.just
#                      ^^^^^ constant.language.boolean.just

set positional-arguments
#   ^^^^^^^^^^^^^^^^^^^^ entity.name.definition.just

set tempdir := '/tmp/just'
#   ^^^^^^^ entity.name.definition.just - group
#           ^^ keyword.operator.assignment.just
#              ^^^^^^^^^^^ string.quoted.single.just

set windows-powershell
#   ^^^^^^^^^^^^^^^^^^ entity.name.definition.just


#
# Shell settings
#

set shell := ["sh", "-c"]
#   ^^^^^ entity.name.definition.just
#         ^^ keyword.operator.assignment.just
#            ^ punctuation.section.brackets.start.just
#            ^^^^^^^^^^^^ meta.sequence.list.just
#             ^^^^ string.quoted.double.just
#                 ^ punctuation.separator.parameters.just
#                   ^^^^ string.quoted.double.just
#                       ^ punctuation.section.brackets.end.just

set windows-shell := ["powershell.exe", "-NoLogo", "-Command#nocomment"]
#   ^^^^^^^^^^^^^ entity.name.definition.just
#                 ^^ keyword.operator.assignment.just

set windows-powershell := true
#^^ storage.modifier.definition.just
#   ^^^^^^^^^^^^^^^^^^ entity.name.definition.just
#                      ^^ keyword.operator.assignment.just
#                         ^^^^ constant.language.boolean.just


#
# Comments
#
set ignore-comments # Comment
#^^ storage.modifier.definition.just
#   ^^^^^^^^^^^^^^^ entity.name.definition.just
#                   ^^ comment.line.number-sign.just punctuation.definition.comment.begin.just
#                    ^^^^^^^^ comment.line.number-sign.just


#
# Invalid cases
#

# Extra characters for boolean setting
set exported
#^^ storage.modifier.definition.just
#   ^^^^^^^^^ - entity.name.definition.just - variable.other.just

# Extra characters for string setting
set tempdirectory := '/tmp'
#   ^^^^^^^^^^^^^ invalid.illegal.just - entity.name.definition.just - variable.other.just

set shellac := ["sh", "-c"]
#   ^^^^^^^ invalid.illegal.just - entity.name.definition.just - variable.other.just

# Wrong character case
set tempDir
#^^ storage.modifier.definition.just
#   ^^^^^^^^ - entity.name.definition.just - variable.other.just

set export := trued
#             ^^^^^ - constant.language.boolean.just

set dotenv-load := falsey
#                  ^^^^^^ - constant.language.boolean.just



# [#19] First variable assignment following a set marked as invalid
set positional-arguments
export ONE := "1"
#<- keyword.declaration.variable.just
#^^^^^ keyword.declaration.variable.just
#      ^^^ variable.other.just
#          ^^ keyword.operator.assignment.just
#             ^^^ string.quoted.double.just

set export := true
export TRY := "1"
#<- keyword.declaration.variable.just
#^^^^^ keyword.declaration.variable.just
#      ^^^ variable.other.just
#          ^^ keyword.operator.assignment.just
#             ^^^ string.quoted.double.just

set shell := ["sh", "-c"]
export TWO := "2"
#<- keyword.declaration.variable.just
#^^^^^ keyword.declaration.variable.just
#      ^^^ variable.other.just
#          ^^ keyword.operator.assignment.just
#             ^^^ string.quoted.double.just

set tempdir := ""
export := true
# <- variable.other.just - entity

set tempdir := ""
export := true
shell := ["sh", "-c"]
# <- variable.other.just - entity
