//fpc 3.0.0

program Bublesorting;

const ARRAY_LENGTH = 1000;

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
    0: begin
        if a < b then begin
          swap(a, b); 
          Exit(True);
        end;
        Exit(False);
       end;
    1: begin
        if a > b then begin
          swap(a, b); 
          Exit(True);
        end;
        Exit(False);
       end;
  end;
end;

procedure show_array(var arr: array of integer; array_length: integer; showed_text: string);
var current_pos: integer;
begin
  Writeln(showed_text);
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
      arr[current_pos] := Random(max*2 + 1) + min
    else begin
      Writeln('Enter please value for ', current_pos, ' item');==
      Readln(arr[current_pos]);
    end;
  end;
  if debug then show_array(arr, array_length, 'array initialization');
end;

procedure bouble_sort(var arr: array of integer; array_length: integer; order_by: word);
var first_item_pos, second_item_pos: integer;
sorted: boolean;
begin
  for first_item_pos := 1 to array_length - 1  do begin
    sorted := true;
    for second_item_pos := first_item_pos + 1 to array_length do begin
      if compare_and_swap(arr[first_item_pos], arr[second_item_pos], order_by) then
        sorted := false;
    end;
    if sorted then break;
  end;
end;

var arr: Array[1..ARRAY_LENGTH] of integer;
begin
  initialize_array(arr, ARRAY_LENGTH, -5, 5, false, true);
  bouble_sort(arr, ARRAY_LENGTH, 1);
  show_array(arr, ARRAY_LENGTH, 'after booble sorting');
end.
