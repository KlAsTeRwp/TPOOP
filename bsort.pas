//fpc 3.0.0

program Bublesorting;

const ARRAY_LENGTH = 100;

procedure swap(var a, b: integer);
begin
  b := a xor b;
  a := b xor a;
  b := a xor b;
end;

//order_by
//0 - desc
//1 - asc
function compare_and_swap(var a, b: integer; order_by: word): boolean;
begin
  case (order_by) of
    0: if a < b then begin
      swap(a, b); 
      Exit(True);
    end
    else Exit(False);
    1: if a > b then begin
      swap(a, b); 
      Exit(True);
    end
    else Exit(False);
  end;
end;

procedure show_array(var arr: array of integer; array_length: integer);
var current_pos: integer;
begin
  for current_pos := 1 to array_length-1 do 
  Write(arr[current_pos], ', ');
  Writeln(arr[array_length]);
end;

procedure initialize_array(var arr: array of integer; array_length, min, max: integer; with_random, debug: boolean);
var current_pos: integer;
begin
  if with_random then Randomize;
  for current_pos := 1 to array_length do begin
    if with_random then
      arr[current_pos] := Random(max*2) + min
    else begin
      Writeln('Enter please value for ', current_pos+1, ' item');
      Readln(arr[current_pos]);
    end;
  end;
  if debug then 
  show_array(arr, array_length);
end;

procedure bouble_sort(var arr: array of integer; array_length: integer; order_by: word);
var first_item_pos, second_item_pos: integer;
sorted: boolean;
begin
  for first_item_pos := 1 to array_length - 1  do begin
    sorted := false;
    for second_item_pos := first_item_pos + 1 to array_length do begin
      sorted := compare_and_swap(arr[first_item_pos], arr[second_item_pos], order_by);
    end;
  //  if sorted then break;
  end;
end;

var arr: Array[1..ARRAY_LENGTH] of integer;
begin
  initialize_array(arr, ARRAY_LENGTH, -10, 10, true, true);
  writeln('after intialization');
  bouble_sort(arr, ARRAY_LENGTH, 1);
  writeln('after sorting');
  show_array(arr, ARRAY_LENGTH);
end.
