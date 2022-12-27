# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

var1 := if arch() == 'unix' {"yelaw"} else {if "1" == "1" {uppercase("lapse")} else {"hey"}}
#                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.statement.conditional.else.just meta.block.just meta.statement.conditional.if.just
#          ^^^^ meta.statement.conditional.if.just meta.function-call.identifier.just support.function.builtin.just
#                                                          ^^^^^^^^^ support.function.builtin.just

an_arch := trim(justfile()) + arch()
#          ^^^^ meta.function-call.identifier.just support.function.builtin.just
#              ^^^^^^^^^^^^ meta.function-call.arguments.just
#              ^ punctuation.section.group.begin.just 
#               ^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                           ^ keyword.operator.arithmetic.just
#                             ^^^^^^ meta.function-call
#                             ^^^^ meta.function-call.identifier.just support.function.builtin.just
#                                 ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#                                  ^ meta.function-call.arguments.just punctuation.section.group.end.just

export test := "yelaw"
abc := "hello"
apath := justfile()

s := replace      ((test + abc + replace((apath), "/", "_")), "l", "g")
#                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.just
#                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.just 
#                 ^ punctuation.section.group.begin.just
#                  ^ punctuation.section.group.begin.just
#                   ^^^^ variable.other.just
#                        ^ keyword.operator.arithmetic.just
#                          ^^^ variable.other.just
#                              ^ keyword.operator.arithmetic.just
#                                ^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                                       ^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.just  
#                                       ^ punctuation.section.group.begin.just
#                                        ^^^^^^^ meta.group.just
#                                        ^ punctuation.section.group.begin.just
#                                         ^^^^^ variable.other.just
#                                              ^ punctuation.section.group.end.just
#                                               ^ punctuation.separator.sequence.just
#                                                 ^^^ string.quoted.double.just
#                                                    ^ punctuation.separator.sequence.just
#                                                      ^^^ string.quoted.double.just
#                                                         ^ punctuation.section.group.end.just
#                                                          ^ punctuation.section.group.end.just
#                                                           ^ punctuation.separator.sequence.just
#                                                             ^^^ string.quoted.double.just
#                                                                ^ punctuation.separator.sequence.just
#                                                                  ^^^ string.quoted.double.just
#                                                                     ^ punctuation.section.group.end.just

# Above across multiple lines
t := replace      ((test +
# <- variable.other.just
# ^^ keyword.operator.assignment.just
#    ^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                 ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#                  ^ meta.function-call.arguments.just meta.group.just punctuation.section.group.begin.just
#                   ^^^^ meta.function-call.arguments.just meta.group.just variable.other.just
#                        ^ meta.function-call.arguments.just meta.group.just keyword.operator.arithmetic.just
    abc +
#   ^^^ meta.function-call.arguments.just meta.group.just variable.other.just
#       ^ meta.function-call.arguments.just meta.group.just keyword.operator.arithmetic.just
    replace((apath), "/", "_")), "l", "g")
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.just
#   ^^^^^^^ meta.group.just meta.function-call.identifier.just support.function.builtin.just
#          ^ meta.group.just punctuation.section.group.begin.just
#           ^ meta.group.just punctuation.section.group.begin.just
#            ^^^^^ meta.group.just variable.other.just

trim_end := trim_end("99.99954%   ")
#           ^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                   ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#                    ^^^^^^^^^^^^^^ string.quoted.double.just
#                                  ^ meta.function-call.arguments.just punctuation.section.group.end.just

home_dir := replace(env_var('HOME') / "yep", 'yep', '')
#           ^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.just
#                   ^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                                   ^ keyword.operator.arithmetic.just
#                                                     ^ punctuation.section.group.end.just

quoted := quote("some things beyond\"$()^%#@!|-+=_*&'`")
#         ^^^^^ meta.function-call.identifier.just support.function.builtin.just
#              ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.just
#                                  ^^ constant.character.escape.just

smartphone := trim_end_match('blah.txt', 'txt')
#             ^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

museum := trim_start_match(trim_start(trim_end_matches('   yep_blah.txt.txt', '.txt')), 'yep_')
#         ^^^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                          ^^^^^^^^^^ meta.function-call.arguments.just meta.function-call.identifier.just support.function.builtin.just
#                                     ^^^^^^^^^^^^^^^^ meta.function-call.arguments.just meta.function-call.arguments.just meta.function-call.identifier.just support.function.builtin.just

water := trim_start_matches('fffffruit.txt', 'f')
#        ^^^^^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                          ^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.just
#                          ^ punctuation.section.group.begin.just
#                           ^^^^^^^^^^^^^^^ string.quoted.single.just
#                                          ^ punctuation.separator.sequence.just
#                                            ^^^ string.quoted.single.just
#                                               ^ punctuation.section.group.end.just

myos := os()
#       ^^ meta.function-call.identifier.just support.function.builtin.just

fam := os_family()
#      ^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#               ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#                ^ meta.function-call.arguments.just punctuation.section.group.end.just

path_2 := absolute_path('test')
#         ^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

ext_z := extension(path_2)
#        ^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

exe_name := file_name(just_executable())
#           ^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                    ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#                     ^^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                                    ^ meta.function-call.arguments.just meta.function-call.arguments.just punctuation.section.group.begin.just
#                                     ^ meta.function-call.arguments.just meta.function-call.arguments.just punctuation.section.group.end.just
#                                      ^ meta.function-call.arguments.just punctuation.section.group.end.just

a_stem := file_stem(path_2)
#         ^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just


a_parent := parent_directory(path_2)
#           ^^^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

sans_ext := without_extension(path_2)
#           ^^^^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

camera := join('tmp', 'dir1', 'dir2', path_2)
#         ^^^^ meta.function-call.identifier.just support.function.builtin.just
#             ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#              ^^^^^ string.quoted.single.just
#                   ^ punctuation.separator.sequence.just
#                     ^^^^^^ string.quoted.single.just
#                           ^ punctuation.separator.sequence.just
#                             ^^^^^^ string.quoted.single.just
#                                   ^ punctuation.separator.sequence.just
#                                     ^^^^^^ variable.other.just
#                                           ^ meta.function-call.arguments.just punctuation.section.group.end.just

cleaned := clean('/tmp/blah/..///thing.txt')
#          ^^^^^ meta.function-call.identifier.just support.function.builtin.just

id__path := '/tmp' / sha256('blah') / sha256_file(justfile())
#                    ^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                           ^^^^^^ string.quoted.single.just
#                                   ^ keyword.operator.arithmetic.just
#                                     ^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                                                ^ punctuation.section.group.begin.just
#                                                 ^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                                                         ^ punctuation.section.group.begin.just
#                                                          ^^ punctuation.section.group.end.just

_another_var := env_var_or_default("HOME", justfile_directory())
#               ^^^^^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                                 ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#                                  ^^^^^^ string.quoted.double.just
#                                        ^ punctuation.separator.sequence.just
#                                          ^^^^^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                                                            ^ punctuation.section.group.begin.just
#                                                             ^^ punctuation.section.group.end.just

replaced := replace_regex("1alpha9", "\\d", "b")
#           ^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just


#
# Change case
#

ALL_CAPS := capitalize("lower")
#           ^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

kebab := kebabcase("test_me")
#        ^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

shoutykebab := shoutykebabcase("test_me")
#              ^^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

snake := snakecase("test-me")
#        ^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

shoutysnake := shoutysnakecase("test-me")
#              ^^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

uppercamel := uppercamelcase("test-me")
#             ^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

lowercamel := lowercamelcase("test-me")
#             ^^^^^^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

lowercase := lowercase("TEST-ME")
#            ^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

title := titlecase("test me thanks")
#        ^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just

upper := uppercase("test-me")
#        ^^^^^^^^^ meta.function-call.identifier.just support.function.builtin.just
#                 ^ meta.function-call.arguments.just punctuation.section.group.begin.just
#                  ^^^^^^^^^ string.quoted.double.just
#                           ^ meta.function-call.arguments.just punctuation.section.group.end.just

