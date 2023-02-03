# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

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

@_braces3:
  echo 'I {{ "{{" }}LOVE}} curly braces!'
#      ^^^ string.quoted.single.just
#         ^^^^^^^^^^ meta.interpolation.just
#                   ^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.just
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

newline-hyphens:
  -find . -type d \
    -exec \
#         ^ punctuation.separator.continuation.line.just
#   ^ - storage.modifier.ignore-error.just
    ls -ld {} \;

a:
  @echo "hi"
# ^ storage.modifier.quiet.just

b:
  -echo "hi"
# ^ storage.modifier.ignore-error.just

c:
  @-echo "hi"
# ^ storage.modifier.quiet.just
#  ^ storage.modifier.ignore-error.just

d:
  -@echo "hi"
# ^ storage.modifier.ignore-error.just
#  ^ storage.modifier.quiet.just

line-prefix-for-default-shell-only:
  #!/usr/bin/sh
  -echo "hi"
 #^ - storage.modifier.ignore-error.just

continuation-with-strings-and-interpolation NAME:
  find . -type f \
    -name {{NAME}} -not -path "*.mp3"
#         ^^^^^^^^ meta.interpolation.just
#                             ^^^^^^^ meta.string.just string.quoted.double.just
