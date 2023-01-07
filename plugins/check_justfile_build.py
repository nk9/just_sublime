import sublime
import sublime_plugin

import subprocess
import threading
import os


from Default.exec import ExecCommand


class CheckJustfileBuildCommand(ExecCommand):
    def run(self, **kwargs):
        print("&&&&")
        # Get the list of variables known to build systems
        variables = self.window.extract_variables()
        print("var=", variables)

        # Is there a file path? There won't be if the file hasn't been saved
        # yet.
        if "file" in variables:
            # name = self.window.active_view().file_name()
            print("file path:", variables["file"])
        else:
            print("no file path found")

        kwargs = sublime.expand_variables(kwargs, variables)
        super().run(**kwargs)
