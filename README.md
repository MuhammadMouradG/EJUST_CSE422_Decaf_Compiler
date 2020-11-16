# EJUST CSE 422 - Programing Language and Compiler 

From: [MIT 6.035: Computer Language Engineering](http://6.035.scripts.mit.edu/fa18/index.html)

## Projects

- [x] Project 1: Scanner and Parser
- [ ] Project 2: Semantic Checker
- [ ] Project 3: Code Generator
- [ ] Project 4: Dataflow Analysis
- [ ] Project 5: Optimizer

## Environment

- Java
- ant
- antlr4

### Ubuntu

Assume basic components like `git` has been installed.

```bash
sudo apt install ant antlr4 openjdk-8-jdk
```

## Documentation
Look at [Scanner-Parser](https://github.com/MuhammadMouradG/EJUST_CSE422_Decaf_Compiler/blob/main/doc/Scanner-Parser.md)

## Usage

To install,

```bash
git clone "https://github.com/MuhammadMouradG/EJUST_CSE422_Decaf_Compiler.git"
```

To compile the compiler,

```bash
cd EJUST_CSE422_Decaf_Compiler
ant
```

To test all the testcases of one component, note that this command will indicate for each test case whether the test passed or failed.

```bash
# for scanner tests
ant test_scanner
# for scanner hidden tests
ant test_scanner_hidden
# for parser tests
ant test_parser
# for parser hidden tests
ant test_parser_hidden
```

To test a single testcase,

```bash
# for scanner
./run.sh --target=scan tests/scanner/input/char1
# for parser
./run.sh --target=parse test/parser/legal/legal-01
# to activate debug mode
./run.sh --target=scan --debug test/scanner/input/char1
```

## Reference

- Compilers: Principles, Techniques and Tools (Dragon book)
- <http://6.035.scripts.mit.edu/sp16/schedule.html>
- [ANTLR (Another Tool for Language Recognition)](https://www.antlr.org/)
- [ANTLR4 Manual](https://github.com/antlr/antlr4/blob/master/doc/index.md)
