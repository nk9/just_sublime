import re
import shlex
import subprocess
from collections import Counter

import sublime_plugin


class CheckJustfileBuildCommand(sublime_plugin.WindowCommand):
    def run(self, **kwargs):
        # Creating the panel implicitly clears any previous contents
        self.panel = self.window.create_output_panel("check_justfile")
        self.window.run_command("show_panel", {"panel": "output.check_justfile"})

        # Get the list of variables known to build systems
        variables = self.window.extract_variables()

        # Is there a file path? There won't be if the file hasn't been saved yet.
        if "file" in variables:
            self.write(f"Checking {variables['file']}\n")

            try:
                args = shlex.split(kwargs["shell_cmd"])
                result = subprocess.run(args, capture_output=True)

                if result.returncode == 0:
                    self.write("File OK.")
                else:
                    self.format_output(result.stderr.decode())
            except subprocess.CalledProcessError as err:
                self.write("ERROR: " + err.output.decode())
            except Exception as e:
                print("Exception: ", e)
        else:
            self.write("ERROR: No file path found. You must save your file before checking it.")

    def format_output(self, text):
        # Use regex capture group to retain newlines
        lines = re.split("(\n)", text)

        if lines[0].startswith("error: "):
            # There is a syntax error that's preventing us from checking the file
            for line in lines:
                self.write(line)
        else:
            count = Counter([line[0] for line in lines if len(line)])
            self.write(f"Changes suggested: +{count['+']},-{count['-']} lines")

    def write(self, text):
        self.panel.run_command("append", {"characters": text})
