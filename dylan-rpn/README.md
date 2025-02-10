# Reverse polish calculator
An exercise on recursion.

From Wikipedia:

> Reverse Polish notation (RPN), also known as reverse Łukasiewicz notation, 
> Polish postfix notation or simply postfix notation, is a mathematical 
> notation in which operators follow their operands, in contrast to prefix or 
> Polish notation (PN), in which operators precede their operands. The 
> notation does not need any parentheses for as long as each operator has a 
> fixed number of operands. 

## Setup

  dylan update

  dylan build --all

## Tests

  _build/bin/dylan-rpn-test-suite

## Usage

  _build/bin/dylan-rpn-app 3 4 +