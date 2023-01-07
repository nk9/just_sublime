# from .plugins.check_justfile_build import *

"""Load and Unload all MarkdownEditing modules.
This module exports __all__ modules, which Sublime Text needs to know about.
Based on the plugin.py in the MarkdownEditing package:
https://github.com/SublimeText-Markdown/MarkdownEditing/blob/master/plugin.py
"""
import sublime
import sublime_plugin

from pathlib import Path

if int(sublime.version()) < 3176:
    print(__package__ + " requires ST3 3176+")
else:
    import sys

    # clear modules cache if package is reloaded (after update?)
    prefix = __package__ + "."  # don't clear the base package
    for module_name in [
        module_name
        for module_name in sys.modules
        if module_name.startswith(prefix) and module_name != __name__
    ]:
        del sys.modules[module_name]
    prefix = None

    # import all published Commands and EventListeners
    from .plugins.check_justfile_build import CheckJustfileBuildCommand


class TouchPluginPyCommand(sublime_plugin.WindowCommand):
    def run(self):
        variables = self.window.extract_variables()
        path = Path(variables["file"])

        if path.suffix == ".py":
            plugin = Path(variables["project_path"]) / "plugin.py"
            plugin.touch()
