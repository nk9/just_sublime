# SYNTAX TEST "Packages/Just/Just.sublime-syntax"

for:
# <- meta.function.just entity.name.function.just - meta.function.parameters
#^^ meta.function.just entity.name.function.just - meta.function.parameters
#  ^ keyword.operator.assignment.just
  for file in `ls .`; do \
    echo $file; \
  done

_bar2 foo_stuff:
# <- meta.function.just entity.name.function.just
#^^^^ meta.function.just entity.name.function.just
#     ^^^^^^^^^ meta.function.parameters.just variable.parameter.just
#              ^ keyword.operator.assignment.just
  @echo {{ if foo_stuff == "bar" { "hello" } else { "goodbye" } }}
# ^ storage.modifier.quiet.just

@a:
# <- meta.function.just storage.modifier.quiet.just
  echo 'A!'

b: a && d (_bar2 justfile())
# <- meta.function.just entity.name.function.just
#^ keyword.operator.assignment.just
#  ^ entity.name.function.just
#    ^^ keyword.operator.logical.just
#       ^ entity.name.function.just 
#         ^ punctuation.section.group.begin.just
#          ^^^^^ entity.name.function.just
#                ^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                        ^^ meta.function-call.arguments.just
#                        ^ punctuation.section.group.begin.just
#                         ^^ punctuation.section.group.end.just
  echo 'B start!'
  just -f {{justfile()}} c
  echo 'B end!'

c:
  echo 'C!'

d:
  echo 'D!'

test3 target tests=path_1:
# <- meta.function.just entity.name.function.just - meta.function.parameters
#^^^^ meta.function.just entity.name.function.just - meta.function.parameters
#     ^^^^^^^^^^^^^^^^^^^ meta.function.parameters.just
#     ^^^^^^ variable.parameter.just
#            ^^^^^ variable.parameter.just
#                 ^ keyword.operator.assignment.just
#                  ^^^^^^ variable.other.just
#                        ^ keyword.operator.assignment.just
  @echo 'Testing {{target}}:{{tests}}…'
  ./test --tests {{tests}} {{target}}

test4 triple=(an_arch + "-unknown-unknown") input=(an_arch / "input.dat"):
#<- meta.function.just entity.name.function.just - meta.function.parameters
#^^^^ meta.function.just entity.name.function.just - meta.function.parameters
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.parameters.just
#     ^^^^^^ variable.parameter.just
#           ^ keyword.operator.assignment.just
#            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.just
#            ^ punctuation.section.group.begin.just
#             ^^^^^^^ variable.other.just
#                     ^ keyword.operator.arithmetic.just
#                       ^^^^^^^^^^^^^^^^^^ string.quoted.double.just
#                                         ^ punctuation.section.group.end.just
#                                           ^^^^^ variable.parameter.just
#                                                ^ keyword.operator.assignment.just
#                                                 ^^^^^^^^^^^^^^^^^^^^^^^ meta.group.just
#                                                 ^ punctuation.section.group.begin.just
#                                                  ^^^^^^^ variable.other.just
#                                                          ^ keyword.operator.arithmetic.just
#                                                            ^^^^^^^^^^^ string.quoted.double.just
#                                                                       ^ punctuation.section.group.end.just
#                                                                        ^ keyword.operator.assignment.just
  ./test {{triple}}

variadic $VAR1_1 VAR2 VAR3 VAR4=("a") +$FLAGS='-q': foo2 braces
#        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.parameters.just
#        ^ keyword.operator.exported.just
#         ^^^^^^ variable.parameter.just
#                ^^^^ variable.parameter.just
#                     ^^^^ variable.parameter.just
#                          ^^^^ variable.parameter.just
#                              ^ keyword.operator.assignment.just
#                               ^ meta.group.just punctuation.section.group.begin.just
#                                ^^^ meta.group.just string.quoted.double.just
#                                   ^ meta.group.just punctuation.section.group.end.just
#                                     ^ keyword.operator.variadic.just
#                                      ^ keyword.operator.exported.just
#                                       ^^^^^ variable.parameter.just
#                                            ^ keyword.operator.assignment.just
#                                             ^^^^ string.quoted.single.just
#                                                 ^ keyword.operator.assignment.just
#                                                   ^^^^ entity.name.function.just
#                                                        ^^^^^^ entity.name.function.just
  cargo test {{FLAGS}}

script2 *ARGS:
#^^^^^^ meta.function.just entity.name.function.just
#       ^ meta.function.parameters.just keyword.operator.variadic.just
#        ^^^^ meta.function.parameters.just variable.parameter.just
#            ^ keyword.operator.assignment.just
    {{ python }} script2.py {{ ARGS }}

script3:
    #!/usr/bin/python3
#   ^^^^^^^^^^^^^^^^^^ comment.line.shebang.just
    print("hello world")


#
# Recipe dependencies
#
_build version:
    @-echo 'Building {{justfile() + "string"}}…'
#          ^^^^^^^^^^ meta.string.just string.quoted.single.just - meta.interpolation
#                    ^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.just meta.interpolation.just - string.quoted.single
#                                             ^^ meta.string.just string.quoted.single.just - meta.interpolation
#                      ^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                              ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#                               ^ meta.function-call.arguments.just punctuation.section.group.end.just
#                                 ^ keyword.operator.arithmetic.just
#                                   ^^^^^^^^ string.quoted.double.just
#                                           ^^ punctuation.section.interpolation.end.just
    cd {{version}} && make

# Argument to dependency
target := "main"
build: script2 (_build target) script3
#^^^^ meta.function.just entity.name.function.just
#    ^ keyword.operator.assignment.just
#      ^^^^^^^ entity.name.function.just
#               ^^^^^^ entity.name.function.just
#                      ^^^^^^ variable.other.just
#                            ^ punctuation.section.group.end.just
#                              ^^^^^^^ entity.name.function.just

r3-:
#^^ meta.function.just entity.name.function.just


#
# Variadic and export operators, and illegal markings
#
r2 +$f:
#  ^^ meta.function.parameters.just
#  ^ keyword.operator.variadic.just
#   ^ keyword.operator.exported.just

r1 $*f:
#  ^^ meta.function.parameters.just invalid.illegal.just

r2 +$+f:
#  ^^^ meta.function.parameters.just
#  ^ keyword.operator.variadic.just
#   ^^ invalid.illegal.just

r3 +$*f:
#  ^^^ meta.function.parameters.just
#  ^ keyword.operator.variadic.just
#   ^^ invalid.illegal.just

r4 $$f:
#  ^^ meta.function.parameters.just
#  ^ invalid.illegal.just
#   ^ keyword.operator.exported.just

r5 +$+$ f:
#  ^^^^ meta.function.parameters.just
#  ^ keyword.operator.variadic.just
#   ^^ invalid.illegal.just
#     ^ keyword.operator.exported.just

r6 **$f:
#  ^^^ meta.function.parameters.just
#  ^ keyword.operator.variadic.just
#   ^ invalid.illegal.just
#    ^ keyword.operator.exported.just

r7 $:
#  ^ meta.function.parameters.just invalid.illegal.just


r8 +:
#  ^ meta.function.parameters.just invalid.illegal.just

r9 +$:
#  ^^ meta.function.parameters.just
#   ^ invalid.illegal.just


#
# Recipe attributes
#

[no-cd]
# <- meta.annotation.just variable.annotation.just
#^^^^^^ meta.annotation.just variable.annotation.just
[no-exit-message]
#^^^^^^^^^^^^^^^^ meta.annotation.just variable.annotation.just
[private]
#^^^^^^^^ meta.annotation.just variable.annotation.just
attr-test:

[linux]
#^^^^^^ meta.annotation.just variable.annotation.just
linux-attr:

[  macos  ]
#^^^^^^^^^^ meta.annotation.just variable.annotation.just
macos-attr:

[unix   ]
#^^^^^^^^ meta.annotation.just variable.annotation.just
unix-attr:

[  windows]
#^^^^^^^^^^ meta.annotation.just variable.annotation.just
windows-attr:


test-image $PRODUCT $VERSION +IMAGES:
#                            ^ meta.function.parameters.just keyword.operator.arithmetic.just
#                             ^^^^^^ meta.function.parameters.just variable.parameter.just

set-chart-version chart-version=version:
# <- meta.function.just entity.name.function.just
#^^^^^^^^^^^^^^^^ meta.function.just entity.name.function.just
#                 ^^^^^^^^^^^^^ meta.function.parameters.just variable.parameter.just
#                              ^ meta.function.parameters.just keyword.operator.assignment.just
#                               ^^^^^^^ meta.function.parameters.just variable.other.just
#                                      ^ keyword.operator.assignment.just

alias-name:
# <- meta.function.just entity.name.function.just
#^^^^^^^^^ meta.function.just entity.name.function.just

export-name:
# <- meta.function.just entity.name.function.just
#^^^^^^^^^^ meta.function.just entity.name.function.just
