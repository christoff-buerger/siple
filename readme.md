**Software:** _SiPLE_ (simple imperative programming language example)

**Public Git Repository:** https://github.com/christoff-buerger/siple

**Author:** Christoff Bürger (`christoff.buerger@gmail.com`)

# Synopsis

_SiPLE_ is a *s*imple *i*mperative *p*rogramming *l*anguage *e*xample designed as a compiler construction introduction. Its implementation is based on well-known metacompiler techniques, demonstrating the specification-driven generation of common compiler parts. It compromises a [_JFlex_](http://www.jflex.de)-based lexer (regular expressions), [_Beaver_](http://beaver.sourceforge.net)-based parser (LALR(1)-grammar) and [_JastAdd_](http://jastadd.org)-based semantic analyser and interpreter (reference attribute grammar).

_SiPLE_ supports:

 * integer, real and Boolean arithmetics
 * pointers (including pointers to procedures and pointers)
 * block-structured name space and nested procedures
 * lexically-scoped first-class functions (i.e., lexical closures)
 * while and if control-flow statements
 * automatic integer to real type coercions (e.g., when assigning an integer value to a variable of type real or when adding an integer to a real value)
 * save interpreter, that calmly terminates in the presence of errors

_SiPLE_ is strongly typed, such that a static type analysis can be performed. Its syntax is similar to _Pascal_ or _Oberon_. An example program is:
```
% Faculty
Procedure faculty(Var n:Integer):Integer Begin
	If n = 0 Then
		Return 1;
	Fi;
	Return n * faculty(n - 1);
End;

% Fibonacci numbers
Procedure fibonacci(Var n:Integer):Integer Begin
	Var result:Integer;
	If (n > 1) 
		Then result := fibonacci(n-1) + fibonacci(n-2);
	Else
		result := 1;
	Fi;
	Return result;
End;

% First read a truth value selecting either the faculty or the fibonacci function
% to execute. Afterwards read its argument and execute the selected function.
Procedure main() Begin
	Var selected:Procedure(Integer):Integer; % Pointer to procedure.
	Var selection:Boolean;
	Var n:Integer;
	Read selection;
	If selection Then % ...palying with pointers instead of just calling :)
		selected := faculty;
	Else
		selected := fibonacci;
	Fi;
	Read n;
	Write Call(selected: n);
End;
```

# License

This program and the accompanying materials are made available under the terms of the MIT license (X11 license) which accompanies this distribution (`./license.txt`).
