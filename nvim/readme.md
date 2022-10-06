Run `:checkhealth` to verify all statuses

Install Required Language using Tree-Sitter
Run `:TSInstallInfo` to list languages
Run `:TSInstall <lang>`

LSP
Run `:LspInstallInfo` then use key `i` to install the language server

Telescope Dependency
Run `:brew install ripgrep`
Run `:brew install python3`
Run `:python3 -m pip install --user --upgrade pynvim`

Java Format Config Value
+-------------------------------------+
|         JAVA ALIGNMENT VALUE        |
+-------------------------------------+
|               KEY           | VALUE |
+-------------------------------------+
| M_NO_ALIGNMENT              |    0  |
| M_FORCE                     |    1  |
| M_INDENT_ON_COLUMN          |    2  |
| M_INDENT_BY_ONE             |    4  |
| M_COMPACT_SPLIT             |   16  |
| M_COMPACT_FIRST_BREAK_SPLIT |   32  |
| M_ONE_PER_LINE_SPLIT        |   48  |
| M_NEXT_SHIFTED_SPLIT        |   64  |
| M_NEXT_PER_LINE_SPLIT       |   80  |
| SPLIT_MASK                  |  112  |
+-------------------------------------+
|         JAVA INDENT VALUE           |
+-------------------------------------+
| INDENT_DEFAULT              |    0  |
| INDENT_ON_COLUMN            |    1  |
| INDENT_BY_ONE               |    2  |
+-------------------------------------+

Java Project
Run `mvn dependency:resolve`
Run `mvn eclipse:eclipse`
