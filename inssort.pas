program InsertionSort;

const ARRAY_LENGTH=100;

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
      Writeln('Enter please value for ', current_pos, ' item');
      Readln(arr[current_pos]);
    end;
  end;
  if debug then show_array(arr, array_length, 'array initialization');
end;

procedure insertion_sort(var arr: array of integer; array_length: integer);
var key, current_key_pos, current_sorted_item_pos: integer;
begin
  for current_key_pos := 2 to array_length do begin
    key := arr[current_key_pos];
    current_sorted_item_pos := current_key_pos - 1;
    while (arr[current_sorted_item_pos] > key) and (current_sorted_item_pos > 0) do begin
      arr[current_sorted_item_pos + 1] := arr[current_sorted_item_pos];
      dec(current_sorted_item_pos);
    end;
    arr[current_sorted_item_pos + 1] := key;
  end;
end;

var arr: array[1..ARRAY_LENGTH] of integer;
begin
  initialize_array(arr, ARRAY_LENGTH, -100, 100, true, true);
  insertion_sort(arr, ARRAY_LENGTH);
  show_array(arr, ARRAY_LENGTH, 'after insertion sort');
end.
