# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

!include path/to/file
#^^^^^^^^^^^^^^^^^^^^ meta.statement.import.just
# <- keyword.control.import.just
#^^^^^^^ keyword.control.import.just
#        ^^^^^^^^^^^^ meta.generic-name.just


mod Something
#^^^^^^^^^^^^ meta.statement.mod.just 
#^^ keyword.control.import.just
#   ^^^^^^^^^ meta.generic-name.just

mod? foo
#^^^^^^^ meta.statement.mod.just 
#  ^ keyword.operator.assignment.just

mod foo2 'somewhere/else' # comment
#        ^ string.quoted.single.just punctuation.definition.string.begin.just
#         ^^^^^^^^^^^^^^^ string.quoted.single.just

mod a `yes`
#     ^ invalid.illegal.just
