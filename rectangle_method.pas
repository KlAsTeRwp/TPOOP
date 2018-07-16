program rm;

function Power(Base: Double; Expon: Double): Double;
var result: real;
begin
  result := Exp(Expon * Ln(Base));
  Exit(result);
end;

function func(x: real): real;
var result: real;
begin
  result := Power(x, 2)/(1+Power(x,6));
  Exit(result);
end;

function midle_rectangle_method(a, b: real; steps: integer): real;
var h: real;
    counter: integer;
    result: real;
begin
  result := 0.0;
  h := (a-b)/steps;
  for counter:=1 to steps do begin
    result := result + func(b + h*(counter-1) + h/2);
  end;
  result := h * result;
  Exit(result);
end;

var steps: integer;
begin
  Writeln('enter number of steps');
  Readln(steps);
  Writeln('result of integration: ', midle_rectangle_method(2,0,steps));
end.
