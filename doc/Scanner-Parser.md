# CSE 422 | Project 1 - Scanner and Parser

**Author:** _Muhammed Samir Saleh Mourad_

**ID**: 120170029

**E-mail:** *muhammed.mourad@ejust.edu.eg*

---

## Difficulties
The main problem that I encounter is augmented the test case which in sometimes does not match with current implementation of Decaf.
For example, we use `import` instead of `callout`. However, in general the implementation was simple. I used the same words and
keywords in the Decaf language handout. I also used the work of [JasonQSY](https://github.com/JasonQSY/6.035-compiler) as a guide.

## Known Problems
The file in `tests/parcer/legal/legal-20` fails becuase `!!!---true` token which I does not know how Decaf must deal with that token.
