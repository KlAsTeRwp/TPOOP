program tm;

uses math;

function func(x: Double): Double;
var result: Double;
begin
  result := Power(x,2)/(1+Power(x,6));
  Exit(result);
end;

function trapezoid_method(a,b: Double; steps: longint): Double;
var h, result: Double;
    counter: longint;
begin
  result := 0.0;
  h := (a-b)/steps;
  for counter := 1 to steps-1 do begin
    result := result + func(b+h*counter);
  end;
  result := (2*result + func(b) + func(a))*h/2;
  Exit(result);
end;

var steps: longint;
begin
  Writeln('Enter number of steps:');
  Readln(steps);
  Writeln('Trapezoid method: ', trapezoid_method(2,0, steps));
end.
