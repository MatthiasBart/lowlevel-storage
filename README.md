# lowlevel-storage

This is the lowlevel-storage project.

# Development setup

## Prerequisites

| Tool | Version | Purpose |
|---|---|---|
| CMake | 3.20 or newer | Build system |
| Ninja | any | Build tool used by the developer presets |
| C++ compiler | with C++23 support | GCC, Clang, AppleClang or MSVC |
| Python with pip | 3.9 or newer | Installs the pinned clang-format, clang-tidy and codespell |
| cppcheck | latest | Static analysis, must be on the `PATH` |

CI uses the latest cppcheck release, currently 2.22. Older versions, such as
the one from apt, work but find fewer issues, so CI may report findings that a
local build does not.

On Windows, run all commands from an "x64 Native Tools Command Prompt" or an
"x64 Developer PowerShell", so that Ninja finds MSVC.

## Python tools

clang-format, clang-tidy and codespell are pinned in
[`requirements-dev.txt`](requirements-dev.txt), so everyone uses the same
versions as CI. Create a virtual environment in the project root and install
them into it:

```sh
python3 -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\Activate.ps1
pip install -r requirements-dev.txt
```

Activate the virtual environment in every new terminal before configuring or
building, because the build calls clang-tidy from the `PATH`.

## Configure, build and test

Choose the preset for your operating system: `dev-linux`, `dev-darwin` or
`dev-win64`. For example on macOS:

```sh
cmake --preset=dev-darwin
cmake --build --preset=dev-darwin
ctest --preset=dev-darwin
```

The developer presets build in Debug mode into `build/dev`, enable the tests
and run clang-tidy and cppcheck on every compiled file. cppcheck findings fail
the build. They also write `build/dev/compile_commands.json` for editor code
completion.

Some editors configure a project as soon as they open it and pick a preset on
their own. Make sure your editor uses the preset for your operating system.

## Developer targets

Run these with `cmake --build --preset=<preset> -t <target>`:

| Target | Purpose |
|---|---|
| `format-check` / `format-fix` | Checks or fixes the formatting with clang-format |
| `spell-check` / `spell-fix` | Checks or fixes spelling with codespell |
| `run-exe` | Builds and runs the executable |

# Building and installing

To build and install the project as a user, see the [BUILDING](BUILDING.md)
document.

# Contributing

See the [CONTRIBUTING](CONTRIBUTING.md) document.

# Licensing

<!--
Please go to https://choosealicense.com/licenses/ and choose a license that
fits your needs. The recommended license for a project of this type is the
GNU AGPLv3.
-->
