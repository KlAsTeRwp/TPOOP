program rm;

uses math;

function func(x: Double): Double;
var result: Double;
begin
  result := Power(x, 2)/(1+Power(x,6));
  Exit(result);
end;

function middle_rectangle_method(a, b: Double; steps: longint): Double;
var h: Double;
    counter: longint;
    result: Double;
begin
  result := 0.0;
  h := (a-b)/steps;
  for counter:=0 to steps-1 do begin
    result := result + func(b + h*counter + h/2);
  end;
  result := h * result;
  Exit(result);
end;

function left_rectangle_method(a, b: Double; steps: longint): Double;
var h: Double;
    counter: longint;
    result: Double;
begin
  result := 0.0;
  h := (a-b)/steps;
  for counter := 0 to steps-1 do begin
    result := result + func(b + h*counter);
  end;
  result := result * h;
  Exit(result)
end;

function right_rectangle_method(a, b: Double; steps: longint): Double;
var h: Double;
    counter: longint;
    result: Double;
begin
  result := 0.0;
  h := (a - b)/steps;
  for counter:=1 to steps do begin
    result := result + func(b + h*counter);
  end;
  result := result * h;
  Exit(result);
end;

var steps: longint;
begin
  Writeln('enter number of steps');
  Readln(steps);
  Writeln('middle rectangle method: ', middle_rectangle_method(2,0,steps));
  Writeln('left rectangle method: ', left_rectangle_method(2,0,steps));
  Writeln('right rectangle method: ', right_rectangle_method(2,0,steps));
end.
