# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

python3 *ARGS:
  #!/usr/bin/python3
 #^^^^^^^^^^^^^^^^^^ source.python.embedded.just comment.line.number-sign.python
  print("hello {{ ARGS }} world")
 #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.python.embedded.just
 #     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.python
 #      ^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.python string.quoted.double.python
 #             ^^^^^^^^^^ meta.interpolation.just

shell *$ARGS:
  #!/bin/sh
 #^^^^^^^^^ source.shell.embedded.just comment.line.number-sign.shell
  set -euxo pipefail
  echo "doing {{ARGS}} stuff"
 #            ^^^^^^^^ meta.interpolation.just


bash $PREFIX:
  #!/usr/bin/env bash
 #^^^^^^^^^^^^^^^^^^^ source.shell.embedded.just comment.line.number-sign.shell
  set -euxo pipefail
 #^^^^^^^^^^^^^^^^^^ source.shell.embedded.just
  for i in ${PREFIX}{0..10}; do echo scp somefile.txt ${i}; done;

