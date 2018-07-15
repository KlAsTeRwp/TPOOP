program stack_test;
uses stack;

var my_stack: TStack;
  number, counter: integer;
  value: string;
begin
  Writeln('Enter number of stack items');
  Readln(number);
  for counter := 0 to number do begin
    Writeln('Enter value:');
    Readln(value);
    my_stack.push(value);
  end;
  Writeln('Stack size', my_stack.size);
  for counter := 0 to number do begin
    Writeln('item #', counter, ': ', my_stack.pop());
  end;
  Writeln('Stack size', my_stack.size);
end.
