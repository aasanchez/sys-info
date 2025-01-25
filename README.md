# Sys_info Package

[![Build-Deb](https://github.com/aasanchez/sys_info/actions/workflows/build-deb.yml/badge.svg?branch=master)](https://github.com/aasanchez/sys_info/actions/workflows/build-deb.yml)

A simple C program that displays system information and version details.

## Overview

This demo package contains a C program that prints:

- Version information
- Compilation date and time
- Current user
- Hostname
- Operating system details

## Building

To build the program, simply run:

```shell
gcc -o sys-info src/sys-info.c
```

The update script will:

1. Automatically increment the patch version
2. Update the version string in the source code
3. Compile the program
4. Create a Git tag with the new version

### Usage

After building, run the program:

```shell
sys-info
```

### Development

The project uses:

- C99 standard
- ANSI color codes for formatted output
- 2-space indentation (defined in .editorconfig)

To modify the version, the update script will handle this automatically. Manual
version updates can be made in `sys-info.c`.
