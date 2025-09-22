
unit Mp3FileUtils;
{$I config.inc}
interface
uses
  SysUtils, Classes, Windows, Contnrs, dialogs, U_CharCode
  {$IFDEF USE_TNT_COMPOS}, TntSysUtils, TntClasses{$ENDIF}, Id3v2Frames;
type
  {$IFDEF USE_TNT_COMPOS}
      TMPFUFileStream = TTNTFileStream;
  {$ELSE}
      TMPFUFileStream = TFileStream;
  {$ENDIF}
  TBuffer = Array of byte;
  TMP3Error = (MP3ERR_None, MP3ERR_NoFile, MP3ERR_FOpenCrt, MP3ERR_FOpenR,
               MP3ERR_FOpenRW, MP3ERR_FOpenW, MP3ERR_SRead, MP3ERR_SWrite,
               ID3ERR_Cache, ID3ERR_NoTag, ID3ERR_Invalid_Header, ID3ERR_Compression,
               ID3ERR_Unclassified,
               MPEGERR_NoFrame );
  TID3Version = record
    Major: Byte;
    Minor: Byte;
  end;
  String4  = String[4];          
  String30 =  String[30];
  TID3v1Structure = record
    ID: array[1..3] of AnsiChar;               
    Title: Array [1..30] of AnsiChar;          
    Artist: Array [1..30] of AnsiChar;
    Album: Array [1..30] of AnsiChar;
    Year: array [1..4] of AnsiChar;
    Comment: Array [1..30] of AnsiChar;
    Genre: Byte;
  end;
  TID3v1Tag = class(TObject)
  private
    FTitle: String30;
    FArtist: String30;
    FAlbum: String30;
    FComment: String30;
    FTrack: Byte;
    FYear: String4;
    FGenre: Byte;
    FExists: Boolean;
    FVersion: Byte;
    fAutoCorrectCodepage: Boolean;
    FCharCode: TCodePage;
    function GetConvertedUnicodeText(Value: String30): UnicodeString;
    function GetTitle: UnicodeString;
    function GetArtist: UnicodeString;
    function GetAlbum: UnicodeString;
    function GetComment: UnicodeString;
    function GetGenre: String;  
    function GetTrack: String;  
    function GetYear: String4;
    function SetString30(value: UnicodeString): String30;
    procedure SetTitle(Value: UnicodeString);
    procedure SetArtist(Value: UnicodeString);
    procedure SetAlbum(Value: UnicodeString);
    procedure SetGenre(Value: String);         
    procedure SetYear(Value: String4);
    procedure SetComment(Value: UnicodeString);
    procedure SetTrack(Value: String);        
  public
    constructor Create;
    destructor Destroy; override;
    property TagExists: Boolean read FExists;
    property Exists:    Boolean read FExists;
    property Version: Byte read FVersion;
    property Title: UnicodeString read GetTitle write SetTitle;
    property Artist: UnicodeString read GetArtist write SetArtist;
    property Album: UnicodeString read GetAlbum write SetAlbum;
    property Genre: String read GetGenre write SetGenre;     
    property Track: String read GetTrack write SetTrack;     
    property Year: String4 read GetYear write SetYear;
    property Comment: UnicodeString read GetComment write SetComment;
    property CharCode: TCodePage read FCharCode write FCharCode;
    property AutoCorrectCodepage: Boolean read FAutoCorrectCodepage write FAutoCorrectCodepage;
    procedure Clear;
    function ReadFromStream(Stream: TStream): TMP3Error;
    function WriteToStream(Stream: TStream): TMP3Error;
    function RemoveFromStream(Stream: TStream): TMP3Error;
    function ReadFromFile(Filename: UnicodeString): TMP3Error;        
    function WriteToFile(Filename: UnicodeString): TMP3Error;
    function RemoveFromFile(Filename: UnicodeString): TMP3Error;
  end;
  TInt28 = array[0..3] of Byte;   
  TID3v2Header = record
    ID: array[1..3] of AnsiChar;
    Version: Byte;
    Revision: Byte;
    Flags: Byte;
    TagSize: TInt28;
  end;
  TID3v2Tag = class(TObject)
  private
    Frames: TObjectList;
    fExists: Boolean;
    fVersion: TID3Version;
    fFlgUnsynch: Boolean;
    fFlgCompression: Boolean;
    fFlgExtended: Boolean;
    fFlgExperimental: Boolean;
    fFlgFooterPresent: Boolean;
    fFlgUnknown: Boolean;
    fPaddingSize: LongWord;
    fTagSize: LongWord;
    fDataSize: LongWord;
    fUsePadding: Boolean;
    fUseClusteredPadding: Boolean;
    fFilename: UnicodeString;
    fAlwaysWriteUnicode: Boolean;
    fAutoCorrectCodepage: Boolean;
    fCharCode: TCodePage;
    function GetFrameIDString(ID:TFrameIDs):AnsiString;
    function GetFrameIndex(ID:TFrameIDs):integer;
    function GetUserTextFrameIndex(aDescription: UnicodeString): integer;
    function GetDescribedTextFrameIndex(ID:TFrameIDs; Language:AnsiString; Description:UnicodeString): Integer;
    function GetPictureFrameIndex(aDescription: UnicodeString): Integer;
    function GetUserDefinedURLFrameIndex(Description: UnicodeString): Integer;
    function GetPopularimaterFrameIndex(aEMail: AnsiString):integer;
    function GetPrivateFrameIndex(aOwnerID: AnsiString): Integer;
    function GetDescribedTextFrame(ID:TFrameIDs; Language:AnsiString; Description: UnicodeString): UnicodeString;
    procedure SetDescribedTextFrame(ID:TFrameIDs; Language:AnsiString; Description: UnicodeString; Value: UnicodeString);
    function ReadFrames(From: LongInt; Stream: TStream): TMP3Error;
    function ReadHeader(Stream: TStream): TMP3Error;
    procedure SyncStream(Source, Target: TStream);
    function GetTitle: UnicodeString;
    function GetArtist: UnicodeString;
    function GetAlbum: UnicodeString;
    function ParseID3v2Genre(value: UnicodeString): UnicodeString;
    function GetGenre: UnicodeString;
    function GetTrack: UnicodeString;
    function GetYear: UnicodeString;
    function GetStandardComment: UnicodeString;
    function GetStandardLyrics: UnicodeString;
    function GetComposer: UnicodeString;
    function GetOriginalArtist: UnicodeString;
    function GetCopyright: UnicodeString;
    function GetEncodedBy: UnicodeString;
    function GetLanguages: UnicodeString;
    function GetSoftwareSettings: UnicodeString;
    function GetMediatype: UnicodeString;
    function Getid3Length: UnicodeString;
    function GetPublisher: UnicodeString;
    function GetOriginalFilename: UnicodeString;
    function GetOriginalLyricist: UnicodeString;
    function GetOriginalReleaseYear: UnicodeString;
    function GetOriginalAlbumTitel: UnicodeString;
    procedure SetTitle(Value: UnicodeString);
    procedure SetArtist(Value: UnicodeString);
    procedure SetAlbum(Value: UnicodeString);
    function BuildID3v2Genre(value: UnicodeString): UnicodeString;
    procedure SetGenre(Value: UnicodeString);
    procedure SetTrack(Value: UnicodeString);
    procedure SetYear(Value: UnicodeString);
    procedure SetStandardComment(Value: UnicodeString);
    procedure SetStandardLyrics(Value: UnicodeString);
    procedure SetComposer(Value: UnicodeString);
    procedure SetOriginalArtist(Value: UnicodeString);
    procedure SetCopyright(Value: UnicodeString);
    procedure SetEncodedBy(Value: UnicodeString);
    procedure SetLanguages(Value: UnicodeString);
    procedure SetSoftwareSettings(Value: UnicodeString);
    procedure SetMediatype(Value: UnicodeString);
    procedure Setid3Length(Value: UnicodeString);
    procedure SetPublisher(Value: UnicodeString);
    procedure SetOriginalFilename(Value: UnicodeString);
    procedure SetOriginalLyricist(Value: UnicodeString);
    procedure SetOriginalReleaseYear(Value: UnicodeString);
    procedure SetOriginalAlbumTitel(Value: UnicodeString);
    function GetStandardUserDefinedURL: AnsiString;
    procedure SetStandardUserDefinedURL(Value: AnsiString);
    function GetArbitraryRating: Byte;
    procedure SetArbitraryRating(Value: Byte);
    function GetArbitraryPersonalPlayCounter: Cardinal;
    procedure SetArbitraryPersonalPlayCounter(Value: Cardinal);
    procedure SetCharCode(Value: TCodePage);
    procedure SetAutoCorrectCodepage(Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    property Title:   UnicodeString read GetTitle  write SetTitle;
    property Artist:  UnicodeString read GetArtist write SetArtist;
    property Album:   UnicodeString read GetAlbum  write SetAlbum;
    property Genre:   UnicodeString read GetGenre  write SetGenre;
    property Track:   UnicodeString read GetTrack  write SetTrack;
    property Year:    UnicodeString read GetYear   write SetYear;
    property Comment: UnicodeString read GetStandardComment write SetStandardComment;
    property Lyrics : UnicodeString read GetStandardLyrics write SetStandardLyrics;
    property URL: AnsiString read GetStandardUserDefinedURL write SetStandardUserDefinedURL;
    property Rating: Byte read GetArbitraryRating write SetArbitraryRating;
    property PlayCounter: Cardinal read GetArbitraryPersonalPlayCounter write SetArbitraryPersonalPlayCounter;
    property Composer:         UnicodeString read  GetComposer           write  SetComposer        ;
    property OriginalArtist:   UnicodeString read  GetOriginalArtist     write  SetOriginalArtist  ;
    property Copyright:        UnicodeString read  GetCopyright          write  SetCopyright       ;
    property EncodedBy:        UnicodeString read  GetEncodedBy          write  SetEncodedBy       ;
    property Languages:        UnicodeString read  GetLanguages          write  SetLanguages       ;
    property SoftwareSettings: UnicodeString read  GetSoftwareSettings   write  SetSoftwareSettings;
    property Mediatype:        UnicodeString read  GetMediatype          write  SetMediatype       ;
    property id3Length:           UnicodeString read  Getid3Length           write Setid3Length          ;
    property Publisher:           UnicodeString read  GetPublisher           write SetPublisher          ;
    property OriginalFilename:    UnicodeString read  GetOriginalFilename    write SetOriginalFilename   ;
    property OriginalLyricist:    UnicodeString read  GetOriginalLyricist    write SetOriginalLyricist   ;
    property OriginalReleaseYear: UnicodeString read  GetOriginalReleaseYear write SetOriginalReleaseYear;
    property OriginalAlbumTitel:  UnicodeString read  GetOriginalAlbumTitel  write SetOriginalAlbumTitel ;
    property FlgUnsynch       : Boolean read fFlgUnsynch write fFlgUnsynch;
    property FlgCompression   : Boolean read fFlgCompression;
    property FlgExtended      : Boolean read fFlgExtended;
    property FlgExperimental  : Boolean read fFlgExperimental;
    property FlgFooterPresent : Boolean read fFlgFooterPresent;
    property FlgUnknown       : Boolean read fFlgUnknown;
    property Size:       LongWord    read fTagSize;
    property Exists:     Boolean     read fExists;      
    property TagExists:  Boolean     read fExists;      
    property Padding:    Longword    read fPaddingSize; 
    property PaddingSize:Longword    read fPaddingSize; 
    property Version:    TID3Version read fVersion;
    property UsePadding: Boolean     read fUsePadding write fUsePadding;
    property UseClusteredPadding: Boolean read fUseClusteredPadding write fUseClusteredPadding;
    property  AlwaysWriteUnicode: Boolean read fAlwaysWriteUnicode write fAlwaysWriteUnicode;
    property CharCode: TCodePage read fCharCode write SetCharCode;
    property  AutoCorrectCodepage: Boolean read fAutoCorrectCodepage write SetAutoCorrectCodepage;
    function ReadFromStream(Stream: TStream): TMP3Error;
    function WriteToStream(Stream: TStream): TMP3Error;
    function RemoveFromStream(Stream: TStream): TMP3Error;
    function ReadFromFile(Filename: UnicodeString): TMP3Error;
    function WriteToFile(Filename: UnicodeString): TMP3Error;
    function RemoveFromFile(Filename: UnicodeString): TMP3Error;
    procedure Clear;
    function GetText(FrameID: TFrameIDs): UnicodeString;
    procedure SetText(FrameID:TFrameIDs; Value: UnicodeString);
    function GetUserText(Description: UnicodeString): UnicodeString;
    procedure SetUserText(Description, Value: UnicodeString);
    function GetURL(FrameID: TFrameIDs): AnsiString;
    procedure SetURL(FrameID:TFrameIDs; Value: AnsiString);
    procedure SetExtendedComment(Language: AnsiString; Description: UnicodeString; value: UnicodeString);
    function GetExtendedComment(Language: AnsiString; Description: UnicodeString): UnicodeString;
    procedure SetLyrics(Language: AnsiString; Description: UnicodeString; value: UnicodeString);
    function GetLyrics(Language: AnsiString; Description: UnicodeString): UnicodeString;
    function GetPicture(stream: TStream; Description: UnicodeString): AnsiString; 
    procedure SetPicture(MimeTyp: AnsiString; PicType: Byte; Description: UnicodeString; stream: TStream);
    function GetUserDefinedURL(Description: UnicodeString): AnsiString;
    procedure SetUserDefinedURL(Description: UnicodeString; Value: AnsiString);
    function GetRating(aEMail: AnsiString): Byte;
    function GetPersonalPlayCounter(aEMail: AnsiString): Cardinal;
    procedure SetRatingAndCounter(aEMail: AnsiString; aRating: Integer ; aCounter: Integer);
    function GetPrivateFrame(aOwnerID: AnsiString; Content: TStream): Boolean;
    procedure SetPrivateFrame(aOwnerID: AnsiString; Content: TStream);
    function GetAllFrames: TObjectlist;
    function GetAllTextFrames: TObjectlist;
    function GetAllUserTextFrames: TObjectlist;
    function GetAllCommentFrames: TObjectlist;
    function GetAllLyricFrames: TObjectlist;
    function GetAllUserDefinedURLFrames: TObjectlist;
    function GetAllPictureFrames: TObjectlist;
    function GetAllPopularimeterFrames: TObjectlist;
    function GetAllURLFrames: TObjectlist;
    function GetAllPrivateFrames: TObjectList;
    function ValidNewCommentFrame(Language: AnsiString; Description: UnicodeString): Boolean;
    function ValidNewLyricFrame(Language: AnsiString; Description: UnicodeString): Boolean;
    function ValidNewPictureFrame(Description: UnicodeString): Boolean;
    function ValidNewUserDefUrlFrame(Description: UnicodeString): Boolean;
    function ValidNewPopularimeterFrame(EMail: AnsiString): Boolean;
    function GetAllowedTextFrames: TList;
    function GetAllowedURLFrames: TList; 
    function AddFrame(aID: TFrameIDs): TID3v2Frame;
    procedure DeleteFrame(aFrame: TID3v2Frame);
  end;
  TMpegHeader = record
    version: byte;
    layer: byte;
    protection: boolean;
    bitrate: LongInt;
    samplerate: LongInt;
    channelmode: byte;
    extension: byte;
    copyright: boolean;
    original: boolean;
    emphasis: byte;
    padding: boolean;
    framelength: word;
    valid: boolean;
  end;
  TXingHeader = record
    Frames: integer;
    Size: integer;
    valid: boolean;
  end;
  TVBRIHeader = TXingHeader;
  TMpegInfo = class(TObject)
  Private
    FFilesize: int64;
    Fversion:integer;
    Flayer:integer;
    Fprotection:boolean;
    Fbitrate:word;
    Fsamplerate:integer;
    Fchannelmode:byte;
    Fextension:byte;
    Fcopyright:boolean;
    Foriginal:boolean;
    Femphasis:byte;
    Fframes:Integer;
    Fdauer:Longint;
    Fvbr:boolean;
    Fvalid: boolean;
    FfirstHeaderPosition: int64;
    function GetValidatedHeader(aBuffer: TBuffer; position: integer): TMpegHeader;
    function GetXingHeader(aMpegheader: TMpegHeader; aBuffer: TBuffer; position: integer ): TXingHeader;
    function GetVBRIHeader(aMpegheader: TMpegHeader; aBuffer: TBuffer; position: integer ): TVBRIHeader;
    function GetFramelength(version:byte;layer:byte;bitrate:integer;Samplerate:integer;padding:boolean):integer;
  public
    constructor create;
    function LoadFromStream(stream: tStream): TMP3Error;
    function LoadFromFile(FileName: UnicodeString): TMP3Error;
    property Filesize: int64          read   FFilesize;
    property Version: integer         read   Fversion;
    property Layer: integer           read   Flayer;
    property Protection: boolean      read   Fprotection;
    property Bitrate: word            read   Fbitrate;
    property Samplerate: integer      read   Fsamplerate;
    property Channelmode: byte        read   Fchannelmode;
    property Extension: byte          read   Fextension;
    property Copyright: boolean       read   Fcopyright;
    property Original: boolean        read   Foriginal;
    property Emphasis: byte           read   Femphasis;
    property Frames: Integer          read   Fframes;
    property Dauer: Longint           read   Fdauer;
    property Duration: Longint        read   Fdauer; 
    property Vbr: boolean             read   Fvbr;
    property Valid: boolean           read   Fvalid;
    property FirstHeaderPosition: int64 read   FfirstHeaderPosition;
  end;
  function IsValidV2TrackString(value:string):boolean;
  function IsValidV1TrackString(value:string):boolean;
  function IsValidYearString(value:string):boolean;
  function GetTrackFromV2TrackString(value: string): Byte;
const
 MPEG_BIT_RATES : array[1..3] of array[1..3] of array[0..15] of word =
    (((0,32,64,96,128,160,192,224,256,288,320,352,384,416,448,0),
    (0,32,48,56, 64, 80, 96,112,128,160,192,224,256,320,384,0),
    (0,32,40,48, 56, 64, 80, 96,112,128,160,192,224,256,320,0)),
    ((0,32,48, 56, 64, 80, 96,112,128,144,160,176,192,224,256,0),
    (0, 8,16,24, 32, 40, 48, 56, 64, 80, 96, 112,128,144,160,0),
    (0, 8,16,24, 32, 40, 48, 56, 64, 80, 96, 112,128,144,160,0)),
    ((0,32,48, 56, 64, 80, 96,112,128,144,160,176,192,224,256,0),
    (0, 8,16,24, 32, 40, 48, 56, 64, 80, 96, 112,128,144,160,0),
    (0, 8,16,24, 32, 40, 48, 56, 64, 80, 96, 112,128,144,160,0)));
  sample_rates: array[1..3] of array [0..3] of word=
    ((44100,48000,32000,0),
    (22050,24000,16000,0),
    (11025,12000,8000,0));
  channel_modes:array[0..3] of string=('Stereo','Joint stereo','Dual channel (Stereo)','Single channel (Mono)');
  extensions:array[1..3] of array [0..3] of string=
    (('bands 4 to 31','bands 8 to 32','bands 12 to 31','bands 16 to 31'),
     ('bands 4 to 31','bands 8 to 32','bands 12 to 31','bands 16 to 31'),
     ('IS:off, MS:off','IS:on, MS:off','IS:off, MS:on','IS:on, MS:on'));
  emphasis_values: array[0..3] of string = ('None', '50/15ms','reserved','CCIT J.17');
  {$Message Hint 'You should change the default rating description for your projects'}
var
  DefaultRatingDescription: AnsiString = 'Mp3ileUtils, www.gausi.de';
var
  Genres: TStringList;
  LanguageCodes: TStringlist;
  LanguageNames: TStringlist;
implementation
{$IFNDEF USE_TNT_COMPOS}
function  WideFileExists(aString: string):boolean;
begin
  result := FileExists(aString);
end;
function WideExtractFileDrive(aString: String): string;
begin
  result := ExtractFileDrive(aString);
end;
{$ENDIF}
function ValidFrame(ID: AnsiString): Boolean;
var
  i: Cardinal;
begin
  result := true;
  for i := 1 to length(ID) do
    if not (ID[i] in ['0'..'9', 'A'..'Z']) then
    begin
      result := false;
      Break;
    end;
end;
function ValidTextFrame(ID: AnsiString): Boolean;
begin
  result := (length(ID) >= 3) and (ID[1] = 'T');
end;
function Int28ToInt32(Value: TInt28): LongWord;
begin
  result := (Value[3]) shl  0 or
            (Value[2]) shl  7 or
            (Value[1]) shl 14 or
            (Value[0]) shl 21;
end;
function Int32ToInt28(Value: LongWord): TInt28;
begin
  Result[3] := (Value shr  0) and $7F;
  Result[2] := (Value shr  7) and $7F;
  Result[1] := (Value shr 14) and $7F;
  Result[0] := (Value shr 21) and $7F;
end;
function GetTempFile: String;
var
  Path: String;
  i: Integer;
begin
  SetLength(Path, 256);
  FillChar(PChar(Path)^, 256 * sizeOf(Char), 0);
  GetTempPath(256, PChar(Path));
  Path := Trim(Path);
  if Path[Length(Path)] <> '\' then
    Path := Path + '\';
  i := 0;
  repeat
    result := Path + 'TagTemp.t' + IntToHex(i, 2);
    inc(i);
  until not FileExists(result);
end;
function GetID3v1Version(Tag: TID3v1Structure): Byte;
begin
  if (Tag.Comment[29] = #00) and (Tag.Comment[30] <> #00) then
    result := 1
  else
    result := 0;
end;
function IsValidV2TrackString(value:string):boolean;
var
  del: Integer;
  Track, Overall: String;
begin
  del := Pos('/', Value);       
  if del = 0 then
    result := (StrToIntDef(Value, -1) > -1)
  else begin
    Overall := Trim(Copy(Value, del + 1, Length(Value) - (del)));
    Track := Trim(Copy(Value, 1, del - 1));
    result := ((StrToIntDef(Track, -1) > -1) AND (StrToIntDef(Overall, -1) > -1))
  end;
end;
function IsValidV1TrackString(value:string):boolean;
begin
  result := (StrToIntDef(Value, -1) > -1);
end;
function IsValidYearString(value:string):boolean;
var tmp:integer;
begin
  tmp := StrToIntDef(Value, -1);
  result := (tmp > -1) AND (tmp < 10000);
end;
function GetTrackFromV2TrackString(value: string): Byte;
var
  del: Integer;
  Track: String;
begin
  del := Pos('/', Value);       
  if del = 0 then
    result := StrToIntDef(Value, 0)
  else begin
    Track := Trim(Copy(Value, 1, del - 1));
    result := StrToIntDef(Track, 0);
  end;
end;
function GetPaddingSize(DataSize: Int64; aFilename: UnicodeString; UseClusterSize: Boolean): Cardinal;
var
   Drive: string;
   ClusterSize           : Cardinal;
   SectorPerCluster      : Cardinal;
   BytesPerSector        : Cardinal;
   NumberOfFreeClusters  : Cardinal;
   TotalNumberOfClusters : Cardinal;
begin
  Drive := WideExtractFileDrive(aFileName);
  if UseClusterSize and (trim(Drive) <> '')then
  begin
      if Drive[Length(Drive)]<>'\' then Drive := Drive+'\';
      try
          if GetDiskFreeSpace(PChar(Drive),
                              SectorPerCluster,
                              BytesPerSector,
                              NumberOfFreeClusters,
                              TotalNumberOfClusters) then
            ClusterSize := SectorPerCluster * BytesPerSector
          else
            ClusterSize := 2048;
      except
        ClusterSize := 2048;
      end;
  end else
    ClusterSize := 2048;
  Result := (((DataSize DIV ClusterSize) + 1) * Clustersize) - DataSize;
end;
constructor TID3v1Tag.Create;
begin
  inherited Create;
  Clear;
  FCharCode := DefaultCharCode;
  AutoCorrectCodepage := False;
end;
destructor TID3v1Tag.destroy;
begin
  inherited destroy;
end;
function TID3v1Tag.ReadFromStream(Stream: TStream): TMP3Error;
var
  RawTag: TID3v1Structure;
begin
  clear;
  result := MP3ERR_None;
  FExists := False;
  try
    Stream.Seek(-128, soFromEnd);
    if (Stream.Read(RawTag, 128) = 128) then
      if (RawTag.ID = 'TAG') then
      begin
        FExists := True;
        FVersion := GetID3v1Version(RawTag);
        FTitle := (RawTag.Title);
        FArtist := (RawTag.Artist);
        FAlbum := (RawTag.Album);
        FYear := (RawTag.Year);
        if FVersion = 0 then
        begin
          FComment := (RawTag.Comment);
          FTrack := 0;
        end
        else
        begin
          Move(RawTag.Comment[1], FComment[1], 28);
          FComment[29] := #0;
          FComment[30] := #0;
          FTrack := Ord(RawTag.Comment[30]);
        end;
        FGenre := RawTag.Genre;
      end
      else
        result := ID3ERR_NoTag
    else
      result := MP3ERR_SRead;
  except
    on E: Exception do
    begin
      result := ID3ERR_Unclassified;
      MessageBox(0, PChar(E.Message), PChar('Error'), MB_OK or MB_ICONERROR or MB_TASKMODAL or MB_SETFOREGROUND);
    end;
  end;
end;
function TID3v1Tag.WriteToStream(Stream: TStream): TMP3Error;
var
  RawTag: TID3v1Structure;
  Buffer: Array [1..3] of AnsiChar;
begin
  result := MP3ERR_NONE;
  try
    FillChar(RawTag, 128, 0);
    RawTag.ID := 'TAG';
    Move(FTitle[1], RawTag.Title, Length(FTitle));
    Move(FArtist[1], RawTag.Artist, Length(FArtist));
    Move(FAlbum[1], RawTag.Album, Length(FAlbum));
    Move(FYear[1], RawTag.Year, Length(FYear));
    Move(FComment[1], RawTag.Comment, Length(FComment));
    if FTrack > 0 then
    begin
      RawTag.Comment[29] := #0;
      RawTag.Comment[30] := AnsiChar(Chr(FTrack));
    end;
    RawTag.Genre := FGenre;
    Stream.Seek(-128, soFromEnd);
    Stream.Read(Buffer[1], 3);
    if (Buffer[1]='T') AND (Buffer[2]='A') AND (Buffer[3]='G') then
      Stream.Seek(-128, soFromEnd)
    else
      Stream.Seek(0, soFromEnd);
    if Stream.Write(RawTag, 128) <> 128 then
      result := MP3ERR_SWrite;
  except
    on E: Exception do
    begin
      result := ID3ERR_Unclassified;
      MessageBox(0, PChar(E.Message), PChar('Error'), MB_OK or MB_ICONERROR or MB_TASKMODAL or MB_SETFOREGROUND);
    end;
  end;
end;
function TID3v1Tag.RemoveFromStream(Stream: TStream): TMP3Error;
var
  Buffer: Array [1..3] of AnsiChar;
begin
  result := MP3ERR_NONE;
  try
    Stream.Seek(-128, soFromEnd);
    Stream.Read(Buffer[1], 3);
    if (Buffer[1]='T') AND (Buffer[2]='A') AND (Buffer[3]='G') then
    begin
      Stream.Seek(-128, soFromEnd);
      SetStreamEnd(Stream);
    end
    else
      result := ID3ERR_NoTag;
  except
    on E: Exception do
    begin
      result := ID3ERR_Unclassified;
      MessageBox(0, PChar(E.Message), PChar('Error'), MB_OK or MB_ICONERROR or MB_TASKMODAL or MB_SETFOREGROUND);
    end;
  end;
end;
procedure TID3v1Tag.Clear;
begin
  FTitle   := String30(StringOfChar(#0, 30));
  FArtist  := String30(StringOfChar(#0, 30));
  FAlbum   := String30(StringOfChar(#0, 30));
  FYear    := String4(StringOfChar(#0, 4));
  FComment := String30(StringOfChar(#0, 30));
  FTrack   := 0;
  FGenre   := 0;
  FVersion := 0;
  FExists  := False;
end;
function TID3v1Tag.ReadFromFile(Filename: UnicodeString): TMP3Error;
var
  Stream: TMPFUFileStream;
begin
  if WideFileExists(Filename) then
    try
      Stream := TMPFUFileStream.Create(Filename, fmOpenRead or fmShareDenyWrite);
      try
        result := ReadFromStream(Stream);
      finally
        Stream.Free;
      end;
    except
      result := MP3ERR_FOpenR;
    end
  else
    result := MP3ERR_NoFile;
end;
function TID3v1Tag.WriteToFile(Filename: UnicodeString): TMP3Error;
var
  Stream: TMPFUFileStream;
begin
  if WideFileExists(Filename) then
    try
      Stream := TMPFUFileStream.Create(Filename, fmOpenReadWrite or fmShareDenyWrite);
      try
        result := WriteToStream(Stream);
      finally
        Stream.Free;
      end;
    except
      result := MP3ERR_FOpenRW;
    end
  else
    result := MP3ERR_NoFile;
end;
function TID3v1Tag.RemoveFromFile(Filename: UnicodeString): TMP3Error;
var
  Stream: TMPFUFileStream;
begin
  if WideFileExists(Filename) then
    try
      Stream := TMPFUFileStream.Create(Filename, fmOpenReadWrite or fmShareDenyWrite);
      try
        result := RemoveFromStream(Stream);
      finally
        Stream.Free;
      end;
    except
      result := MP3ERR_FOpenRW;
    end
  else
    result := MP3ERR_NoFile;
end;
function TID3v1Tag.GetConvertedUnicodeText(Value: String30): UnicodeString;
var
  tmp: AnsiString;
  L: Integer;
begin
    if AutoCorrectCodepage then
    begin
        L := MultiByteToWideChar(FCharCode.CodePage,
                  MB_PRECOMPOSED,  
                  @Value[1],       
                  Length(Value),   
                  nil,             
                  0);              
        if L = 0 then
        begin
            setlength(tmp, 30);
            move(Value[1], tmp[1], 30);
            {$IFDEF UNICODE}
                result := trim(String(tmp));
            {$ELSE}
                result := trim(tmp);
            {$ENDIF}
        end else
        begin
            SetLength(Result, L);
            MultiByteToWideChar(FCharCode.CodePage,
                      MB_PRECOMPOSED,
                      @Value[1],
                      length(Value),
                      @Result[1],
                      L);
            result := Trim(Result);
        end;
    end
    else
    begin
      setlength(tmp,30);
      move(Value[1], tmp[1], 30);
      {$IFDEF UNICODE}
          result := trim(String(tmp));
      {$ELSE}
          result := trim(tmp);
      {$ENDIF}
    end;
end;
function TID3v1Tag.GetTitle: UnicodeString;
begin
  result := GetConvertedUnicodeText(FTitle);
end;
function TID3v1Tag.GetArtist: UnicodeString;
begin
  result := GetConvertedUnicodeText(FArtist);
end;
function TID3v1Tag.GetAlbum: UnicodeString;
begin
  result := GetConvertedUnicodeText(FAlbum);
end;
function TID3v1Tag.GetComment: UnicodeString;
begin
  result := GetConvertedUnicodeText(FComment);
end;
function TID3v1Tag.GetGenre: String;
begin
  if FGenre <= 125 then
    result := Genres[FGenre]
  else
    result := '';
end;
function TID3v1Tag.GetTrack: String;
begin
  result := IntToStr(FTrack);
end;
function TID3v1Tag.GetYear: String4;
begin
  result := FYear;
end;
function TID3v1Tag.SetString30(value: UnicodeString): String30;
var i, max, L: integer;
    tmpstr: AnsiString;
begin
    result := String30(StringOfChar(#0, 30));
    if fAutoCorrectCodepage then
    begin
        if length(value) > 0 then
        begin
            L := WideCharToMultiByte(FCharCode.CodePage, 
                  0, 
                  @Value[1],      
                  -1,
                  Nil,     
                  0,       
                  Nil,  
                  Nil);  
            if L = 0 then
            begin
                tmpstr := AnsiString(value);
                max := length(tmpstr);
                if max > 30 then max := 30;
                for i := 1 to max do
                    result[i] := tmpstr[i];
            end
            else
            begin
                SetLength(tmpstr, L);
                WideCharToMultiByte(FCharCode.CodePage, 
                      0, 
                      @Value[1],      
                      -1, 
                      @tmpstr[1],     
                      L,             
                      Nil,  
                      Nil);  
                result := String30(tmpstr);
            end;
        end;
    end else
    begin
        tmpstr := AnsiString(value);
        max := length(tmpstr);
        if max > 30 then max := 30;
        for i := 1 to max do
            result[i] := tmpstr[i];
    end;
end;
procedure TID3v1Tag.SetTitle(Value: UnicodeString);
begin
  FTitle := SetString30(Value);
end;
procedure TID3v1Tag.SetArtist(Value: UnicodeString);
begin
  FArtist := SetString30(Value);
end;
procedure TID3v1Tag.SetAlbum(Value: UnicodeString);
begin
  FAlbum := SetString30(Value);
end;
procedure TID3v1Tag.SetGenre(Value: String);
var
  i: integer;
begin
  i := Genres.IndexOf(Value);
  if i in [0..125] then
    FGenre := i
  else
    FGenre := 255; 
end;
procedure TID3v1Tag.SetYear(Value: String4);
begin
  FYear := Value;
end;
procedure TID3v1Tag.SetComment(Value: UnicodeString);
begin
  FComment := SetString30(Value);
end;
procedure TID3v1Tag.SetTrack(Value : String);
begin
  FTrack := StrToIntDef(Value, 0);
end;
constructor TID3v2Tag.Create;
begin
  inherited Create;
  Frames := TObjectList.Create(True);
  FUseClusteredPadding := True;
  AlwaysWriteUnicode := False;
  FCharCode := DefaultCharCode;
  AutoCorrectCodepage := False;
  FVersion.Major := 3;
  FVersion.Minor := 0;
  FExists := False;
  FTagSize := 0;
  fPaddingSize := 0;
  fFlgUnsynch       := False;
  fFlgCompression   := False;
  fFlgExtended      := False;
  fFlgExperimental  := False;
  fFlgFooterPresent := False;
  fFlgUnknown       := False;
end;
Destructor TID3v2tag.Destroy;
begin
  Frames.Free;
  inherited destroy;
end;
function TID3v2Tag.GetFrameIDString(ID:TFrameIDs):AnsiString;
begin
  case fVersion.Major of
    2: result := ID3v2KnownFrames[ID].IDs[FV_2];
    3: result := ID3v2KnownFrames[ID].IDs[FV_3];
    4: result := ID3v2KnownFrames[ID].IDs[FV_4];
    else result := '';
  end;
end;
function TID3v2Tag.GetFrameIndex(ID:TFrameIDs):integer;
var i:integer;
    IDstr: AnsiString; 
begin
  result := -1;
  idstr := GetFrameIDString(ID);
  for i := 0 to Frames.Count - 1 do
  begin
      if (Frames[i] as TID3v2Frame).FrameIDString = IDstr then
      begin
          result := i;
          break;
      end;
  end;
end;
function TID3v2Tag.GetUserTextFrameIndex(aDescription: UnicodeString): integer;
var i: Integer;
    iDescription: UnicodeString;
begin
    result := -1;
    for i := 0 to Frames.Count - 1 do
    begin
        if (TID3v2Frame(Frames[i]).FrameType = FT_UserTextFrame) then
        begin
            TID3v2Frame(Frames[i]).GetUserText(iDescription);
            If aDescription = iDescription then
            begin
                result := i;
                break;
            end;
        end;
    end;
end;
function TID3v2Tag.GetDescribedTextFrameIndex(ID:TFrameIDs; Language:AnsiString; Description: UnicodeString): Integer;
var i:integer;
  IDstr: AnsiString;
  iLanguage: AnsiString;
  iDescription: UnicodeString;
  check: Boolean;
begin
  result := -1;
  idstr := GetFrameIDString(ID);
  for i := 0 to Frames.Count - 1 do
  begin
      if (Frames[i] as TID3v2Frame).FrameIDString = IDstr then
      begin
          (Frames[i] as TID3v2Frame).GetCommentsLyrics(iLanguage, iDescription);
          check := False;
          if ((Language = '*') OR (Language = '')) or (Language = iLanguage) then
              Check := True;
          If Check and ((Description = '*') or (Description = iDescription)) then
          begin
              result := i;
              break;
          end;
      end;
  end;
end;
function TID3v2Tag.GetPictureFrameIndex(aDescription: UnicodeString): Integer;
var mime, idstr: AnsiString;
  i: integer;
  PictureData : TMemoryStream;
  desc: UnicodeString;
  picTyp: Byte;
begin
  result := -1;
  idstr := GetFrameIDString(IDv2_PICTURE);
  for i := 0 to Frames.Count - 1 do
    if (Frames[i] as TID3v2Frame).FrameIDString = IDstr then
    begin
        PictureData := TMemoryStream.Create;
        (Frames[i] as TID3v2Frame).GetPicture(Mime, PicTyp, Desc, PictureData);
        PictureData.Free;
        if (aDescription = Desc) or (aDescription = '*') then
        begin
            result := i;
            break;
        end;
    end;
end;
function TID3v2Tag.GetUserDefinedURLFrameIndex(Description: UnicodeString): Integer;
var i: Integer;
  IDstr: AnsiString;
  iDescription: UnicodeString;
begin
  result := -1;
  idstr := GetFrameIDString(IDv2_USERDEFINEDURL);
  for i := 0 to Frames.Count - 1 do
  begin
      if (Frames[i] as TID3v2Frame).FrameIDString = IDstr then
      begin
          (Frames[i] as TID3v2Frame).GetUserdefinedURL(iDescription);
          If Description = iDescription then
          begin
              result := i;
              break;
          end;
      end;
  end;
end;
function TID3v2Tag.GetPopularimaterFrameIndex(aEMail: AnsiString):integer;
var idstr, iEMail: AnsiString;
    i: Integer;
begin
    result := -1;
    idstr := GetFrameIDString(IDv2_RATING);
    for i := 0 to Frames.Count - 1 do
        if (Frames[i] as TID3v2Frame).FrameIDString = IDstr then
        begin
            (Frames[i] as TID3v2Frame).GetRating(iEMail);
            if (aEMail = iEMail) or (aEMail = '*') then
            begin
                result := i;
                break;
            end;
        end;
end;
function TID3v2Tag.GetPrivateFrameIndex(aOwnerID: AnsiString): Integer;
var i: Integer;
    idStr, iOwner: AnsiString;
    dummyStream: TStream;
begin
    result := -1;
    idstr := GetFrameIDString(IDv2_Private);
    for i := 0 to Frames.Count - 1 do
        if (Frames[i] as TID3v2Frame).FrameIDString = IDstr then
        begin
            dummyStream := TMemoryStream.Create;
            try
                (Frames[i] as TID3v2Frame).GetPrivateFrame(iOwner, dummyStream);
            finally
                dummyStream.Free;
            end;
            if (aOwnerID = iOwner) then
            begin
                result := i;
                break;
            end;
        end;
end;
function TID3v2Tag.ReadHeader(Stream: TStream): TMP3Error;
var
  RawHeader: TID3v2Header;
  ExtendedHeader: Array[0..3] of byte;
  ExtendedHeaderSize: Integer;
begin
  result := MP3ERR_None;
  try
    Stream.Seek(0, soFromBeginning);
    Stream.ReadBuffer(RawHeader, 10);
    if RawHeader.ID = 'ID3' then
      if RawHeader.Version in  [2,3,4] then
      begin
        FTagSize := Int28ToInt32(RawHeader.TagSize) + 10;
        FExists := True;
        case RawHeader.Version of
            2: begin
                FFlgUnsynch := (RawHeader.Flags and 128) = 128;
                fFlgCompression := (RawHeader.Flags and 64) = 64;
                fFlgUnknown := (RawHeader.Flags and 63) <> 0;
                FFlgExtended := False;
                FFlgExperimental := False;
                if fFlgCompression then
                  result := ID3ERR_Compression;
                FFlgFooterPresent := False;
            end;
            3: begin
                FFlgUnsynch := (RawHeader.Flags and 128) = 128;
                FFlgExtended := (RawHeader.Flags and 64) = 64;
                FFlgExperimental := (RawHeader.Flags and 32) = 32;
                fFlgUnknown := (RawHeader.Flags and 31) <> 0;
                fFlgCompression := False;
                FFlgFooterPresent := False;
            end;
            4: begin
                FFlgUnsynch := (RawHeader.Flags and 128) = 128;
                FFlgExtended := (RawHeader.Flags and 64) = 64;
                FFlgExperimental := (RawHeader.Flags and 32) = 32;
                fFlgCompression := False;
                FFlgFooterPresent := (RawHeader.Flags and 16) = 16;
                fFlgUnknown := (RawHeader.Flags and 15) <> 0;                
                if FFlgFooterPresent then
                  FTagSize := FTagSize + 10;
            end;
        end;
        FVersion.Major := RawHeader.Version;
        FVersion.Minor := RawHeader.Revision;
        if FFlgExtended then
        begin
            Stream.ReadBuffer(ExtendedHeader[0], 4); 
            if fversion.Major =4 then
              ExtendedHeaderSize := 2097152 * ExtendedHeader[0]
                + 16384 * ExtendedHeader[1]
                + 128 * ExtendedHeader[2]
                + ExtendedHeader[3]
            else
              ExtendedHeaderSize := 16777216 * ExtendedHeader[0]
                + 65536 * ExtendedHeader[1]
                + 256 * ExtendedHeader[2]
                + ExtendedHeader[3];
            Stream.Seek(ExtendedHeaderSize, soFromCurrent);
        end;
      end
      else
          result := ID3ERR_Invalid_Header
    else
        result := ID3ERR_NoTag;
  except
    on EReadError do result := MP3ERR_SRead;
    on E: Exception do
    begin
      result := ID3ERR_Unclassified;
      MessageBox(0, PChar(E.Message), PChar('Error'), MB_OK or MB_ICONERROR or MB_TASKMODAL or MB_SETFOREGROUND);
    end;
  end;
end;
function TID3v2Tag.ReadFrames(From: LongInt; Stream: TStream): TMP3Error;
var FrameIDstr: AnsiString;
    newFrame: TID3v2Frame;
begin
  result := MP3ERR_None;
  FUsePadding := False;
  try
    case fVersion.Major of
      2 : Setlength(FrameIDstr,3)
      else Setlength(FrameIDstr,4);
    end;
    if Stream.Position <> From then
      Stream.Position := From;
    Frames.Clear;
    while (Stream.Position < (FTagSize - fPaddingSize))
                                       and (Stream.Position < Stream.Size) do
    begin
      Stream.Read(FrameIDStr[1], length(FrameIDStr));
      if ValidFrame(FrameIDstr) then
      begin
        newFrame := TID3v2Frame.Create(FrameIDstr, TID3v2FrameVersions(FVersion.Major));
        newFrame.ReadFromStream(Stream);
        NewFrame.AlwaysWriteUnicode := fAlwaysWriteUnicode;
        newFrame.CharCode := fCharCode;
        NewFrame.AutoCorrectCodepage := fAutoCorrectCodepage;
        Frames.Add(newFrame);
      end else
      begin
        fPaddingSize := FTagSize - (Stream.Position - length(FrameIDStr));
        FUsePadding := True;
        Break;
      end;
    end;
  except
    on EReadError do result := MP3ERR_SRead;
    on E: Exception do
    begin
      result := ID3ERR_Unclassified;
      MessageBox(0, PChar(E.Message), PChar('Error'), MB_OK or MB_ICONERROR or MB_TASKMODAL or MB_SETFOREGROUND);
    end;
  end;
end;
procedure TID3v2Tag.SyncStream(Source, Target: TStream);
var buf: TBuffer;
    i, last: Int64;
begin
    if FTagSize = 0 then exit; 
    setlength(buf, FTagSize);
    Source.Read(buf[0], FTagSize);
    Target.Size := FTagSize;
    i := 0;
    last := 0;
    while i <= length(buf)-1 do
    begin
        While (i < length(buf)-2) and ((buf[i] <> $FF) or (buf[i+1] <> $00)) do
            inc(i);
        Target.Write(buf[last], i - last + 1);
        last := i + 2;
        inc(i, 2);   
    end;
    if last <= length(buf)-1 then
        Target.Write(buf[last], length(buf) - last);
    SetStreamEnd(Target);
end;
function TID3v2Tag.ReadFromStream(Stream: TStream): TMP3Error;
var SyncedStream: TMemoryStream;
begin
  clear;
  result := ReadHeader(Stream);
  if (FExists) and (result = MP3ERR_None) then
  begin
      if (Version.Major <> 4) and (FFlgUnsynch) then
      begin
          SyncedStream := TMemoryStream.Create;
          try
              SyncStream(Stream, SyncedStream);
              SyncedStream.Position := 0;
              result := ReadFrames(SyncedStream.Position, SyncedStream);
          finally
              SyncedStream.Free;
          end;
      end else
      begin
          SyncedStream := TMemoryStream.Create;
          try
              SyncedStream.CopyFrom(Stream, fTagSize - Stream.Position);
              SyncedStream.Position := 0;
              result := ReadFrames(SyncedStream.Position, SyncedStream)
          finally
              SyncedStream.Free;
          end;
      end;
  end;
end;
function TID3v2Tag.WriteToStream(Stream: TStream): TMP3Error;
var
  aHeader: TID3v2Header;
  TmpStream, ID3v2Stream: TMPFUFileStream;
  TmpName, FrameName: String;  
  v1Tag: String[3];
  v1AdditionalPadding: Cardinal;
  Buffer: TBuffer;
  CacheAudio: Boolean;
  i: Integer;
  AudioDataSize: int64;
  tmpFrameStream: TMemoryStream;
  ExistingID3Tag: TID3v2Tag;
begin
  result := MP3ERR_None;
  AudioDataSize := 0;
  v1AdditionalPadding := 0;
  if Frames.Count = 0 then
    Title := ' ';
  FrameName := GetTempFile;
  try
    ID3v2Stream := TMPFUFileStream.Create(FrameName, fmCreate or fmShareDenyWrite);
    try
      aHeader.ID := 'ID3';
      aHeader.Version := fVersion.Major;
      aHeader.Revision := fVersion.Minor;
      for i:=0 to 3 do
          aHeader.TagSize[i] := 0;
      if fFlgUnsynch then
      begin
          aHeader.Flags := $80;
          ID3v2Stream.WriteBuffer(aHeader,10);
          case fversion.Major of
              2,3: begin
                  tmpFrameStream := TMemoryStream.Create;
                  for i := 0 to Frames.Count - 1 do
                      (Frames[i] as TID3v2Frame).WriteToStream(tmpFrameStream);
                  tmpFrameStream.Position := 0;
                  UnSyncStream(tmpFrameStream, ID3v2Stream);
                  tmpFrameStream.Free;
              end ;
              4: begin
                  for i := 0 to Frames.Count - 1 do
                      (Frames[i] as TID3v2Frame).WriteUnsyncedToStream(ID3v2Stream);
              end;
           end;
      end else
      begin
          aHeader.Flags := $00;
          ID3v2Stream.WriteBuffer(aHeader,10);
          for i := 0 to Frames.Count - 1 do
              (Frames[i] as TID3v2Frame).WriteToStream(ID3v2Stream);
      end;
      if ID3v2Stream.Size > 0 then
      begin
          ExistingID3Tag := TID3v2Tag.Create;
          ExistingID3Tag.ReadHeader(Stream);
          Stream.Seek(ExistingID3Tag.FTagSize, soFromBeginning);
          if FUsePadding and (ExistingID3Tag.FTagSize > (ID3v2Stream.Size + 30)) then
              CacheAudio := False
          else
              CacheAudio := True;
          if CacheAudio then
          begin
            TmpName := GetTempFile;
            try
                TmpStream := TMPFUFileStream.Create(TmpName, fmCreate or fmShareDenyWrite);
                TmpStream.Seek(0, soFromBeginning);
                AudioDataSize := Stream.Size - Stream.Position;
                if TmpStream.CopyFrom(Stream, Stream.Size - Stream.Position) <> AudioDataSize then
                begin
                    TmpStream.Free;
                    result := ID3ERR_Cache;
                    Exit;
                end;
                Stream.Seek(-128, soFromEnd);
                v1Tag := '   ';
                if (Stream.Read(v1Tag[1], 3) = 3) then
                begin
                  if (v1Tag = 'TAG') then
                    v1AdditionalPadding := 0
                  else
                    v1AdditionalPadding := 128;
                end;
                TmpStream.Free;
              except
                result := ID3ERR_Cache;
                Exit;
              end;
          end;
          FDataSize := ID3v2Stream.Size;
          if FUsePadding then
          begin
              if CacheAudio then
              begin
                  fPaddingSize := GetPaddingSize(AudioDataSize + FDataSize + v1AdditionalPadding, FFilename, FUseClusteredPadding);
                  FTagSize := FDataSize + fPaddingSize;
              end
              else begin
                  fPaddingSize := ExistingID3Tag.FTagSize - FDataSize;
                  FTagSize := ExistingID3Tag.FTagSize;
              end;
          end else
          begin
              fPaddingSize := 0;
              FTagSize := FDataSize;
          end;
          aHeader.TagSize := Int32ToInt28(FTagSize - 10);
          ID3v2Stream.Seek(0, soFromBeginning);
          ID3v2Stream.WriteBuffer(aHeader,10);
          Stream.Seek(0, soFromBeginning);
          ID3v2Stream.Seek(0, soFromBeginning);
          Stream.CopyFrom(ID3v2Stream, ID3v2Stream.Size);
          if fPaddingSize > 0 then
          begin
              setlength(Buffer, fPaddingSize);
              FillChar(Buffer[0], fPaddingSize, 0);
              Stream.Write(Buffer[0], fPaddingSize);
          end;
          if CacheAudio then
          begin
            try
              TmpStream := TMPFUFileStream.Create(TmpName, fmOpenRead);
              try
                TmpStream.Seek(0, soFromBeginning);
                Stream.CopyFrom(TmpStream, TmpStream.Size);
                SetStreamEnd(Stream);
              finally
                TmpStream.Free;
              end;
            except
              result := MP3ERR_FOpenR;
              Exit;
            end;
          end;
          DeleteFile(PChar(TmpName));
          ExistingID3Tag.Free;
      end;  
    finally
      ID3v2Stream.Free;
      DeleteFile(PChar(FrameName));
    end;
  except
    on EFCreateError do result := MP3ERR_FopenCRT;
    on EWriteError do result := MP3ERR_SWrite;
    on E: Exception do
    begin
      result := ID3ERR_Unclassified;
      MessageBox(0, PChar(E.Message), PChar('Error Error'), MB_OK or MB_ICONERROR or MB_TASKMODAL or MB_SETFOREGROUND);
    end;
  end;
end;
function TID3v2Tag.RemoveFromStream(Stream: TStream): TMP3Error;
var
  TmpStream: TMPFUFileStream;
  TmpName: String;     
  tmpsize: int64;
  ExistingID3Tag: TID3v2Tag;
begin
  result := MP3ERR_None;
  try
      ExistingID3Tag := TID3v2Tag.Create;
      ExistingID3Tag.ReadHeader(Stream);
      if ExistingID3Tag.FExists then
      begin
          Stream.Seek(ExistingID3Tag.FTagSize, soFromBeginning);
          TmpName := GetTempFile;
          try
              TmpStream := TMPFUFileStream.Create(TmpName, fmCreate);
              try
                  TmpStream.Seek(0, soFromBeginning);
                  tmpsize := Stream.Size - Stream.Position;
                  if TmpStream.CopyFrom(Stream, Stream.Size - Stream.Position) <> tmpsize then
                  begin
                      TmpStream.Free;
                      ExistingID3Tag.Free;
                      result := ID3ERR_Cache;
                      Exit;
                  end;
                  Stream.Seek(-ExistingID3Tag.FTagSize, soFromEnd);
                  SetStreamEnd(Stream);
                  ExistingID3Tag.Free;
                  Stream.Seek(0, soFromBeginning);
                  TmpStream.Seek(0, soFromBeginning);
                  if Stream.CopyFrom(TmpStream, TmpStream.Size) <> TmpStream.Size then
                  begin
                      TmpStream.Free;
                      ExistingID3Tag.Free;
                      result := ID3ERR_Cache;
                      Exit;
                  end;
              except
                  on EWriteError do result := MP3ERR_SWrite;
                  on E: Exception do
                  begin
                      result := ID3ERR_Unclassified;
                      MessageBox(0, PChar(E.Message), PChar('Error'), MB_OK or MB_ICONERROR or MB_TASKMODAL or MB_SETFOREGROUND);
                  end;
              end;
              TmpStream.Free;
              DeleteFile(PChar(TmpName));
          except
              on EFOpenError do result := MP3ERR_FOpenCRT;
              on E: Exception do
              begin
                  result := ID3ERR_Unclassified;
                  MessageBox(0, PChar(E.Message), PChar('Error'), MB_OK or MB_ICONERROR or MB_TASKMODAL or MB_SETFOREGROUND);
              end;
          end;
      end
      else
      begin
          ExistingID3Tag.Free;
          result := ID3ERR_NoTag;
      end;
  except
      on E: Exception do
      begin
          result := ID3ERR_Unclassified;
          MessageBox(0, PChar(E.Message), PChar('Error'), MB_OK or MB_ICONERROR or MB_TASKMODAL or MB_SETFOREGROUND);
      end;
  end;
end;
function TID3v2Tag.ReadFromFile(Filename: UnicodeString): TMP3Error;
var Stream: TMPFUFileStream;
begin
  if WideFileExists(Filename) then
    try
      FFilename := Filename;
      Stream := TMPFUFileStream.Create(Filename, fmOpenRead or fmShareDenyWrite);
      try
        result := ReadFromStream(Stream);
      finally
        Stream.Free;
      end;
    except
      result := MP3ERR_FOpenR;
    end
  else
    result := MP3ERR_NoFile;
end;
function TID3v2Tag.WriteToFile(Filename: UnicodeString): TMP3Error;
var Stream: TMPFUFileStream;
begin
  if WideFileExists(Filename) then
    try
      FFilename := Filename;
      Stream := TMPFUFileStream.Create(Filename, fmOpenReadWrite or fmShareDenyWrite);
      try
        result := WriteToStream(Stream);
      finally
        Stream.Free;
      end;
    except
      result := MP3ERR_FOpenRW;
    end
  else
    result := MP3ERR_NoFile;
end;
function TID3v2Tag.RemoveFromFile(Filename: UnicodeString): TMP3Error;
var Stream: TMPFUFileStream;
begin
  if WideFileExists(Filename) then
    try
      FFilename := Filename;
      Stream := TMPFUFileStream.Create(Filename, fmOpenReadWrite or fmShareDenyWrite);
      try
        result := RemoveFromStream(Stream);
      finally
        Stream.Free;
      end;
    except
      result := MP3ERR_FOpenRW;
    end
  else
    result := MP3ERR_NoFile;
end;
procedure TID3v2Tag.Clear;
begin
  FVersion.Major := 3;
  FVersion.Minor := 0;
  FTagSize := 0;
  FDataSize :=0;
  fPaddingSize := 0;
  FExists := False;
  FUsePadding := True;
  fFlgUnsynch       := False;
  fFlgCompression   := False;
  fFlgExtended      := False;
  fFlgExperimental  := False;
  fFlgFooterPresent := False;
  fFlgUnknown       := False;
  FUseClusteredPadding := True;
  Frames.Clear;
end;
function TID3v2Tag.GetText(FrameID: TFrameIDs): UnicodeString;
var i:integer;
begin
  i := GetFrameIndex(FrameID);
  if i > -1 then
    result := (Frames[i] as TID3v2Frame).GetText
  else
    result := '';
end;
procedure TID3v2Tag.SetText(FrameID:TFrameIDs; Value: UnicodeString);
var i:integer;
  idStr: AnsiString;
  NewFrame: TID3v2Frame;
begin
  idStr := GetFrameIDString(FrameID);
  if not ValidTextFrame(iDStr) then exit;
  i := GetFrameIndex(FrameID);
  if i > -1 then
  begin
      if value = '' then
          Frames.Delete(i)
      else
          (Frames[i] as TID3v2Frame).SetText(Value);
  end
  else
      if value <> '' then
      begin
          NewFrame := TID3v2Frame.Create(idStr, TID3v2FrameVersions(FVersion.Major));
          NewFrame.AlwaysWriteUnicode := fAlwaysWriteUnicode;
          newFrame.CharCode := fCharCode;
          NewFrame.AutoCorrectCodepage := fAutoCorrectCodepage;
          Frames.Add(newFrame);
          newFrame.SetText(Value);
      end;
end;
function TID3v2Tag.GetURL(FrameID: TFrameIDs): AnsiString;
var i:integer;
begin
  i := GetFrameIndex(FrameID);
  if i > -1 then
    result := (Frames[i] as TID3v2Frame).GetURL
  else
    result := '';
end;
procedure TID3v2Tag.SetURL(FrameID:TFrameIDs; Value: AnsiString);
var i:integer;
  idStr: AnsiString;
  NewFrame: TID3v2Frame;
begin
  idStr := GetFrameIDString(FrameID);
  if not ValidFrame(iDStr) then exit;
  i := GetFrameIndex(FrameID);
  if i > -1 then
  begin
      if value = '' then
          Frames.Delete(i)
      else
          (Frames[i] as TID3v2Frame).SetURL(Value);
  end
  else
      if value <> '' then
      begin
          NewFrame := TID3v2Frame.Create(idStr, TID3v2FrameVersions(FVersion.Major));
          NewFrame.AlwaysWriteUnicode := fAlwaysWriteUnicode;
          newFrame.CharCode := fCharCode;
          NewFrame.AutoCorrectCodepage := fAutoCorrectCodepage;
          Frames.Add(newFrame);
          newFrame.SetURL(Value);
      end;
end;
function TID3v2Tag.GetUserText(Description: UnicodeString): UnicodeString;
var i: integer;
    DummyDescription: UnicodeString;
begin
    i := GetUserTextFrameIndex(Description);
    if i > -1 then
        result := TID3v2Frame(Frames[i]).GetUserText(DummyDescription)
    else
        result := '';
end;
procedure TID3v2Tag.SetUserText(Description, Value: UnicodeString);
var i: Integer;
    NewFrame: TID3v2Frame;
    idStr: AnsiString;
begin
    i := GetUserTextFrameIndex(Description);
    if i > -1 then
    begin
        if value = '' then
            Frames.Delete(i)
        else
            (Frames[i] as TID3v2Frame).SetUserText(Description, value);
    end
    else
    begin
        if value <> '' then
        begin
            idStr := GetFrameIDString(IDv2_USERDEFINEDTEXT); 
            NewFrame := TID3v2Frame.Create(idStr, TID3v2FrameVersions(FVersion.Major));
            NewFrame.AlwaysWriteUnicode := fAlwaysWriteUnicode;
            NewFrame.CharCode := fCharCode;
            NewFrame.AutoCorrectCodepage := fAutoCorrectCodepage;
            Frames.Add(NewFrame);
            NewFrame.SetUserText(Description, value);
        end;
    end;
end;
function TID3v2Tag.GetDescribedTextFrame(ID: TFrameIDs; Language: AnsiString; Description: UnicodeString): UnicodeString;
var i: integer;
    DummyLanguage: AnsiString;
    DummyDescription: UnicodeString;
begin
  i := GetDescribedTextFrameIndex(ID,Language,Description);
  if i > -1 then
      result := (Frames[i] as TID3v2Frame).GetCommentsLyrics(DummyLanguage,DummyDescription)
  else
      result:='';
end;
procedure TID3v2Tag.SetDescribedTextFrame(ID:TFrameIDs; Language: AnsiString; Description: UnicodeString; Value: UnicodeString);
var i:integer;
    idstr: AnsiString;
    NewFrame: TID3v2Frame;
begin
  idStr := GetFrameIDString(ID);
  if not ValidFrame(iDStr) then exit;
  if (language <>'*') AND (length(language)<>3)
    then language := 'eng';
  i := GetDescribedTextFrameIndex(ID, Language, Description);
  if i > -1 then
  begin
      if value= '' then
          Frames.Delete(i)
      else
        (Frames[i] as TID3v2Frame).SetCommentsLyrics(Language, Description, Value);
  end
  else
      if value <> '' then
      begin
          NewFrame := TID3v2Frame.Create(idStr, TID3v2FrameVersions(FVersion.Major));
          NewFrame.AlwaysWriteUnicode := fAlwaysWriteUnicode;
          newFrame.CharCode := fCharCode;
          NewFrame.AutoCorrectCodepage := fAutoCorrectCodepage;
          Frames.Add(newFrame);
          newFrame.SetCommentsLyrics(Language, Description, Value);
      end;
end;
procedure TID3v2Tag.SetExtendedComment(Language:AnsiString; Description: UnicodeString; value:UnicodeString);
begin
  SetDescribedTextFrame(IDv2_COMMENT,Language,Description,value);
end;
function TID3v2Tag.GetExtendedComment(Language: AnsiString; Description: UnicodeString): UnicodeString;
begin
  result := GetDescribedTextFrame(IDv2_COMMENT,Language,Description);
end;
procedure TID3v2Tag.SetLyrics(Language:AnsiString; Description: UnicodeString; value: UnicodeString);
begin
  SetDescribedTextFrame(IDv2_LYRICS,Language,Description,value);
end;
function TID3v2Tag.GetLyrics(Language:AnsiString; Description: UnicodeString): UnicodeString;
begin
  result := GetDescribedTextFrame(IDv2_LYRICS,Language,Description);
end;
function TID3v2Tag.GetPicture(stream: TStream; Description: UnicodeString): AnsiString;
var idx: Integer;
    mime: AnsiString;
    DummyPicTyp: Byte;
    DummyDesc: UnicodeString;
begin
    IDX := GetPictureFrameIndex( Description);
    if IDX <> -1 then
    begin
      (Frames[IDX] as TID3v2Frame).GetPicture(Mime, DummyPicTyp, DummyDesc, stream);
      result := mime;
    end else
      result := '';
end;
procedure TID3v2Tag.SetPicture(MimeTyp: AnsiString; PicType: Byte; Description: UnicodeString; stream: TStream);
var IDX: Integer;
    NewFrame: TID3v2Frame;
    idStr: AnsiString;
    oldMime: AnsiString;
    oldDescription: UnicodeString;
    oldType: Byte;
    oldStream: TMemoryStream;
begin
    idStr := GetFrameIDString(IDv2_PICTURE);
    IDX := GetPictureFrameIndex( Description);
    if IDX <> -1 then
    begin
        if Stream = NIL then
          Frames.Delete(IDX)
        else
        begin
            if (Description = '*') or (MimeTyp = '*') or (Stream.size = 0) then
            begin
                oldStream := TMemoryStream.Create;
                (Frames[IDX] as TID3v2Frame).GetPicture(oldMime, oldType, oldDescription, oldStream);
                if (Description = '*') then
                  Description := oldDescription;
                if (MimeTyp = '*') then
                  MimeTyp := oldMime;
                if Stream.Size = 0 then
                  oldStream.SaveToStream(Stream);
                oldStream.Free;
            end;
            (Frames[IDX] as TID3v2Frame).SetPicture(MimeTyp, PicType, Description, Stream)
        end;
    end else
    begin
        if (Stream <> NIL) and (Stream.Size > 0)then
        begin
            NewFrame := TID3v2Frame.Create(idStr, TID3v2FrameVersions(FVersion.Major));
            NewFrame.AlwaysWriteUnicode := fAlwaysWriteUnicode;
            newFrame.CharCode := fCharCode;
            NewFrame.AutoCorrectCodepage := fAutoCorrectCodepage;
            Frames.Add(newFrame);
            if (Description = '*') then
                Description := '';
            if (MimeTyp = '*') then
                  MimeTyp := 'image/jpeg';
            newFrame.SetPicture(MimeTyp, PicType, Description, stream)
        end;
    end;
end;
function TID3v2Tag.GetUserDefinedURL(Description: UnicodeString): AnsiString;
var IDX: Integer;
    DummyDesc: UnicodeString;
begin
    IDX := GetUserDefinedURLFrameIndex(Description);
    if IDX <> -1 then
        result := (Frames[IDX] as TID3v2Frame).GetUserdefinedURL(DummyDesc);
end;
procedure TID3v2Tag.SetUserDefinedURL(Description: UnicodeString; Value: AnsiString);
var IDX: Integer;
    NewFrame: TID3v2Frame;
    idStr: AnsiString;
begin
    idStr := GetFrameIDString(IDv2_USERDEFINEDURL);
    IDX := GetUserDefinedURLFrameIndex(Description);
    if IDX <> -1 then
    begin
        if Value <> '' then
            (Frames[IDX] as TID3v2Frame).SetUserdefinedURL(Description, Value)
        else
            Frames.Delete(IDX);
    end else
    begin
        if Value <> '' then
        begin
            NewFrame := TID3v2Frame.Create(idStr, TID3v2FrameVersions(FVersion.Major));
            NewFrame.AlwaysWriteUnicode := fAlwaysWriteUnicode;
            newFrame.CharCode := fCharCode;
            NewFrame.AutoCorrectCodepage := fAutoCorrectCodepage;
            Frames.Add(newFrame);
            newFrame.SetUserdefinedURL(Description, Value)
        end;
    end;
end;
function TID3v2Tag.GetStandardUserDefinedURL: AnsiString;
begin
    result := GetUserDefinedURL('');
end;
procedure TID3v2Tag.SetStandardUserDefinedURL(Value: AnsiString);
begin
    SetUserDefinedURL('', Value);
end;
procedure TID3v2Tag.SetRatingAndCounter(aEMail: AnsiString; aRating: Integer ; aCounter: Integer);
var IDX: Integer;
    NewFrame: TID3v2Frame;
    idStr: AnsiString;
    currentRating: Byte;
    currentCounter: Cardinal;
    currentMail: AnsiString;
    newRating: Byte;
    newCounter: Cardinal;
begin
    if aRating >= 0 then
        newRating := aRating Mod 256
    else
        newRating := 0;
    if aCounter >= 0 then
        newCounter := aCounter
    else
        newCounter := 0;
    idStr := GetFrameIDString(IDv2_RATING);
    IDX := GetPopularimaterFrameIndex(aEMail);
    if IDX <> -1 then
    begin
        currentRating  := (Frames[IDX] as TID3v2Frame).GetRating(currentMail);
        currentCounter := (Frames[IDX] as TID3v2Frame).GetPersonalPlayCounter(currentMail);
        if ((aRating = 0) and (aCounter = 0))            
             or ((aRating = 0) and ((aCounter = -1) and (currentCounter = 0))) 
             or ((aRating = -1) and (currentRating = 0) and (aCounter = 0))    
        then
            Frames.Delete(IDX)
        else
        begin
            if aEMail = '*' then
                aEMail := currentMail;
            if aRating <> -1 then
                (Frames[IDX] as TID3v2Frame).SetRating(aEMail, newRating);
            if aCounter <> -1 then
                (Frames[IDX] as TID3v2Frame).SetPersonalPlayCounter(aEMail, newCounter);
        end;
    end else
    begin
        NewFrame := TID3v2Frame.Create(idStr, TID3v2FrameVersions(FVersion.Major));
        NewFrame.AlwaysWriteUnicode := fAlwaysWriteUnicode;
        newFrame.CharCode := fCharCode;
        NewFrame.AutoCorrectCodepage := fAutoCorrectCodepage;
        Frames.Add(newFrame);
        if aEMail = '*' then
            aEMail := DefaultRatingDescription;
        if aRating <> -1 then
            newFrame.SetRating(aEMail, newRating);
        if aCounter <> -1 then
            newFrame.SetPersonalPlayCounter(aEMail, newCounter);
    end;
end;
function TID3v2Tag.GetArbitraryRating: Byte;
begin
    result := GetRating('*');
end;
procedure TID3v2Tag.SetArbitraryRating(Value: Byte);
begin
    SetRatingAndCounter('*', Value, -1);
end;
function TID3v2Tag.GetArbitraryPersonalPlayCounter: Cardinal;
begin
    result := GetPersonalPlayCounter('*');
end;
procedure TID3v2Tag.SetArbitraryPersonalPlayCounter(Value: Cardinal);
begin
    SetRatingAndCounter('*', -1, Value);
end;
function TID3v2Tag.GetRating(aEMail: AnsiString): Byte;
var IDX: Integer;
begin
    IDX := GetPopularimaterFrameIndex(aEMail);
    if IDX <> -1 then
        result := (Frames[IDX] as TID3v2Frame).GetRating(aEMail)
    else
        result := 0;
end;
function TID3v2Tag.GetPersonalPlayCounter(aEMail: AnsiString): Cardinal;
var IDX: Integer;
begin
    IDX := GetPopularimaterFrameIndex(aEMail);
    if IDX <> -1 then
        result := (Frames[IDX] as TID3v2Frame).GetPersonalPlayCounter(aEMail)
    else
        result := 0;
end;
function TID3v2Tag.GetPrivateFrame(aOwnerID: AnsiString;
  Content: TStream): Boolean;
var IDX: Integer;
begin
    IDX := GetPrivateFrameIndex(aOwnerID);
    if IDX <> -1 then
        result := (Frames[IDX] as TID3v2Frame).GetPrivateFrame(aOwnerID, Content)
    else
        result := False;
end;
procedure TID3v2Tag.SetPrivateFrame(aOwnerID: AnsiString; Content: TStream);
var IDX: Integer;
    NewFrame: TID3v2Frame;
    idStr: AnsiString;
begin
    idStr := GetFrameIDString(IDv2_PRIVATE);
    IDX := GetPrivateFrameIndex(aOwnerID);
    if IDX <> -1 then
    begin
        if assigned(Content) and (Content.Size > 0) then
            (Frames[IDX] as TID3v2Frame).SetPrivateFrame(aOwnerID, Content)
        else
            Frames.Delete(IDX);
    end else
    begin
        if assigned(Content) and (Content.Size > 0) then
        begin
            NewFrame := TID3v2Frame.Create(idStr, TID3v2FrameVersions(FVersion.Major));
            NewFrame.AlwaysWriteUnicode := fAlwaysWriteUnicode;
            newFrame.CharCode := fCharCode;
            NewFrame.AutoCorrectCodepage := fAutoCorrectCodepage;
            Frames.Add(newFrame);
            newFrame.SetPrivateFrame(aOwnerID, Content);
        end;
    end;
end;
procedure TID3v2Tag.SetTitle(Value: UnicodeString);
begin
  SetText(IDv2_TITEL, Value);
end;
procedure TID3v2Tag.SetArtist(Value: UnicodeString);
begin
  SetText(IDv2_ARTIST, Value);
end;
procedure TID3v2Tag.SetAlbum(Value: UnicodeString);
begin
  SetText(IDv2_ALBUM, Value);
end;
function TID3v2Tag.BuildID3v2Genre(value: UnicodeString): UnicodeString;
begin
  if Genres.IndexOf(value) > -1 then
    result := '(' + inttostr(Genres.IndexOf(value)) + ')' + value
  else
    result := value;
end;
procedure TID3v2Tag.SetGenre(Value: UnicodeString);
begin
  SetText(IDv2_GENRE, BuildID3v2Genre(Value));
end;
procedure TID3v2Tag.SetYear(Value: UnicodeString);
var temp:integer;
begin
  temp := StrToIntDef(Trim(Value), 0);
  if  (temp > 0) and (temp < 10000) then
  begin
    Value := Trim(Value);
    Insert(StringOfChar('0', 4 - Length(Value)), Value, 1);
  end
  else
    Value := '';
  SetText(IDv2_YEAR, Value);
end;
procedure TID3v2Tag.SetTrack(Value: UnicodeString);
begin
  SetText(IDv2_TRACK, Value);
end;
procedure TID3v2Tag.SetStandardComment(Value: UnicodeString);
begin
  SetDescribedTextFrame(IDv2_COMMENT,'*','',value);
end;
procedure TID3v2Tag.SetStandardLyrics(Value: UnicodeString);
begin
  SetDescribedTextFrame(IDv2_Lyrics,'*','',value);
end;
procedure TID3v2Tag.SetComposer(Value: UnicodeString);
begin
  SetText(IDv2_COMPOSER, value);
end;
procedure TID3v2Tag.SetOriginalArtist(Value: UnicodeString);
begin
  SetText(IDv2_ORIGINALARTIST, value);
end;
procedure TID3v2Tag.SetCopyright(Value: UnicodeString);
begin
  SetText(IDv2_COPYRIGHT, value);
end;
procedure TID3v2Tag.SetEncodedBy(Value: UnicodeString);
begin
  SetText(IDv2_ENCODEDBY, value);
end;
procedure TID3v2Tag.SetLanguages(Value: UnicodeString);
begin
  SetText(IDv2_LANGUAGES, value);
end;
procedure TID3v2Tag.SetSoftwareSettings(Value: UnicodeString);
begin
  SetText(IDv2_SOFTWARESETTINGS, value);
end;
procedure TID3v2Tag.SetMediatype(Value: UnicodeString);
begin
  SetText(IDv2_MEDIATYPE, value);
end;
procedure TID3v2Tag.Setid3Length(Value: UnicodeString);
begin
  SetText(Idv2_LENGTH, value);
end;
procedure TID3v2Tag.SetPublisher(Value: UnicodeString);
begin
  SetText(Idv2_PUBLISHER, value);
end;
procedure TID3v2Tag.SetOriginalFilename(Value: UnicodeString);
begin
  SetText(Idv2_ORIGINALFILENAME, value);
end;
procedure TID3v2Tag.SetOriginalLyricist(Value: UnicodeString);
begin
  SetText(Idv2_ORIGINALLYRICIST, value);
end;
procedure TID3v2Tag.SetOriginalReleaseYear(Value: UnicodeString);
begin
  SetText(Idv2_ORIGINALRELEASEYEAR, value);
end;
procedure TID3v2Tag.SetOriginalAlbumTitel(Value: UnicodeString);
begin
  SetText(Idv2_ORIGINALALBUMTITEL, value);
end;
function TID3v2Tag.GetTitle: UnicodeString;
begin
  result := GetText(IDv2_TITEL);
end;
function TID3v2Tag.GetArtist: UnicodeString;
begin
  result := GetText(IDv2_ARTIST);
end;
function TID3v2Tag.GetAlbum: UnicodeString;
begin
  result := GetText(IDv2_ALBUM);
end;
function TID3v2Tag.ParseID3v2Genre(value: UnicodeString): UnicodeString;
var posauf, poszu: integer;
  GenreID:Byte;
begin
  result := value;
  posauf := pos('(',value);
  poszu := pos(')',value);
  if posauf<poszu then
  begin
    GenreID := StrTointDef(copy(value,posauf+1, poszu-posauf-1),255);
    if GenreID < Genres.Count then
      result := Genres[GenreID];
  end;
end;
function TID3v2Tag.GetGenre: UnicodeString;
begin
  result := ParseID3v2Genre(GetText(IDv2_GENRE));
end;
function TID3v2Tag.GetYear: UnicodeString;
begin
  result := GetText(IDv2_YEAR);
end;
function TID3v2Tag.GetTrack: UnicodeString;
begin
  result := GetText(IDv2_TRACK);
end;
function TID3v2Tag.GetStandardComment: UnicodeString;
begin
  result := GetDescribedTextFrame(IDv2_COMMENT,'*','');
end;
function TID3v2Tag.GetStandardLyrics: UnicodeString;
begin
  result := GetDescribedTextFrame(IDv2_Lyrics,'*','');
end;
function TID3v2Tag.GetComposer: UnicodeString;
begin
  result := GetText(IDv2_COMPOSER);
end;
function TID3v2Tag.GetOriginalArtist: UnicodeString;
begin
  result := GetText(IDv2_ORIGINALARTIST);
end;
function TID3v2Tag.GetCopyright: UnicodeString;
begin
  result := GetText(IDv2_COPYRIGHT);
end;
function TID3v2Tag.GetEncodedBy: UnicodeString;
begin
  result := GetText(IDv2_ENCODEDBY);
end;
function TID3v2Tag.GetLanguages: UnicodeString;
begin
  result := GetText(IDv2_LANGUAGES);
end;
function TID3v2Tag.GetSoftwareSettings: UnicodeString;
begin
  result := GetText(IDv2_SOFTWARESETTINGS);
end;
function TID3v2Tag.GetMediatype: UnicodeString;
begin
  result := GetText(IDv2_MEDIATYPE);
end;
function TID3v2Tag.Getid3Length: UnicodeString;
begin
  result := GetText(IDv2_LENGTH);
end;
function TID3v2Tag.GetPublisher: UnicodeString;
begin
  result := GetText(IDv2_PUBLISHER);
end;
function TID3v2Tag.GetOriginalFilename: UnicodeString;
begin
  result := GetText(IDv2_ORIGINALFILENAME);
end;
function TID3v2Tag.GetOriginalLyricist: UnicodeString;
begin
  result := GetText(IDv2_ORIGINALLYRICIST);
end;
function TID3v2Tag.GetOriginalReleaseYear: UnicodeString;
begin
  result := GetText(IDv2_ORIGINALRELEASEYEAR);
end;
function TID3v2Tag.GetOriginalAlbumTitel: UnicodeString;
begin
  result := GetText(IDv2_ORIGINALALBUMTITEL);
end;
function TID3v2Tag.GetAllFrames: TObjectlist;
var i: Integer;
begin
  result := TObjectList.Create(False);
  for i := 0 to Frames.Count-1 do
      result.Add(Frames[i]);
end;
function TID3v2Tag.GetAllTextFrames: TObjectlist;
var i: Integer;
begin
  result := TObjectList.Create(False);
  for i := 0 to Frames.Count-1 do
  begin
      if TID3v2Frame(Frames[i]).FrameType = FT_TextFrame then
        result.Add(Frames[i]);
  end;
end;
function TID3v2Tag.GetAllUserTextFrames: TObjectlist;
var i: Integer;
begin
    result := TObjectList.Create(False);
    for i := 0 to Frames.Count - 1 do
        if TID3v2Frame(Frames[i]).FrameType = FT_UserTextFrame then
            result.Add(Frames[i]);
end;
function TID3v2Tag.GetAllCommentFrames: TObjectlist;
var i: Integer;
    idStr: AnsiString;
begin
  result := TObjectList.Create(False);
  idStr := GetFrameIDString(IDv2_Comment);
  for i := 0 to Frames.Count-1 do
  begin
    if (Frames[i] as TID3v2Frame).FrameIDString = idStr then
        result.Add(Frames[i]);
  end;
end;
function TID3v2Tag.GetAllLyricFrames: TObjectlist;
var i: Integer;
    idStr: AnsiString;
begin
  result := TObjectList.Create(False);
  idStr := GetFrameIDString(IDv2_Lyrics);
  for i := 0 to Frames.Count-1 do
  begin
    if (Frames[i] as TID3v2Frame).FrameIDString = idStr then
        result.Add(Frames[i]);
  end;
end;
function TID3v2Tag.GetAllUserDefinedURLFrames: TObjectlist;
var i: Integer;
    idStr: AnsiString;
begin
  result := TObjectList.Create(False);
  idStr := GetFrameIDString(IDv2_USERDEFINEDURL);
  for i := 0 to Frames.Count-1 do
  begin
    if (Frames[i] as TID3v2Frame).FrameIDString = idStr then
        result.Add(Frames[i]);
  end;
end;
function TID3v2Tag.GetAllPictureFrames: TObjectlist;
var i: Integer;
    idStr: AnsiString;
begin
  result := TObjectList.Create(False);
  idStr := GetFrameIDString(IDv2_Picture);
  for i := 0 to Frames.Count-1 do
  begin
    if (Frames[i] as TID3v2Frame).FrameIDString = idStr then
        result.Add(Frames[i]);
  end;
end;
function TID3v2Tag.GetAllPopularimeterFrames: TObjectlist;
var i: Integer;
    idStr: AnsiString;
begin
  result := TObjectList.Create(False);
  idStr := GetFrameIDString(IDv2_Rating);
  for i := 0 to Frames.Count-1 do
  begin
    if (Frames[i] as TID3v2Frame).FrameIDString = idStr then
        result.Add(Frames[i]);
  end;
end;
function TID3v2Tag.GetAllURLFrames: TObjectlist;
var i: Integer;
begin
  result := TObjectList.Create(False);
  for i := 0 to Frames.Count-1 do
  begin
    if (Frames[i] as TID3v2Frame).FrameType = FT_URLFrame then
        result.Add(Frames[i]);
  end;
end;
function TID3v2Tag.GetAllPrivateFrames: TObjectList;
var i: Integer;
    idStr: AnsiString;
begin
  result := TObjectList.Create(False);
  idStr := GetFrameIDString(IDv2_PRIVATE);
  for i := 0 to Frames.Count-1 do
  begin
    if (Frames[i] as TID3v2Frame).FrameIDString = idStr then
        result.Add(Frames[i]);
  end;
end;
function TID3v2Tag.ValidNewCommentFrame(Language: AnsiString; Description: UnicodeString): Boolean;
begin
    result := GetDescribedTextFrameIndex(IDv2_Comment, Language, Description) = -1;
end;
function TID3v2Tag.ValidNewLyricFrame(Language: AnsiString; Description: UnicodeString): Boolean;
begin
    result := GetDescribedTextFrameIndex(IDv2_Lyrics, Language, Description) = -1;
end;
function TID3v2Tag.ValidNewPictureFrame(Description: UnicodeString): Boolean;
begin
    result := GetPictureFrameIndex(Description) = -1;
end;
function TID3v2Tag.ValidNewUserDefUrlFrame(Description: UnicodeString): Boolean;
begin
    result := GetUserDefinedURLFrameIndex(Description) = -1;
end;
function TID3v2Tag.ValidNewPopularimeterFrame(EMail: AnsiString): Boolean;
begin
    result := GetPopularimaterFrameIndex(EMail) = -1;
end;
function TID3v2Tag.GetAllowedTextFrames: TList;
var i: TFrameIDs;
begin
    result := TList.Create;
    for i := IDv2_ARTIST to IDv2_SETSUBTITLE do
      if (GetFrameIDString(i)[1] <> '-') AND (GetFrameIndex(i) = -1)
      then
        result.Add(Pointer(i));
end;
function TID3v2Tag.GetAllowedURLFrames: TList;
var i: TFrameIDs;
begin
    result := TList.Create;
    for i := IDv2_AUDIOFILEURL to IDv2_PAYMENTURL do
      if (GetFrameIDString(i)[1] <> '-') AND (GetFrameIndex(i) = -1)
      then
        result.Add(Pointer(i));
end;
function TID3v2Tag.AddFrame(aID: TFrameIDs): TID3v2Frame;
begin
    result := TID3v2Frame.Create( GetFrameIDString(aID), TID3v2FrameVersions(Version.Major));
    Frames.Add(result);
end;
procedure TID3v2Tag.DeleteFrame(aFrame: TID3v2Frame);
begin
    Frames.Remove(aFrame);
end;
procedure TID3v2Tag.SetCharCode(Value: TCodePage);
var i: Integer;
begin
    fCharCode := Value;
    for i := 0 to Frames.Count - 1 do
        (Frames[i] as TID3v2Frame).CharCode := Value;
end;
procedure TID3v2Tag.SetAutoCorrectCodepage(Value: Boolean);
var i: Integer;
begin
    fAutoCorrectCodepage := Value;
    for i := 0 to Frames.Count - 1 do
        (Frames[i] as TID3v2Frame).AutoCorrectCodepage := Value;
end;
constructor TMpegInfo.create;
begin
  inherited create;
end;
function TMpegInfo.LoadFromStream(stream: tStream): TMP3Error;
var buffer: TBuffer;
  erfolg, Skip3rdTest: boolean;
  positionInStream: int64;  
  max: int64;
  c,bufferpos: integer;
  tmpMpegHeader, tmp2MpegHeader: TMpegHeader;
  tmpXingHeader: tXingHeader;
  smallBuffer1, smallBuffer2: TBuffer;
  blocksize: integer;
begin
  result := MPEGERR_NoFrame;
  Fvalid := False;
  FfirstHeaderPosition := -1;
  blocksize := 512;
  positionInStream := Stream.Position-1 ;
  bufferpos := -1 ;
  setlength(buffer, blocksize);
  c := Stream.Read(buffer[0], length(buffer));
  if c<blocksize then Setlength(Buffer, c);
  max := Stream.Size;
  erfolg :=False;
  FFilesize := max;
  while ( (NOT erfolg) AND (positionInStream + 3 < max ) )
  do begin
    inc(bufferpos);
    inc(positionInStream);
    if (bufferpos+3) = (length(buffer)-1) then
    begin
      Stream.Position := PositionInStream;
      c := Stream.Read(buffer[0], length(buffer));
      if c<blocksize then
        Setlength(Buffer, c);
      bufferpos := 0;
    end;
    tmpXingHeader.valid := False;
    tmpMpegHeader := GetValidatedHeader(Buffer, bufferpos);
    if not tmpMpegHeader.valid then continue;
    Skip3rdTest := False;
    if (bufferpos + tmpMpegHeader.framelength + 3 > length(buffer)-1)  
       AND
       (positionInStream + tmpMpegHeader.framelength + 3 < max) 
       then
    begin
        Stream.Position := PositionInStream;
        setlength(smallBuffer1,tmpMpegHeader.framelength + 4);
        Stream.Read(smallBuffer1[0],length(smallBuffer1));
        try
          tmpXingHeader := GetXingHeader(tmpMpegheader, smallbuffer1, 0);
          if not tmpXingheader.valid then
          begin
              tmpXingHeader := GetVBRIHeader(tmpMpegheader, smallBuffer1, 0);
              Skip3rdTest := tmpXingHeader.valid;
              if tmpXingHeader.valid then
                  tmp2MpegHeader.Valid := True
              else
                  tmp2MpegHeader := GetValidatedHeader(smallBuffer1, tmpMpegHeader.framelength );
          end else
              tmp2MpegHeader := GetValidatedHeader(smallBuffer1, tmpMpegHeader.framelength );
        except
          tmp2MpegHeader.valid := false;
        end;
        Stream.Position := PositionInStream;
    end else
    begin
        if (positionInStream + tmpMpegHeader.framelength + 3 > max) then
        begin
            continue;
        end;
        tmpXingHeader := GetXingHeader(tmpMpegheader, buffer, bufferpos );
        if not tmpXingheader.valid then
        begin
            tmpXingHeader := GetVBRIHeader(tmpMpegheader, buffer, bufferpos );
            Skip3rdTest := tmpXingHeader.valid;     
            if tmpXingHeader.valid then
                tmp2MpegHeader.Valid := True
            else
                tmp2MpegHeader := GetValidatedHeader(buffer, bufferpos + tmpMpegHeader.framelength);
        end else
            tmp2MpegHeader := GetValidatedHeader(buffer, bufferpos + tmpMpegHeader.framelength);
    end;
    if not tmp2MpegHeader.valid then begin
        continue;
    end;
    if Not Skip3rdTest then
    begin
        if (bufferpos + tmpMpegHeader.framelength + tmp2MpegHeader.framelength + 3 > length(buffer)-1)
           AND
           (positionInStream + tmpMpegHeader.framelength + tmp2MpegHeader.framelength + 3 < max)
        then
        begin
            Stream.Position := PositionInStream + tmpMpegHeader.framelength + tmp2MpegHeader.framelength;
            setlength(smallBuffer2,4);
            Stream.Read(smallBuffer2[0],length(smallBuffer2));
            Stream.Position := PositionInStream;
            if (smallbuffer2[0]<>$FF) OR (smallbuffer2[1]<$E0) then continue;
        end
        else
        begin
            if (positionInStream + tmpMpegHeader.framelength + tmp2MpegHeader.framelength + 3 > max)
            then continue;
            if (buffer[bufferpos + tmpMpegHeader.framelength + tmp2MpegHeader.framelength] <> $FF)
            OR (buffer[bufferpos + tmpMpegHeader.framelength + tmp2MpegHeader.framelength+1] < $E0)
            then continue;
        end;
    end;
    Fversion := tmpMpegHeader.version;
    Flayer := tmpMpegHeader.layer;
    Fprotection := tmpMpegHeader.protection;
    Fsamplerate := tmpMpegHeader.samplerate;
    Fchannelmode := tmpMpegHeader.channelmode;
    Fextension := tmpMpegHeader.extension;
    Fcopyright := tmpMpegHeader.copyright;
    Foriginal := tmpMpegHeader.original;
    Femphasis := tmpMpegHeader.emphasis;
    if tmpXingHeader.valid then
      try
        Fbitrate := trunc((tmpMpegheader.samplerate/1000 *
          (max - PositionInStream - tmpXingHeader.Size))  /   (tmpXingHeader.frames*144));
        Fvbr := True;
        Fdauer := ((max-PositionInStream-tmpXingHeader.Size)*8) div ((Fbitrate)*1000);
        FFrames := tmpXingHeader.Frames;
      except
        continue;
      end
    else
      try
        Fframes := trunc((max - PositionInStream)/tmpMpegheader.framelength);
        FBitrate := tmpMpegHeader.bitrate;
        Fvbr := False;
        Fdauer := ((max - PositionInStream)*8) div ((Fbitrate)*1000);
      except
        continue;
      end;
    Fvalid := True;
    FfirstHeaderPosition := PositionInStream;
    result := MP3ERR_None;
    erfolg := True;
  end;
end;
function TMpegInfo.LoadFromFile(FileName: UnicodeString): TMP3Error;
var Stream: TMPFUFileStream;
begin
  if WideFileExists(Filename) then
    try
      stream := TMPFUFileStream.Create(filename, fmOpenRead or fmShareDenyWrite);
      try
        result := LoadFromStream(Stream);
      finally
        Stream.Free;
      end;
    except
      result := MP3ERR_FOpenR;
    end
  else
    result := MP3ERR_NoFile;
end;
function TMpegInfo.GetValidatedHeader(aBuffer: TBuffer; position: integer): TMpegheader;
var bitrateindex, versionindex: byte;
    samplerateindex:byte;
    tmpLength: Integer;
begin
  if (abuffer[position]<>$FF) OR (abuffer[position+1]<$E0)
  then
  begin
    result.valid := False;
    exit;
  end;
  Versionindex := (abuffer[position+1] shr 3) and 3;
  case versionindex of
      0: result.version := 3; 
      1: result.version := 0; 
      2: result.version := 2;
      3: result.version := 1;
  end;
  result.Layer := 4-((abuffer[position+1] shr 1) and 3);
  result.protection := (abuffer[position+1] AND 1)=0;
  if (Result.version = 0) or (Result.Layer = 4) then
  begin
    Result.valid := False;
    Exit;
  end;
  bitrateindex := (abuffer[position+2] shr 4) AND $F;
  result.bitrate := MPEG_BIT_RATES[result.version][result.layer][bitrateindex];
  if bitrateindex=$F then
  begin
    result.valid := false; 
    exit;
  end;
  samplerateindex := (abuffer[position+2] shr 2) AND $3;
  result.samplerate := sample_rates[result.version][samplerateindex];
  result.padding := ((abuffer[position+2] shr 1) AND $1) = 1;
  result.channelmode := ((abuffer[position+3] shr 6) AND 3);
  result.extension := ((abuffer[position+3] shr 4) AND 3);
  result.copyright := ((abuffer[position+3] shr 3) AND 1)=1;
  result.original := ((abuffer[position+3] shr 2) AND 1)=1;
  result.emphasis := (abuffer[position+3] AND 3);
  if result.layer=2 then
      if ((result.bitrate=32) AND (result.channelmode<>3))
          OR ((result.bitrate=48) AND (result.channelmode<>3))
          OR ((result.bitrate=56) AND (result.channelmode<>3))
          OR ((result.bitrate=80) AND (result.channelmode<>3))
          OR ((result.bitrate=224) AND (result.channelmode=3))
          OR ((result.bitrate=256) AND (result.channelmode=3))
          OR ((result.bitrate=320) AND (result.channelmode=3))
          OR ((result.bitrate=384) AND (result.channelmode=3))
      then begin
        result.valid := false;
        exit;
      end;
  tmpLength := GetFramelength(result.version, result.layer,
                              result.bitrate,
                              result.Samplerate,
                              result.padding);
  if tmpLength > 0 then
  begin
      result.valid := True;
      result.framelength := Word(tmpLength);
  end else
  begin
      result.valid := false;
      result.framelength := high(word);
  end;
end;
function TMpegInfo.GetXingHeader(aMpegheader: TMpegHeader; aBuffer: TBuffer; position: integer ): TXingHeader;
var Xing_offset: integer;
  Xing_Flags: byte;
begin
  if aMpegheader.version=1 then
    if aMpegheader.channelmode<>3 then
      xing_offset := 32+4
    else
      xing_offset := 17+4
  else
    if aMpegheader.channelmode<>3 then
      xing_offset := 17+4
    else
      xing_offset := 9+4;
  if Length(abuffer) <= (position + xing_offset + 11) then
  begin
    Result.valid := False;
    Exit;
  end;
  if (abuffer[position+xing_offset]=$58)        
     AND (abuffer[position+xing_offset+1]=$69)
     AND (abuffer[position+xing_offset+2]=$6E)
     AND (abuffer[position+xing_offset+3]=$67)
     then 
  begin
          Xing_flags := abuffer[position+xing_offset+7];
          if (Xing_flags AND 1)=1 then
          begin 
              result.frames := 16777216 * abuffer[position+xing_offset+8]
                  + 65536 * abuffer[position+xing_offset+9]
                  + 256 * abuffer[position+xing_offset+10]
                  + abuffer[position+xing_offset+11];
          end
          else
              result.frames := 0;
          result.Size := aMpegHeader.framelength;
          result.valid := True;
  end else
    result.valid := False;
end;
function TMpegInfo.GetVBRIHeader(aMpegheader: TMpegHeader; aBuffer: TBuffer; position: integer): TVBRIHeader;
var vbriOffset: Integer;
begin
    vbriOffset := 4 + 32; 
    if Length(abuffer) <= (position + vbriOffset + 16) then
    begin
        Result.valid := False;
        Exit;
    end;
    if (abuffer[position+vbriOffset]=$56)       
      AND (abuffer[position+vbriOffset+1]=$42)  
      AND (abuffer[position+vbriOffset+2]=$52)  
      AND (abuffer[position+vbriOffset+3]=$49)  
    then 
    begin
        result.frames := 16777216 * abuffer[position+vbriOffset+14]
                  + 65536 * abuffer[position+vbriOffset+15]
                  + 256 * abuffer[position+vbriOffset+16]
                  + abuffer[position+vbriOffset+17];
        result.valid := True;
        result.Size := aMpegHeader.framelength;
    end else
        result.valid := False;
end;
function TMpegInfo.GetFramelength(version:byte;layer:byte;bitrate:longint;Samplerate:longint;padding:boolean):integer;
begin
  if samplerate=0 then result := -2
  else
    if Layer=1 then
      result := trunc(12*bitrate*1000 / samplerate+Integer(padding)*4)
    else
      if Version = 1 then
        result :=  144 * bitrate * 1000 DIV samplerate + integer(padding)
      else
        result := 72 * bitrate * 1000 DIV samplerate + integer(padding)
end;
initialization
  Genres := TStringList.Create;
  Genres.CaseSensitive := False;
  Genres.Add('Blues');
  Genres.Add('Classic Rock');
  Genres.Add('Country');
  Genres.Add('Dance');
  Genres.Add('Disco');
  Genres.Add('Funk');
  Genres.Add('Grunge');
  Genres.Add('Hip-Hop');
  Genres.Add('Jazz');
  Genres.Add('Metal');
  Genres.Add('New Age');
  Genres.Add('Oldies');
  Genres.Add('Other');
  Genres.Add('Pop');
  Genres.Add('R&B');
  Genres.Add('Rap');
  Genres.Add('Reggae');
  Genres.Add('Rock');
  Genres.Add('Techno');
  Genres.Add('Industrial');
  Genres.Add('Alternative');
  Genres.Add('Ska');
  Genres.Add('Death Metal');
  Genres.Add('Pranks');
  Genres.Add('Soundtrack');
  Genres.Add('Euro-Techno');
  Genres.Add('Ambient');
  Genres.Add('Trip-Hop');
  Genres.Add('Vocal');
  Genres.Add('Jazz+Funk');
  Genres.Add('Fusion');
  Genres.Add('Trance');
  Genres.Add('Classical');
  Genres.Add('Instrumental');
  Genres.Add('Acid');
  Genres.Add('House');
  Genres.Add('Game');
  Genres.Add('Sound Clip');
  Genres.Add('Gospel');
  Genres.Add('Noise');
  Genres.Add('AlternRock');
  Genres.Add('Bass');
  Genres.Add('Soul');
  Genres.Add('Punk');
  Genres.Add('Space');
  Genres.Add('Meditative');
  Genres.Add('Instrumental Pop');
  Genres.Add('Instrumental Rock');
  Genres.Add('Ethnic');
  Genres.Add('Gothic');
  Genres.Add('Darkwave');
  Genres.Add('Techno-Industrial');
  Genres.Add('Electronic');
  Genres.Add('Pop-Folk');
  Genres.Add('Eurodance');
  Genres.Add('Dream');
  Genres.Add('Southern Rock');
  Genres.Add('Comedy');
  Genres.Add('Cult');
  Genres.Add('Gangsta');
  Genres.Add('Top 40');
  Genres.Add('Christian Rap');
  Genres.Add('Pop/Funk');
  Genres.Add('Jungle');
  Genres.Add('Native American');
  Genres.Add('Cabaret');
  Genres.Add('New Wave');
  Genres.Add('Psychadelic');
  Genres.Add('Rave');
  Genres.Add('Showtunes');
  Genres.Add('Trailer');
  Genres.Add('Lo-Fi');
  Genres.Add('Tribal');
  Genres.Add('Acid Punk');
  Genres.Add('Acid Jazz');
  Genres.Add('Polka');
  Genres.Add('Retro');
  Genres.Add('Musical');
  Genres.Add('Rock & Roll');
  Genres.Add('Hard Rock');
  Genres.Add('Folk');
  Genres.Add('Folk-Rock');
  Genres.Add('National Folk');
  Genres.Add('Swing');
  Genres.Add('Fast Fusion');
  Genres.Add('Bebob');
  Genres.Add('Latin');
  Genres.Add('Revival');
  Genres.Add('Celtic');
  Genres.Add('Bluegrass');
  Genres.Add('Avantgarde');
  Genres.Add('Gothic Rock');
  Genres.Add('Progessive Rock');
  Genres.Add('Psychedelic Rock');
  Genres.Add('Symphonic Rock');
  Genres.Add('Slow Rock');
  Genres.Add('Big Band');
  Genres.Add('Chorus');
  Genres.Add('Easy Listening');
  Genres.Add('Acoustic');
  Genres.Add('Humour');
  Genres.Add('Speech');
  Genres.Add('Chanson');
  Genres.Add('Opera');
  Genres.Add('Chamber Music');
  Genres.Add('Sonata');
  Genres.Add('Symphony');
  Genres.Add('Booty Bass');
  Genres.Add('Primus');
  Genres.Add('Porn Groove');
  Genres.Add('Satire');
  Genres.Add('Slow Jam');
  Genres.Add('Club');
  Genres.Add('Tango');
  Genres.Add('Samba');
  Genres.Add('Folklore');
  Genres.Add('Ballad');
  Genres.Add('Power Ballad');
  Genres.Add('Rhythmic Soul');
  Genres.Add('Freestyle');
  Genres.Add('Duet');
  Genres.Add('Punk Rock');
  Genres.Add('Drum Solo');
  Genres.Add('A capella');
  Genres.Add('Euro-House');
  Genres.Add('Dance Hall');
  Genres.Add('Goa');
  Genres.Add('Drum & Bass');
  Genres.Add('Club-House');
  Genres.Add('Hardcore');
  Genres.Add('Terror');
  Genres.Add('Indie');
  Genres.Add('BritPop');
  Genres.Add('Negerunk');
  Genres.Add('Polsk Punk');
  Genres.Add('Beat');
  Genres.Add('Christian Gangsta Rap');
  Genres.Add('Heavy Metal');
  Genres.Add('Black Metal');
  Genres.Add('Crossover');
  Genres.Add('Contemporary Christian');
  Genres.Add('Christian Rock');
  Genres.Add('Merengue');
  Genres.Add('Salsa');
  Genres.Add('Trash Metal');
  Genres.Add('Anime');
  Genres.Add('JPop');
  Genres.Add('Synthpop');
  LanguageCodes := TStringList.Create;
  LanguageNames := TStringList.Create;
  LanguageCodes.CaseSensitive := False;
  LanguageNames.CaseSensitive := False;
  LanguageCodes.Add('aar');  LanguageNames.Add('Afar');
  LanguageCodes.Add('abk');  LanguageNames.Add('Abkhazian');
  LanguageCodes.Add('ace');  LanguageNames.Add('Achinese');
  LanguageCodes.Add('ach');  LanguageNames.Add('Acoli');
  LanguageCodes.Add('ada');  LanguageNames.Add('Adangme');
  LanguageCodes.Add('afa');  LanguageNames.Add('Afro-Asiatic (Other)');
  LanguageCodes.Add('afh');  LanguageNames.Add('Afrihili');
  LanguageCodes.Add('afr');  LanguageNames.Add('Afrikaans');
  LanguageCodes.Add('aka');  LanguageNames.Add('Akan');
  LanguageCodes.Add('akk');  LanguageNames.Add('Akkadian');
  LanguageCodes.Add('alb');  LanguageNames.Add('Albanian');
  LanguageCodes.Add('ale');  LanguageNames.Add('Aleut');
  LanguageCodes.Add('alg');  LanguageNames.Add('Algonquian Languages');
  LanguageCodes.Add('amh');  LanguageNames.Add('Amharic');
  LanguageCodes.Add('ang');  LanguageNames.Add('English, Old (ca. 450-1100)');
  LanguageCodes.Add('apa');  LanguageNames.Add('Apache Languages');
  LanguageCodes.Add('ara');  LanguageNames.Add('Arabic');
  LanguageCodes.Add('arc');  LanguageNames.Add('Aramaic');
  LanguageCodes.Add('arm');  LanguageNames.Add('Armenian');
  LanguageCodes.Add('arn');  LanguageNames.Add('Araucanian');
  LanguageCodes.Add('arp');  LanguageNames.Add('Arapaho');
  LanguageCodes.Add('art');  LanguageNames.Add('Artificial (Other)');
  LanguageCodes.Add('arw');  LanguageNames.Add('Arawak');
  LanguageCodes.Add('asm');  LanguageNames.Add('Assamese');
  LanguageCodes.Add('ath');  LanguageNames.Add('Athapascan Languages');
  LanguageCodes.Add('ava');  LanguageNames.Add('Avaric');
  LanguageCodes.Add('ave');  LanguageNames.Add('Avestan');
  LanguageCodes.Add('awa');  LanguageNames.Add('Awadhi');
  LanguageCodes.Add('aym');  LanguageNames.Add('Aymara');
  LanguageCodes.Add('aze');  LanguageNames.Add('Azerbaijani');
  LanguageCodes.Add('bad');  LanguageNames.Add('Banda');
  LanguageCodes.Add('bai');  LanguageNames.Add('Bamileke Languages');
  LanguageCodes.Add('bak');  LanguageNames.Add('Bashkir');
  LanguageCodes.Add('bal');  LanguageNames.Add('Baluchi');
  LanguageCodes.Add('bam');  LanguageNames.Add('Bambara');
  LanguageCodes.Add('ban');  LanguageNames.Add('Balinese');
  LanguageCodes.Add('baq');  LanguageNames.Add('Basque');
  LanguageCodes.Add('bas');  LanguageNames.Add('Basa');
  LanguageCodes.Add('bat');  LanguageNames.Add('Baltic (Other)');
  LanguageCodes.Add('bej');  LanguageNames.Add('Beja');
  LanguageCodes.Add('bel');  LanguageNames.Add('Byelorussian');
  LanguageCodes.Add('bem');  LanguageNames.Add('Bemba');
  LanguageCodes.Add('ben');  LanguageNames.Add('Bengali');
  LanguageCodes.Add('ber');  LanguageNames.Add('Berber (Other)');
  LanguageCodes.Add('bho');  LanguageNames.Add('Bhojpuri');
  LanguageCodes.Add('bih');  LanguageNames.Add('Bihari');
  LanguageCodes.Add('bik');  LanguageNames.Add('Bikol');
  LanguageCodes.Add('bin');  LanguageNames.Add('Bini');
  LanguageCodes.Add('bis');  LanguageNames.Add('Bislama');
  LanguageCodes.Add('bla');  LanguageNames.Add('Siksika');
  LanguageCodes.Add('bnt');  LanguageNames.Add('Bantu (Other)');
  LanguageCodes.Add('bod');  LanguageNames.Add('Tibetan');
  LanguageCodes.Add('bra');  LanguageNames.Add('Braj');
  LanguageCodes.Add('bre');  LanguageNames.Add('Breton');
  LanguageCodes.Add('bua');  LanguageNames.Add('Buriat');
  LanguageCodes.Add('bug');  LanguageNames.Add('Buginese');
  LanguageCodes.Add('bul');  LanguageNames.Add('Bulgarian	');
  LanguageCodes.Add('bur');  LanguageNames.Add('Burmese	');
  LanguageCodes.Add('cad');  LanguageNames.Add('Caddo');
  LanguageCodes.Add('cai');  LanguageNames.Add('Central American Indian (Other)');
  LanguageCodes.Add('car');  LanguageNames.Add('Carib');
  LanguageCodes.Add('cat');  LanguageNames.Add('Catalan	');
  LanguageCodes.Add('cau');  LanguageNames.Add('Caucasian (Other)');
  LanguageCodes.Add('ceb');  LanguageNames.Add('Cebuano');
  LanguageCodes.Add('cel');  LanguageNames.Add('Celtic (Other)');
  LanguageCodes.Add('ces');  LanguageNames.Add('Czech');
  LanguageCodes.Add('cha');  LanguageNames.Add('Chamorro');
  LanguageCodes.Add('chb');  LanguageNames.Add('Chibcha	');
  LanguageCodes.Add('che');  LanguageNames.Add('Chechen');
  LanguageCodes.Add('chg');  LanguageNames.Add('Chagatai');
  LanguageCodes.Add('chi');  LanguageNames.Add('Chinese');
  LanguageCodes.Add('chm');  LanguageNames.Add('Mari');
  LanguageCodes.Add('chn');  LanguageNames.Add('Chinook jargon');
  LanguageCodes.Add('cho');  LanguageNames.Add('Choctaw');
  LanguageCodes.Add('chr');  LanguageNames.Add('Cherokee');
  LanguageCodes.Add('chu');  LanguageNames.Add('Church Slavic');
  LanguageCodes.Add('chv');  LanguageNames.Add('Chuvash');
  LanguageCodes.Add('chy');  LanguageNames.Add('Cheyenne');
  LanguageCodes.Add('cop');  LanguageNames.Add('Coptic');
  LanguageCodes.Add('cor');  LanguageNames.Add('Cornish');
  LanguageCodes.Add('cos');  LanguageNames.Add('Corsican');
  LanguageCodes.Add('cpe');  LanguageNames.Add('Creoles and Pidgins, English-based (Other)');
  LanguageCodes.Add('cpf');  LanguageNames.Add('Creoles and Pidgins, French-based (Other)');
  LanguageCodes.Add('cpp');  LanguageNames.Add('Creoles and Pidgins, Portuguese-based (Other)');
  LanguageCodes.Add('cre');  LanguageNames.Add('Cree');
  LanguageCodes.Add('crp');  LanguageNames.Add('Creoles and Pidgins (Other)	');
  LanguageCodes.Add('cus');  LanguageNames.Add('Cushitic (Other)');
  LanguageCodes.Add('cym');  LanguageNames.Add('Welsh	');
  LanguageCodes.Add('cze');  LanguageNames.Add('Czech');
  LanguageCodes.Add('dak');  LanguageNames.Add('Dakota');
  LanguageCodes.Add('dan');  LanguageNames.Add('Danish');
  LanguageCodes.Add('del');  LanguageNames.Add('Delaware');
  LanguageCodes.Add('deu');  LanguageNames.Add('German');
  LanguageCodes.Add('din');  LanguageNames.Add('Dinka	');
  LanguageCodes.Add('div');  LanguageNames.Add('Divehi');
  LanguageCodes.Add('doi');  LanguageNames.Add('Dogri	');
  LanguageCodes.Add('dra');  LanguageNames.Add('Dravidian (Other)');
  LanguageCodes.Add('dua');  LanguageNames.Add('Duala');
  LanguageCodes.Add('dum');  LanguageNames.Add('Dutch, Middle (ca. 1050-1350)');
  LanguageCodes.Add('dut');  LanguageNames.Add('Dutch	');
  LanguageCodes.Add('dyu');  LanguageNames.Add('Dyula');
  LanguageCodes.Add('dzo');  LanguageNames.Add('Dzongkha');
  LanguageCodes.Add('efi');  LanguageNames.Add('Efik');
  LanguageCodes.Add('egy');  LanguageNames.Add('Egyptian (Ancient)');
  LanguageCodes.Add('eka');  LanguageNames.Add('Ekajuk');
  LanguageCodes.Add('ell');  LanguageNames.Add('Greek, Modern (1453-)');
  LanguageCodes.Add('elx');  LanguageNames.Add('Elamite');
  LanguageCodes.Add('eng');  LanguageNames.Add('English');
  LanguageCodes.Add('enm');  LanguageNames.Add('English, Middle (ca. 1100-1500)');
  LanguageCodes.Add('epo');  LanguageNames.Add('Esperanto	');
  LanguageCodes.Add('esk');  LanguageNames.Add('Eskimo (Other)');
  LanguageCodes.Add('esl');  LanguageNames.Add('Spanish');
  LanguageCodes.Add('est');  LanguageNames.Add('Estonian');
  LanguageCodes.Add('eus');  LanguageNames.Add('Basque');
  LanguageCodes.Add('ewe');  LanguageNames.Add('Ewe');
  LanguageCodes.Add('ewo');  LanguageNames.Add('Ewondo');
  LanguageCodes.Add('fan');  LanguageNames.Add('Fang');
  LanguageCodes.Add('fao');  LanguageNames.Add('Faroese');
  LanguageCodes.Add('fas');  LanguageNames.Add('Persian');
  LanguageCodes.Add('fat');  LanguageNames.Add('Fanti');
  LanguageCodes.Add('fij');  LanguageNames.Add('Fijian');
  LanguageCodes.Add('fin');  LanguageNames.Add('Finnish');
  LanguageCodes.Add('fiu');  LanguageNames.Add('Finno-Ugrian (Other)');
  LanguageCodes.Add('fon');  LanguageNames.Add('Fon');
  LanguageCodes.Add('fra');  LanguageNames.Add('French');
  LanguageCodes.Add('fre');  LanguageNames.Add('French');
  LanguageCodes.Add('frm');  LanguageNames.Add('French, Middle (ca. 1400-1600)');
  LanguageCodes.Add('fro');  LanguageNames.Add('French, Old (842- ca. 1400)');
  LanguageCodes.Add('fry');  LanguageNames.Add('Frisian');
  LanguageCodes.Add('ful');  LanguageNames.Add('Fulah');
  LanguageCodes.Add('gaa');  LanguageNames.Add('Ga');
  LanguageCodes.Add('gae');  LanguageNames.Add('Gaelic (Scots)');
  LanguageCodes.Add('gai');  LanguageNames.Add('Irish');
  LanguageCodes.Add('gay');  LanguageNames.Add('Gayo');
  LanguageCodes.Add('gdh');  LanguageNames.Add('Gaelic (Scots)');
  LanguageCodes.Add('gem');  LanguageNames.Add('Germanic (Other)');
  LanguageCodes.Add('geo');  LanguageNames.Add('Georgian');
  LanguageCodes.Add('ger');  LanguageNames.Add('German');
  LanguageCodes.Add('gez');  LanguageNames.Add('Geez');
  LanguageCodes.Add('gil');  LanguageNames.Add('Gilbertese');
  LanguageCodes.Add('glg');  LanguageNames.Add('Gallegan');
  LanguageCodes.Add('gmh');  LanguageNames.Add('German, Middle High (ca. 1050-1500)');
  LanguageCodes.Add('goh');  LanguageNames.Add('German, Old High (ca. 750-1050)');
  LanguageCodes.Add('gon');  LanguageNames.Add('Gondi');
  LanguageCodes.Add('got');  LanguageNames.Add('Gothic');
  LanguageCodes.Add('grb');  LanguageNames.Add('Grebo');
  LanguageCodes.Add('grc');  LanguageNames.Add('Greek, Ancient (to 1453)');
  LanguageCodes.Add('gre');  LanguageNames.Add('Greek, Modern (1453-)');
  LanguageCodes.Add('grn');  LanguageNames.Add('Guarani');
  LanguageCodes.Add('guj');  LanguageNames.Add('Gujarati');
  LanguageCodes.Add('hai');  LanguageNames.Add('Haida');
  LanguageCodes.Add('hau');  LanguageNames.Add('Hausa');
  LanguageCodes.Add('haw');  LanguageNames.Add('Hawaiian');
  LanguageCodes.Add('heb');  LanguageNames.Add('Hebrew');
  LanguageCodes.Add('her');  LanguageNames.Add('Herero');
  LanguageCodes.Add('hil');  LanguageNames.Add('Hiligaynon');
  LanguageCodes.Add('him');  LanguageNames.Add('Himachali');
  LanguageCodes.Add('hin');  LanguageNames.Add('Hindi');
  LanguageCodes.Add('hmo');  LanguageNames.Add('Hiri Motu');
  LanguageCodes.Add('hun');  LanguageNames.Add('Hungarian');
  LanguageCodes.Add('hup');  LanguageNames.Add('Hupa');
  LanguageCodes.Add('hye');  LanguageNames.Add('Armenian');
  LanguageCodes.Add('iba');  LanguageNames.Add('Iban');
  LanguageCodes.Add('ibo');  LanguageNames.Add('Igbo');
  LanguageCodes.Add('ice');  LanguageNames.Add('Icelandic');
  LanguageCodes.Add('ijo');  LanguageNames.Add('Ijo');
  LanguageCodes.Add('iku');  LanguageNames.Add('Inuktitut');
  LanguageCodes.Add('ilo');  LanguageNames.Add('Iloko');
  LanguageCodes.Add('ina');  LanguageNames.Add('Interlingua (International Auxiliary language Association)');
  LanguageCodes.Add('inc');  LanguageNames.Add('Indic (Other)');
  LanguageCodes.Add('ind');  LanguageNames.Add('Indonesian');
  LanguageCodes.Add('ine');  LanguageNames.Add('Indo-European (Other)');
  LanguageCodes.Add('ine');  LanguageNames.Add('Interlingue');
  LanguageCodes.Add('ipk');  LanguageNames.Add('Inupiak');
  LanguageCodes.Add('ira');  LanguageNames.Add('Iranian (Other)');
  LanguageCodes.Add('iri');  LanguageNames.Add('Irish');
  LanguageCodes.Add('iro');  LanguageNames.Add('Iroquoian uages');
  LanguageCodes.Add('isl');  LanguageNames.Add('Icelandic');
  LanguageCodes.Add('ita');  LanguageNames.Add('Italian');
  LanguageCodes.Add('jav');  LanguageNames.Add('Javanese');
  LanguageCodes.Add('jaw');  LanguageNames.Add('Javanese');
  LanguageCodes.Add('jpn');  LanguageNames.Add('Japanese');
  LanguageCodes.Add('jpr');  LanguageNames.Add('Judeo-Persian');
  LanguageCodes.Add('jrb');  LanguageNames.Add('Judeo-Arabic');
  LanguageCodes.Add('kaa');  LanguageNames.Add('Kara-Kalpak');
  LanguageCodes.Add('kab');  LanguageNames.Add('Kabyle');
  LanguageCodes.Add('kac');  LanguageNames.Add('Kachin');
  LanguageCodes.Add('kal');  LanguageNames.Add('Greenlandic');
  LanguageCodes.Add('kam');  LanguageNames.Add('Kamba');
  LanguageCodes.Add('kan');  LanguageNames.Add('Kannada');
  LanguageCodes.Add('kar');  LanguageNames.Add('Karen');
  LanguageCodes.Add('kas');  LanguageNames.Add('Kashmiri	');
  LanguageCodes.Add('kat');  LanguageNames.Add('Georgian');
  LanguageCodes.Add('kau');  LanguageNames.Add('Kanuri');
  LanguageCodes.Add('kaw');  LanguageNames.Add('Kawi');
  LanguageCodes.Add('kaz');  LanguageNames.Add('Kazakh');
  LanguageCodes.Add('kha');  LanguageNames.Add('Khasi');
  LanguageCodes.Add('khi');  LanguageNames.Add('Khoisan (Other)');
  LanguageCodes.Add('khm');  LanguageNames.Add('Khmer');
  LanguageCodes.Add('kho');  LanguageNames.Add('Khotanese');
  LanguageCodes.Add('kik');  LanguageNames.Add('Kikuyu');
  LanguageCodes.Add('kin');  LanguageNames.Add('Kinyarwanda');
  LanguageCodes.Add('kir');  LanguageNames.Add('Kirghiz');
  LanguageCodes.Add('kok');  LanguageNames.Add('Konkani');
  LanguageCodes.Add('kom');  LanguageNames.Add('Komi');
  LanguageCodes.Add('kon');  LanguageNames.Add('Kongo');
  LanguageCodes.Add('kor');  LanguageNames.Add('Korean');
  LanguageCodes.Add('kpe');  LanguageNames.Add('Kpelle');
  LanguageCodes.Add('kro');  LanguageNames.Add('Kru');
  LanguageCodes.Add('kru');  LanguageNames.Add('Kurukh');
  LanguageCodes.Add('kua');  LanguageNames.Add('Kuanyama');
  LanguageCodes.Add('kum');  LanguageNames.Add('Kumyk');
  LanguageCodes.Add('kur');  LanguageNames.Add('Kurdish');
  LanguageCodes.Add('kus');  LanguageNames.Add('Kusaie');
  LanguageCodes.Add('kut');  LanguageNames.Add('Kutenai');
  LanguageCodes.Add('lad');  LanguageNames.Add('Ladino');
  LanguageCodes.Add('lah');  LanguageNames.Add('Lahnda');
  LanguageCodes.Add('lam');  LanguageNames.Add('Lamba');
  LanguageCodes.Add('lao');  LanguageNames.Add('Lao');
  LanguageCodes.Add('lat');  LanguageNames.Add('Latin');
  LanguageCodes.Add('lav');  LanguageNames.Add('Latvian');
  LanguageCodes.Add('lez');  LanguageNames.Add('Lezghian');
  LanguageCodes.Add('lin');  LanguageNames.Add('Lingala');
  LanguageCodes.Add('lit');  LanguageNames.Add('Lithuanian');
  LanguageCodes.Add('lol');  LanguageNames.Add('Mongo');
  LanguageCodes.Add('loz');  LanguageNames.Add('Lozi');
  LanguageCodes.Add('ltz');  LanguageNames.Add('Letzeburgesch');
  LanguageCodes.Add('lub');  LanguageNames.Add('Luba-Katanga');
  LanguageCodes.Add('lug');  LanguageNames.Add('Ganda');
  LanguageCodes.Add('lui');  LanguageNames.Add('Luiseno');
  LanguageCodes.Add('lun');  LanguageNames.Add('Lunda');
  LanguageCodes.Add('luo');  LanguageNames.Add('Luo (Kenya and Tanzania)');
  LanguageCodes.Add('mac');  LanguageNames.Add('Macedonian');
  LanguageCodes.Add('mad');  LanguageNames.Add('Madurese');
  LanguageCodes.Add('mag');  LanguageNames.Add('Magahi');
  LanguageCodes.Add('mah');  LanguageNames.Add('Marshall');
  LanguageCodes.Add('mai');  LanguageNames.Add('Maithili');
  LanguageCodes.Add('mak');  LanguageNames.Add('Macedonian');
  LanguageCodes.Add('mak');  LanguageNames.Add('Makasar');
  LanguageCodes.Add('mal');  LanguageNames.Add('Malayalam	');
  LanguageCodes.Add('man');  LanguageNames.Add('Mandingo');
  LanguageCodes.Add('mao');  LanguageNames.Add('Maori');
  LanguageCodes.Add('map');  LanguageNames.Add('Austronesian (Other)');
  LanguageCodes.Add('mar');  LanguageNames.Add('Marathi');
  LanguageCodes.Add('mas');  LanguageNames.Add('Masai');
  LanguageCodes.Add('max');  LanguageNames.Add('Manx');
  LanguageCodes.Add('may');  LanguageNames.Add('Malay');
  LanguageCodes.Add('men');  LanguageNames.Add('Mende');
  LanguageCodes.Add('mga');  LanguageNames.Add('Irish, Middle (900 - 1200)');
  LanguageCodes.Add('mic');  LanguageNames.Add('Micmac');
  LanguageCodes.Add('min');  LanguageNames.Add('Minangkabau');
  LanguageCodes.Add('mis');  LanguageNames.Add('Miscellaneous (Other)');
  LanguageCodes.Add('mkh');  LanguageNames.Add('Mon-Kmer (Other)');
  LanguageCodes.Add('mlg');  LanguageNames.Add('Malagasy');
  LanguageCodes.Add('mlt');  LanguageNames.Add('Maltese');
  LanguageCodes.Add('mni');  LanguageNames.Add('Manipuri');
  LanguageCodes.Add('mno');  LanguageNames.Add('Manobo Languages');
  LanguageCodes.Add('moh');  LanguageNames.Add('Mohawk');
  LanguageCodes.Add('mol');  LanguageNames.Add('Moldavian');
  LanguageCodes.Add('mon');  LanguageNames.Add('Mongolian');
  LanguageCodes.Add('mos');  LanguageNames.Add('Mossi');
  LanguageCodes.Add('mri');  LanguageNames.Add('Maori');
  LanguageCodes.Add('msa');  LanguageNames.Add('Malay');
  LanguageCodes.Add('mul');  LanguageNames.Add('Multiple Languages');
  LanguageCodes.Add('mun');  LanguageNames.Add('Munda Languages');
  LanguageCodes.Add('mus');  LanguageNames.Add('Creek');
  LanguageCodes.Add('mwr');  LanguageNames.Add('Marwari');
  LanguageCodes.Add('mya');  LanguageNames.Add('Burmese');
  LanguageCodes.Add('myn');  LanguageNames.Add('Mayan Languages');
  LanguageCodes.Add('nah');  LanguageNames.Add('Aztec');
  LanguageCodes.Add('nai');  LanguageNames.Add('North American Indian (Other)');
  LanguageCodes.Add('nau');  LanguageNames.Add('Nauru');
  LanguageCodes.Add('nav');  LanguageNames.Add('Navajo');
  LanguageCodes.Add('nbl');  LanguageNames.Add('Ndebele, South');
  LanguageCodes.Add('nde');  LanguageNames.Add('Ndebele, North');
  LanguageCodes.Add('ndo');  LanguageNames.Add('Ndongo');
  LanguageCodes.Add('nep');  LanguageNames.Add('Nepali');
  LanguageCodes.Add('new');  LanguageNames.Add('Newari');
  LanguageCodes.Add('nic');  LanguageNames.Add('Niger-Kordofanian (Other)');
  LanguageCodes.Add('niu');  LanguageNames.Add('Niuean');
  LanguageCodes.Add('nla');  LanguageNames.Add('Dutch');
  LanguageCodes.Add('nno');  LanguageNames.Add('Norwegian (Nynorsk)');
  LanguageCodes.Add('non');  LanguageNames.Add('Norse, Old');
  LanguageCodes.Add('nor');  LanguageNames.Add('Norwegian');
  LanguageCodes.Add('nso');  LanguageNames.Add('Sotho, Northern');
  LanguageCodes.Add('nub');  LanguageNames.Add('Nubian Languages');
  LanguageCodes.Add('nya');  LanguageNames.Add('Nyanja');
  LanguageCodes.Add('nym');  LanguageNames.Add('Nyamwezi');
  LanguageCodes.Add('nyn');  LanguageNames.Add('Nyankole');
  LanguageCodes.Add('nyo');  LanguageNames.Add('Nyoro	');
  LanguageCodes.Add('nzi');  LanguageNames.Add('Nzima');
  LanguageCodes.Add('oci');  LanguageNames.Add('Langue d''Oc (post 1500)');
  LanguageCodes.Add('oji');  LanguageNames.Add('Ojibwa');
  LanguageCodes.Add('ori');  LanguageNames.Add('Oriya');
  LanguageCodes.Add('orm');  LanguageNames.Add('Oromo');
  LanguageCodes.Add('osa');  LanguageNames.Add('Osage');
  LanguageCodes.Add('oss');  LanguageNames.Add('Ossetic');
  LanguageCodes.Add('ota');  LanguageNames.Add('Turkish, Ottoman (1500 - 1928)');
  LanguageCodes.Add('oto');  LanguageNames.Add('Otomian Languages');
  LanguageCodes.Add('paa');  LanguageNames.Add('Papuan-Australian (Other)');
  LanguageCodes.Add('pag');  LanguageNames.Add('Pangasinan');
  LanguageCodes.Add('pal');  LanguageNames.Add('Pahlavi');
  LanguageCodes.Add('pam');  LanguageNames.Add('Pampanga');
  LanguageCodes.Add('pan');  LanguageNames.Add('Panjabi');
  LanguageCodes.Add('pap');  LanguageNames.Add('Papiamento');
  LanguageCodes.Add('pau');  LanguageNames.Add('Palauan');
  LanguageCodes.Add('peo');  LanguageNames.Add('Persian, Old (ca 600 - 400 B.C.)');
  LanguageCodes.Add('per');  LanguageNames.Add('Persian');
  LanguageCodes.Add('phn');  LanguageNames.Add('Phoenician');
  LanguageCodes.Add('pli');  LanguageNames.Add('Pali');
  LanguageCodes.Add('pol');  LanguageNames.Add('Polish');
  LanguageCodes.Add('pon');  LanguageNames.Add('Ponape');
  LanguageCodes.Add('por');  LanguageNames.Add('Portuguese');
  LanguageCodes.Add('pra');  LanguageNames.Add('Prakrit uages');
  LanguageCodes.Add('pro');  LanguageNames.Add('Provencal, Old (to 1500)');
  LanguageCodes.Add('pus');  LanguageNames.Add('Pushto');
  LanguageCodes.Add('que');  LanguageNames.Add('Quechua');
  LanguageCodes.Add('raj');  LanguageNames.Add('Rajasthani');
  LanguageCodes.Add('rar');  LanguageNames.Add('Rarotongan');
  LanguageCodes.Add('roa');  LanguageNames.Add('Romance (Other)');
  LanguageCodes.Add('roh');  LanguageNames.Add('Rhaeto-Romance');
  LanguageCodes.Add('rom');  LanguageNames.Add('Romany');
  LanguageCodes.Add('ron');  LanguageNames.Add('Romanian');
  LanguageCodes.Add('rum');  LanguageNames.Add('Romanian');
  LanguageCodes.Add('run');  LanguageNames.Add('Rundi');
  LanguageCodes.Add('rus');  LanguageNames.Add('Russian');
  LanguageCodes.Add('sad');  LanguageNames.Add('Sandawe');
  LanguageCodes.Add('sag');  LanguageNames.Add('Sango');
  LanguageCodes.Add('sah');  LanguageNames.Add('Yakut');
  LanguageCodes.Add('sai');  LanguageNames.Add('South American Indian (Other)');
  LanguageCodes.Add('sal');  LanguageNames.Add('Salishan Languages');
  LanguageCodes.Add('sam');  LanguageNames.Add('Samaritan Aramaic');
  LanguageCodes.Add('san');  LanguageNames.Add('Sanskrit');
  LanguageCodes.Add('sco');  LanguageNames.Add('Scots');
  LanguageCodes.Add('scr');  LanguageNames.Add('Serbo-Croatian');
  LanguageCodes.Add('sel');  LanguageNames.Add('Selkup');
  LanguageCodes.Add('sem');  LanguageNames.Add('Semitic (Other)');
  LanguageCodes.Add('sga');  LanguageNames.Add('Irish, Old (to 900)');
  LanguageCodes.Add('shn');  LanguageNames.Add('Shan');
  LanguageCodes.Add('sid');  LanguageNames.Add('Sidamo');
  LanguageCodes.Add('sin');  LanguageNames.Add('Singhalese');
  LanguageCodes.Add('sio');  LanguageNames.Add('Siouan Languages');
  LanguageCodes.Add('sit');  LanguageNames.Add('Sino-Tibetan (Other)');
  LanguageCodes.Add('sla');  LanguageNames.Add('Slavic (Other)');
  LanguageCodes.Add('slk');  LanguageNames.Add('Slovak');
  LanguageCodes.Add('slo');  LanguageNames.Add('Slovak');
  LanguageCodes.Add('slv');  LanguageNames.Add('Slovenian');
  LanguageCodes.Add('smi');  LanguageNames.Add('Sami Languages');
  LanguageCodes.Add('smo');  LanguageNames.Add('Samoan');
  LanguageCodes.Add('sna');  LanguageNames.Add('Shona');
  LanguageCodes.Add('snd');  LanguageNames.Add('Sindhi');
  LanguageCodes.Add('sog');  LanguageNames.Add('Sogdian');
  LanguageCodes.Add('som');  LanguageNames.Add('Somali');
  LanguageCodes.Add('son');  LanguageNames.Add('Songhai');
  LanguageCodes.Add('sot');  LanguageNames.Add('Sotho, Southern');
  LanguageCodes.Add('spa');  LanguageNames.Add('Spanish');
  LanguageCodes.Add('sqi');  LanguageNames.Add('Albanian');
  LanguageCodes.Add('srd');  LanguageNames.Add('Sardinian	');
  LanguageCodes.Add('srr');  LanguageNames.Add('Serer');
  LanguageCodes.Add('ssa');  LanguageNames.Add('Nilo-Saharan (Other)');
  LanguageCodes.Add('ssw');  LanguageNames.Add('Siswant');
  LanguageCodes.Add('ssw');  LanguageNames.Add('Swazi');
  LanguageCodes.Add('suk');  LanguageNames.Add('Sukuma');
  LanguageCodes.Add('sun');  LanguageNames.Add('Sudanese');
  LanguageCodes.Add('sus');  LanguageNames.Add('Susu');
  LanguageCodes.Add('sux');  LanguageNames.Add('Sumerian');
  LanguageCodes.Add('sve');  LanguageNames.Add('Swedish');
  LanguageCodes.Add('swa');  LanguageNames.Add('Swahili');
  LanguageCodes.Add('swe');  LanguageNames.Add('Swedish');
  LanguageCodes.Add('syr');  LanguageNames.Add('Syriac');
  LanguageCodes.Add('tah');  LanguageNames.Add('Tahitian');
  LanguageCodes.Add('tam');  LanguageNames.Add('Tamil');
  LanguageCodes.Add('tat');  LanguageNames.Add('Tatar');
  LanguageCodes.Add('tel');  LanguageNames.Add('Telugu');
  LanguageCodes.Add('tem');  LanguageNames.Add('Timne');
  LanguageCodes.Add('ter');  LanguageNames.Add('Tereno');
  LanguageCodes.Add('tgk');  LanguageNames.Add('Tajik');
  LanguageCodes.Add('tgl');  LanguageNames.Add('Tagalog');
  LanguageCodes.Add('tha');  LanguageNames.Add('Thai');
  LanguageCodes.Add('tib');  LanguageNames.Add('Tibetan');
  LanguageCodes.Add('tig');  LanguageNames.Add('Tigre');
  LanguageCodes.Add('tir');  LanguageNames.Add('Tigrinya');
  LanguageCodes.Add('tiv');  LanguageNames.Add('Tivi');
  LanguageCodes.Add('tli');  LanguageNames.Add('Tlingit	');
  LanguageCodes.Add('tmh');  LanguageNames.Add('Tamashek');
  LanguageCodes.Add('tog');  LanguageNames.Add('Tonga (Nyasa)	');
  LanguageCodes.Add('ton');  LanguageNames.Add('Tonga (Tonga Islands)');
  LanguageCodes.Add('tru');  LanguageNames.Add('Truk');
  LanguageCodes.Add('tsi');  LanguageNames.Add('Tsimshian');
  LanguageCodes.Add('tsn');  LanguageNames.Add('Tswana');
  LanguageCodes.Add('tso');  LanguageNames.Add('Tsonga');
  LanguageCodes.Add('tuk');  LanguageNames.Add('Turkmen');
  LanguageCodes.Add('tum');  LanguageNames.Add('Tumbuka');
  LanguageCodes.Add('tur');  LanguageNames.Add('Turkish');
  LanguageCodes.Add('tut');  LanguageNames.Add('Altaic (Other)');
  LanguageCodes.Add('twi');  LanguageNames.Add('Twi');
  LanguageCodes.Add('tyv');  LanguageNames.Add('Tuvinian');
  LanguageCodes.Add('uga');  LanguageNames.Add('Ugaritic');
  LanguageCodes.Add('uig');  LanguageNames.Add('Uighur');
  LanguageCodes.Add('ukr');  LanguageNames.Add('Ukrainian');
  LanguageCodes.Add('umb');  LanguageNames.Add('Umbundu');
  LanguageCodes.Add('und');  LanguageNames.Add('Undetermined');
  LanguageCodes.Add('urd');  LanguageNames.Add('Urdu');
  LanguageCodes.Add('uzb');  LanguageNames.Add('Uzbek');
  LanguageCodes.Add('vai');  LanguageNames.Add('Vai');
  LanguageCodes.Add('ven');  LanguageNames.Add('Venda');
  LanguageCodes.Add('vie');  LanguageNames.Add('Vietnamese');
  LanguageCodes.Add('vol');  LanguageNames.Add('Volapük');
  LanguageCodes.Add('vot');  LanguageNames.Add('Votic');
  LanguageCodes.Add('wak');  LanguageNames.Add('Wakashan Languages');
  LanguageCodes.Add('wal');  LanguageNames.Add('Walamo');
  LanguageCodes.Add('war');  LanguageNames.Add('Waray');
  LanguageCodes.Add('was');  LanguageNames.Add('Washo');
  LanguageCodes.Add('wel');  LanguageNames.Add('Welsh');
  LanguageCodes.Add('wen');  LanguageNames.Add('Sorbian Languages');
  LanguageCodes.Add('wol');  LanguageNames.Add('Wolof');
  LanguageCodes.Add('xho');  LanguageNames.Add('Xhosa');
  LanguageCodes.Add('yao');  LanguageNames.Add('Yao');
  LanguageCodes.Add('yap');  LanguageNames.Add('Yap');
  LanguageCodes.Add('yid');  LanguageNames.Add('Yiddish');
  LanguageCodes.Add('yor');  LanguageNames.Add('Yoruba');
  LanguageCodes.Add('zap');  LanguageNames.Add('Zapotec');
  LanguageCodes.Add('zen');  LanguageNames.Add('Zenaga');
  LanguageCodes.Add('zha');  LanguageNames.Add('Zhuang');
  LanguageCodes.Add('zho');  LanguageNames.Add('Chinese');
  LanguageCodes.Add('zul');  LanguageNames.Add('Zulu');
  LanguageCodes.Add('zun');  LanguageNames.Add('Zuni');
finalization
 Genres.Free;
 LanguageCodes.Free;
 LanguageNames.Free;
end.

