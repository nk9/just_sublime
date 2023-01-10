import re
import shlex
import subprocess

import sublime_plugin


class CheckJustfileBuildCommand(sublime_plugin.WindowCommand):
    def run(self, **kwargs):
        # Creating the panel implicitly clears any previous contents
        self.panel = self.window.create_output_panel("exec")
        self.window.run_command("show_panel", {"panel": "output.exec"})

        # Get the list of variables known to build systems
        variables = self.window.extract_variables()

        # Is there a file path? There won't be if the file hasn't been saved yet.
        if "file" in variables:
            self.write(f"Checking {variables['file']}\n")

            try:
                args = shlex.split(kwargs["shell_cmd"])
                result = subprocess.check_output(args)
                print(result)

                if result.returncode == 0:
                    self.write("File OK.")
                else:
                    self.write("returncode failed: {!r}".format(result.stderr))
            except subprocess.CalledProcessError as err:
                print("CalledProcessError print:", err.stderr)
                self.write("CalledProcessError: " + err.output.decode())
            except Exception as e:
                print("Exception: ", e)
        else:
            self.write(
                "ERROR: No file path found. You must save your file before checking it."
            )

        # kwargs = sublime.expand_variables(kwargs, variables)
        # super().run(**kwargs)

    def write(self, text):
        self.panel.run_command("append", {"characters": text})
