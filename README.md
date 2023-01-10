# This Package is Just Sublime

Several tools to help you make the most of the [`just` command runner](https://just.systems). Requires Just version 1.10.0.

## Syntax Highlighting

The Sublime syntax was based on the one originally made by [TonioGela](https://github.com/TonioGela). It has been rewritten to be more expressive and support the latest `just` features. Conditional chaining, interpolation with expressions, recipe dependencies, nested expressions and groups — the syntax now supports it all!

<img
   srcset="assets/settings_variables.png, assets/settings_variables@2x.png 2x"
   src="assets/settings_variables.png"
   title="Settings and Variables"
   alt="Screenshot showing syntax highlighting for settings and variables"
   />

![interpolation](assets/interpolation.png)

Get instant feedback as you type when you’ve made a syntax error.

https://user-images.githubusercontent.com/3646730/208213239-83db789f-0ee6-4708-b9ed-a1ce14dcf14b.mp4

## Comments

Use the Sublime comment shortcut (<kbd>Cmd</kbd>+<kbd>/</kbd> to easily comment and uncomment lines.

https://user-images.githubusercontent.com/3646730/208213247-a31a9c4c-f656-4dd1-8109-e42b0a52ad20.mp4

## Check Your `just` Code

`just` contains a built-in formatter, which also checks your file for correctness. When you install this package, a `Check Justfile` Build System will appear in `Tools > Build System`. It will be available to the Automatic Build System when editing a `justfile`. You can run it with <kbd>Cmd</kbd>+<kbd>B</kbd> (macOS), and you'll see any changes and errors in the console. You can also find the Build System in the Goto Anything menu (<kbd>Cmd</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>).

https://user-images.githubusercontent.com/3646730/208213085-ab18099e-553e-4c80-946c-529ef950ced5.mp4

## Contributing

Learn how to edit the syntax in [CONTRIBUTING.md](CONTRIBUTING.md).
