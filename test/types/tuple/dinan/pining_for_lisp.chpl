class NilClass { }

def Nil(): NilClass
  return nil;

def isNil(x): bool {
  if x.type == NilClass then
    return true;
  else
    return false;
}

def car(x: (?T1, ?T2)) var: T1 {
  return x(1);
}

def cdr(x: (?T1, ?T2)) var: T2 {
  return x(2);
}

def cons(x: ?T1, y: ?T2): (T1, T2) {
  return (x, y);
}
  
if isNil(cdr(cons(5, Nil()))) then
  writeln("isNil() test1 ok");
if !isNil(cdr(cons(Nil(), 5))) then
  writeln("isNil() test2 ok");
if !isNil(nil) then
  writeln("isNil() test3 ok");
  
var x = cons("Hello", " ");
var y = cons("World", "!");

writeln(car(x), cdr(x), car(y), cdr(y));

writeln(x, y);

writeln(cons("Hello", cons("World!", Nil())));

