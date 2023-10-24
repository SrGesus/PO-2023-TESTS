# PO-2023-TESTS
Unit tests for PO project.


## Dependencies

- Makefile - You probably already have it

### On MacOS
If you want to run this on MacOS you will need to install GNU's diff command for this to work properly. I recommend using a package manager like brew:
```bash
brew install diffutils
```

## How to run
Clone the repo
```bash
git clone https://github.com/SrGesus/PO-2023-TESTS
```
Provide the file [config](config) with the necessary paths to the folder po-uilib is in and your project folder.

Followed by
```bash
make
```
If the output is too big use `make log` to log the output to a file. (You can also use `make log QUIET=true` to silence output in the terminal)

You can run a single or a group of tests. But you should run make clean first. E.g:
Running only the professor's tests
```bash
make clean tests/professor/*.in
```
Running one test:
```bash
make clean tests/Gesus/0-ADDRESS.in
```
Running a few tests:
```bash
make clean tests/Branquinho/test47.in tests/Gesus/0-ADDRESS.in
```
You can then check out the respective output, on the same folder with the extension `.outhyp` and the diff `.diff`.
