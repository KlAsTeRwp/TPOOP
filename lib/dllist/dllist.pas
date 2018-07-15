unit dllist;

interface
type 
  TSLListItem = record
    value: string;
    prevItem, nextItem: ^TSLListItem;
  end;
  TDLList = object
    head, tail: ^TSLListItem;
    size: integer;
    constructor init(value: string);
    destructor destroy;
    procedure push_front(value: string);
    procedure push_back(value: string);
    //procedure insert(value: string);
    function pop_front: string;
    function pop_back: string;
    function at(pos: integer): string;
    procedure show;
  end;

implementation
  
  constructor TDLList.init(value: string);
  begin
    new(head);
    tail := head;
    head^.value := value;
    size := 1;
  end;

  destructor TDLList.destroy;
  begin
    while size <> 0 do pop_back();
  end;

  function TDLList.at(pos: integer): string;
  var currentPos: integer;
      currentItem: ^TSLListItem;
      result: string;
  begin
    currentPos := 1;
    result := '';
    if (size > 0) and (pos > 0) then begin
      currentItem := head;
      while currentPos < pos do begin
        currentItem := currentItem^.nextItem;
        Inc(currentPos);
      end;
      result := currentItem^.value;
    end;
    Exit(result);
  end;

  procedure TDLList.push_front(value: string);
  var temp: ^TSLListItem;
  begin
    if head = nil then init(value)
    else begin
      New(temp);
      temp^.value := value;
      temp^.nextItem := head;
      head^.prevItem := temp;
      head := temp;
      Inc(size);
    end;
  end;

  procedure TDLList.push_back(value: string);
  var temp: ^TSLListItem;
  begin
    if head = nil then init(value)
    else begin
      New(temp);
      temp^.value := value;
      temp^.prevItem := tail;
      tail^.nextItem := temp;
      tail := temp;
      Inc(size) end;
  end;

  function TDLList.pop_front: string;
  var result: string;
      temp: ^TSLListItem;
  begin
    result := '';
    if size > 1 then begin
      result := head^.value;
      temp := head;
      head := head^.nextItem;
      head^.prevItem := nil;
      Freemem(temp, SizeOf(TSLListItem));
    end
    else if size = 1 then begin
      result := head^.value;
      head^.value := '';
    end;
    Dec(size);
    Exit(result);
  end;

  function TDLList.pop_back: string;
  var result: string;
      temp: ^TSLListItem;
  begin
    result := '';
    if size > 1 then begin
      result := tail^.value;
      temp := tail;
      tail := tail^.prevItem;
      tail^.nextItem := nil;
      Freemem(temp, SizeOf(TSLListItem));
    end
    else if size = 1 then begin
      result := tail^.value;
      tail^.value := '';
    end;
    Dec(size);
    Exit(result);
  end;

  procedure TDLList.show;
  var currentItem: ^TSLListItem;
  begin
    currentItem := head;
    while currentItem <> nil do begin
      Write(currentItem^.value, ' ');
      currentItem := currentItem^.nextItem;
    end;
    Writeln();
  end;
end.
