program EnumArrayvsEnumSet;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type
  TEnum = (plough, foo, bar, wtf);

procedure Output(const aEnum: TEnum);
begin
  case aEnum of
    wtf: Writeln('wtf');
    plough: Writeln('plough');
    bar: Writeln('bar');
    foo: Writeln('foo');
    else Writeln('Missed one!');
  end;
end;

procedure TestEnumSet;
var
  enum: TEnum;
begin
  for enum in [wtf, plough, bar, foo]
  do Output(enum);
end;

procedure TestEnumArray;
var
  enum: TEnum;
  enumArray: TArray<TEnum>;
begin
  enumArray := [wtf, plough, bar, foo];
  for enum in enumArray
  do Output(enum);
end;

begin
  try
    try
      Writeln('Declared:   TEnum = (plough, foo, bar, wtf)');
      Writeln('Test order: [wtf, plough, bar, foo]');
      Writeln;

      Writeln('Looping an Enum Set');
      TestEnumSet;

      Writeln;
      Writeln('Looping an Enum Array');
      TestEnumArray;
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
  finally
    Writeln;
    Write('Press Enter:');
    Readln;
  end;
end.
