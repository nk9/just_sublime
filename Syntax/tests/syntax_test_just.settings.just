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
