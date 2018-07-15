unit Stack;

interface

type
  TStackItem = record
    value: string;
    nextItem: ^TStackItem;
  end;
  TStack = object
    top: ^TStackItem;
    size: integer;
    procedure push(value: string);
    function pop: string;
  end;

implementation
  
  procedure TStack.push (value: string);
  var temp: ^TStackItem;
  begin
    if top = nil then begin
      new(top);
      top^.value := value;
    end
    else begin
      New(temp);
      temp^.value := value;
      temp^.nextItem := top;
      top := temp;
    end;
    Inc(size);
  end;

  function TStack.pop: string;
  var prev: ^TStackItem;
      result: string;
  begin
    result := '';
    if top <> nil then begin
      prev := top;
      result := prev^.value;
      top := prev^.nextItem;
      Dec(size);
      Freemem(prev, SizeOf(TStackItem));
    end;
    Exit(result);
  end;
end.
