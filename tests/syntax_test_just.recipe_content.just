# SYNTAX TEST "Packages/Just/Just.sublime-syntax"

braces:
  echo 'I {{{{LOVE}} curly braces!'
#      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.just 
#         ^^^^^^^^^^ - meta.interpolation.just
#         ^^ - punctuation.section.interpolation.begin.just

_braces2:
  echo '{{'I {{LOVE}} curly braces!'}}'
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.interpolation.just
#       ^^ punctuation.section.interpolation.begin.just
#         ^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.just
#                                   ^^ punctuation.section.interpolation.end.just

_braces3:
  echo `I {{ "{{" }}LOVE}} curly braces!`
#      ^^^ string.quoted.backtick.just
#         ^^^^^^^^^^ meta.interpolation.just
#                   ^^^^^^^^^^^^^^^^^^^^^ string.quoted.backtick.just
#         ^^ punctuation.section.interpolation.begin.just
#            ^^^^ string.quoted.double.just
#                 ^^ punctuation.section.interpolation.end.just
#                   ^^^^^^^^^^^^^^^^^^^^^^ - meta.interpolation.just

braces4:
  echo "I {{{{{{justfile()}} curly braces!"
#      ^^^^^^^ string.quoted.double.just
#                           ^^^^^^^^^^^^^^^ string.quoted.double.just
#         ^^^^ - meta.interpolation.just punctuation.section.interpolation.begin.just
#             ^^ punctuation.section.interpolation.begin.just
#             ^^^^^^^^^^^^^^ meta.interpolation.just
#               ^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                       ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#                        ^ meta.function-call.arguments.just punctuation.section.group.end.just
#                         ^^ punctuation.section.interpolation.end.just

bar foo:
  @echo {{ if foo == "bar" { "hello" } else { "goodbye" } }}
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.interpolation.just
#       ^^ punctuation.section.interpolation.begin.just
#                                                         ^^ punctuation.section.interpolation.end.just
#          ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.if.just
#                                      ^^^^^^^^^^^^^^^^^^ meta.statement.conditional.else.just
#                                      ^^^^ keyword.control.conditional.else.just

@test5 *args='':
    bash -c 'while (( "$#" )); do echo - $1; shift; done' -- "$@"
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ - comment

test3 target tests=path_1:
    @echo 'Testing {{ target }}:{{ tests }}…'
#                     ^^^^^^ meta.interpolation.just variable.other.just
