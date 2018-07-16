program roots_newton;

function root(n, EPS: double): double;
var nx, result: Double;
begin
  result := 1;
  while TRUE do begin
    nx := (result + result/n)/2;
    if abs(result - nx) <= EPS then break;
    result := nx;
  end;
  Exit(result);
end;

var value, EPS: double;
begin
  Writeln('Enter value');
  Readln(value);
  Writeln('Enter EPS');
  Readln(EPS);
  Writeln('Root of ', value, ' is ', root(value, EPS));
end.
