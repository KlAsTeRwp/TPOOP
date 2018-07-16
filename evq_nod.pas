program evq_nod;

function max(var a, b: longint): longint;
begin
  if a>b then Exit(a);
  Exit(b)
end;

function min(var a, b: longint): longint;
begin
  if a<b then Exit(a);
  Exit(b);
end;

function nod(a,b: longint): longint;
var temp: longint;
begin
  while (a mod b <> 0) and (a mod b <> 1) do begin
    temp := a mod b;
    a := b;
    b := temp;
  end;
  if a mod b = 1 then Exit(1);
  Exit(b);
end;

var a, b: longint;
begin
  Writeln('Enter first number');
  Readln(a);
  Writeln('Enter second number');
  Readln(b);
  Writeln('Nod of ', a,' and ', b, ' is: ', nod(max(a,b), min(a,b)));
end.
