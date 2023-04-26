# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

python3 *ARGS:
  #!/usr/bin/python3
 #^^^^^^^^^^^^^^^^^^ source.python.embedded.just comment.line.number-sign.python
  print("hello {{ ARGS }} world")
 #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.python.embedded.just
 #     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments.python
 #      ^^^^^^^ meta.string.python string.quoted.double.python - meta.interpolation
 #             ^^^^^^^^^^ meta.string.python meta.interpolation.just - string
 #                       ^^^^^^^ meta.string.python string.quoted.double.python - meta.interpolation

bash *$ARGS:
  #!/bin/sh
  set -euxo pipefail
  echo "doing stuff"


recipe-name $PREFIX:
  #!/usr/bin/env bash
  set -euxo pipefail
  for i in ${PREFIX}{0..10}; do echo scp somefile.txt ${i}; done;

