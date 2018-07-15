program stack_test;
uses dllist;

var list: TDLList;
  number, counter: integer;
  value: string;
begin
  Writeln('Enter number of list items');
  Readln(number);
  for counter := 1 to number do begin
    Writeln('Enter value:');
    Readln(value);
    if counter mod 2 = 1 then
      list.push_front(value)
    else list.push_back(value);
    list.show();
  end;
  Writeln('Stack size: ', list.size);
  Writeln('First item: ', list.at(1));
  Writeln('Last item: ', list.at(number));
  Writeln('Middle item: ', list.at(number div 2));
  for counter := 1 to number do begin
    list.show();
    if counter mod 2 = 1 then 
      list.pop_front()
    else
      list.pop_back();
  end;
  Writeln('Stack size: ', list.size);
end.
