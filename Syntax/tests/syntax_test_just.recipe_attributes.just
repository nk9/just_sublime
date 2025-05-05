# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

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
#^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
macos-attr:

[unix   ]
#^^^^^^^^ meta.sequence.list.just meta.annotation.just
unix-attr:

[  windows]
#^^^^^^^^^ meta.sequence.list.just meta.annotation.just
windows-attr:

[ windows, macos, linux]
#^^^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
# ^^^^^^^ variable.annotation.just
#        ^ punctuation.separator.parameters.just
#          ^^^^^ variable.annotation.just
#               ^ punctuation.separator.parameters.just
#                 ^^^^^ variable.annotation.just
attr-multi-valid:

[windows linux]
#^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
#^^^^^^^ variable.annotation.just
#        ^^^^^ - variable.annotation.just
attr-multi-invalid-1:

[macos, ]
#       ^ invalid.illegal.just
attr-multi-invalid-2:

[nonexistant-attribute]
#<- meta.sequence.list.just meta.annotation.just meta.annotation.just variable.annotation.just
#^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just - variable.annotation.just
attr-invalid:

[confirm, group('DOC')]
#<- meta.sequence.list.just meta.annotation.just meta.annotation.just variable.annotation.just
#^^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
#              ^ punctuation.definition.annotation.begin.just
#               ^^^^^ string.quoted
#                    ^ punctuation.definition.annotation.end.just
confirm-group:

[confirm("You sure?"), no-cd]
confirm-with-arg:
