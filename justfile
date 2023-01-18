fmt:
    isort .
    black .
    flake8 .

@sub:
    smerge .
    subl --project Just\ Project.sublime-project
