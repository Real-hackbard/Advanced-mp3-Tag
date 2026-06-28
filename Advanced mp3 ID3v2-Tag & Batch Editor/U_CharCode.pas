
unit U_CharCode;
interface
uses
  SysUtils, Classes, Windows;
type
  {$IFNDEF UNICODE}
      UnicodeString = WideString;
  {$ENDIF}
  TCodePage = record
      Description: string;
      CodePage: Cardinal;
      Index: integer;
  end;
  TConvertOptions = record
      Greek    : TCodePage;
      Cyrillic : TCodePage;
      Hebrew   : TCodePage;
      Arabic   : TCodePage;
      Thai     : TCodePage;
      Korean   : TCodePage;
      Chinese  : TCodePage;
      Japanese : TCodePage;
      AlwaysWriteUnicode : Boolean;
      AutoDetectCodePage : Boolean;
  end;
const
    DefaultCharCode : TCodePage = (Description: 'System default'; CodePage: CP_ACP; Index: 0);
    GreekEncodings : Array[0..1] of TCodePage =
        ( (Description: 'MS Windows Greek'; CodePage: 1253; Index:0),
          (Description: 'IBM PC Greek'    ; CodePage: 727 ; Index:1));
    CyrillicEncodings : Array[0..2] of TCodePage =
        ( (Description: 'MS Windows Cyrillic'; CodePage: 1251; Index:0),
          (Description: 'IBM PC Cyrillic'    ; CodePage: 855;  Index:1),
          (Description: 'ISO 8859-5 Latin/Cyrillic'; CodePage: 28595; Index:2));
    HebrewEncodings : Array[0..2] of TCodePage =
        ( (Description: 'MS Windows Hebrew';       CodePage: 1255;  Index:0),
          (Description: 'Hebrew (DOS)';            CodePage: 862;   Index:1),
          (Description: 'ISO 8859-8 Latin/Hebrew'; CodePage: 28598; Index:2));
    ArabicEncodings : Array[0..2] of TCodePage =
        ((Description: 'MS Windows Arabisch';       CodePage: 1256;  Index:0),
         (Description: 'Arabisch (DOS)';            CodePage: 720;   Index:1),
         (Description: 'ISO 8859-6 Latin/Arabisch'; CodePage: 28596; Index:2));
    ThaiEncodings : Array[0..0] of TCodePage =
        ((Description: 'MS Windows Thai'; CodePage: 874;   Index:0));
    ChineseEncodings : Array[0..1] of TCodePage =
        ( (Description: 'Traditional Chinese (Big5)'; CodePage: 950; Index:0 ),
          (Description: 'Simplified Chinese GBK'    ; CodePage: 936; Index:1));
    KoreanEncodings : Array[0..0] of TCodePage =
        ( (Description: 'MS Korean'; CodePage: 949;   Index:0));
    JapaneseEncodings : Array[0..0] of TCodePage =
        ( (Description: 'Japanese Shift-JIS'; CodePage: 932;   Index:0));
function GetCodepage(aFilename: UnicodeString; Options: TConvertOptions): TCodePage; overload;
function GetCodepage(aFilename: UnicodeString): TCodePage; overload;
implementation
function GetCodepage(aFilename: UnicodeString; Options: TConvertOptions): TCodePage;
var Greek, Cyrillic, Hebrew, Arabic, Thai, Korean, Chinese, Japanese: integer;
    i, max: integer;
begin
  Greek    := 0;  Cyrillic := 0;
  Hebrew   := 0;  Arabic   := 0;
  Thai     := 0;  Korean   := 0;
  Chinese  := 0;  Japanese := 0;
  for i:= 1 to length(aFilename) do
  begin
    case Longint(aFilename[i]) of
      $0384..$03CE : inc(Greek);
      $0401..$045F : inc(Cyrillic);
      $05D1..$05EA : inc(Hebrew);
      $061B..$0652 : inc(Arabic);
      $0E01..$0E5B : inc(Thai);
      $AC02..$CEFF : inc(Korean);       
      $3041..$30F6 : inc(Japanese);     
      $3105..$3129 : inc(Chinese);      
      $4E00..$9F67 : begin              
                        inc(Japanese);  
                        inc(Chinese);
                        inc(Korean);
                     end;
    end;
  end;
  result := DefaultCharCode;
  max := 0;
  if Greek > max then
  begin
    max := Greek  ;
    result := Options.Greek;
  end;
  if Cyrillic > max then
  begin
    max := Cyrillic  ;
    result := Options.Cyrillic;
  end;
  if Hebrew > max then
  begin
    max := Hebrew    ;
    result := Options.Hebrew;
  end;
  if Arabic > max then
  begin
    max := Arabic    ;
    result := Options.Arabic;
  end;
  if Thai > max then
  begin
    max := Thai      ;
    result := Options.Thai;
  end;
  if Korean > max then
  begin
    max := Korean    ;
    result := Options.Korean;
  end;
  if Japanese > max then
  begin
    max := Japanese  ;
    result := Options.Japanese;
  end;
  if (Chinese >= max) And (max>0) then  
  begin                                 
    result := Options.Chinese;
  end;
end;
function GetCodepage(aFilename: UnicodeString): TCodePage; overload;
var Greek, Cyrillic, Hebrew, Arabic, Thai, Korean, Chinese, Japanese: integer;
    i, max: integer;
begin
  Greek    := 0;  Cyrillic := 0;
  Hebrew   := 0;  Arabic   := 0;
  Thai     := 0;  Korean   := 0;
  Chinese  := 0;  Japanese := 0;
  for i:= 1 to length(aFilename) do
  begin
    case Longint(aFilename[i]) of
      $0384..$03CE : inc(Greek);
      $0401..$045F : inc(Cyrillic);
      $05D1..$05EA : inc(Hebrew);
      $061B..$0652 : inc(Arabic);
      $0E01..$0E5B : inc(Thai);
      $AC02..$CEFF : inc(Korean);
      $3041..$30F6 : inc(Japanese);
      $3105..$3129 : inc(Chinese);
      $4E00..$9F67 : begin
                        inc(Japanese);
                        inc(Chinese);
                        inc(Korean);
                     end;
    end;
  end;
  result := DefaultCharCode;
  max := 0;
  if Greek > max then
  begin
    max := Greek  ;
    result := GreekEncodings[0];
  end;
  if Cyrillic > max then
  begin
    max := Cyrillic  ;
    result := CyrillicEncodings[0];
  end;
  if Hebrew > max then
  begin
    max := Hebrew    ;
    result := HebrewEncodings[0];
  end;
  if Arabic > max then
  begin
    max := Arabic    ;
    result := ArabicEncodings[0];
  end;
  if Thai > max then
  begin
    max := Thai      ;
    result := ThaiEncodings[0];
  end;
  if Korean > max then
  begin
    max := Korean    ;
    result := KoreanEncodings[0];
  end;
  if Japanese > max then
  begin
    max := Japanese  ;
    result := JapaneseEncodings[0];
  end;
  if (Chinese >= max) And (max>0) then
  begin
    result := ChineseEncodings[0];
  end;
end;
end.



