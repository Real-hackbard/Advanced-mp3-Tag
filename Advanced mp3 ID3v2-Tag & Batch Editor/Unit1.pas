unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ContNrs, Dialogs, ExtCtrls, StdCtrls, Vcl.ComCtrls, JPEG, Mp3FileUtils,
  id3v2Frames, ExtDlgs, Vcl.FileCtrl, IniFiles, Vcl.Buttons, Vcl.Menus;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    GroupBox6: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    CheckBox3: TCheckBox;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    Memo1: TMemo;
    CheckBox4: TCheckBox;
    Button4: TButton;
    OpenDialog2: TOpenDialog;
    GroupBox2: TGroupBox;
    Bevel1: TBevel;
    BatchCheckBox1: TCheckBox;
    BatchCheckBox3: TCheckBox;
    BatchEditRename: TEdit;
    BatchButton2: TButton;
    BatchCheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    TitleLabel: TLabel;
    TrackLabel: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    BatchEdit1: TEdit;
    BatchEdit2: TEdit;
    BatchEdit3: TEdit;
    BatchEdit4: TEdit;
    BatchEdit5: TEdit;
    BatchEdit6: TEdit;
    BatchEdit7: TEdit;
    BatchEdit8: TEdit;
    BatchEdit9: TEdit;
    BatchEdit10: TEdit;
    BatchButton1: TButton;
    BatchEdit: TEdit;
    BatchTrackEdit: TEdit;
    BatchEdit13: TEdit;
    BatchEdit14: TEdit;
    BatchEdit15: TEdit;
    BatchEdit16: TEdit;
    ProgressBar1: TProgressBar;
    BatchEdit17: TEdit;
    BatchEdit18: TEdit;
    BatchEdit19: TEdit;
    BatchEdit20: TEdit;
    BatchEdit21: TEdit;
    BatchEdit22: TEdit;
    Label50: TLabel;
    Bevel2: TBevel;
    CheckBox5: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    CheckBox6: TCheckBox;
    Button5: TButton;
    Edit26: TEdit;
    Edit27: TEdit;
    CheckBox7: TCheckBox;
    Image1: TImage;
    Label51: TLabel;
    PopupMenu1: TPopupMenu;
    Open1: TMenuItem;
    Label54: TLabel;
    Export1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Grayscale1: TMenuItem;
    Invert1: TMenuItem;
    SetOptimalSize1: TMenuItem;
    N1: TMenuItem;
    Remove1: TMenuItem;
    N2: TMenuItem;
    Button3: TButton;
    ListBox1: TListBox;
    Button6: TButton;
    BatchImage1: TImage;
    PopupMenu2: TPopupMenu;
    Clear1: TMenuItem;
    Remove2: TMenuItem;
    Label48: TLabel;
    Label49: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure BatchButton2Click(Sender: TObject);
    procedure BatchButton1Click(Sender: TObject);
    procedure BatchCheckBox3Click(Sender: TObject);
    procedure BatchCheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure Grayscale1Click(Sender: TObject);
    procedure Invert1Click(Sender: TObject);
    procedure SetOptimalSize1Click(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListBox1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Remove2Click(Sender: TObject);
  private
    { Private-Deklarationen }
    flbHorzScrollWidth: Integer;
    fNewPicureChoosed: Boolean;
    function ChangeLowToUpper(s: string): string;
    function ChangeStringToString(str, str1, str2: string): string;
    procedure ClearAll;
    procedure ShowID3v2Level2;
  public
    { Public-Deklarationen }
    procedure WriteOptions;
    procedure ReadOptions;
  end;

type
  TStringDynArray = array of string;

var
  Form1: TForm1;
  Id3v2Tag: TId3v2Tag;
  Id3v1Tag: TId3v1Tag;
  FileTag : TId3v2Tag;
  TIF : TIniFile;
  FileCount: Cardinal = 0;
  Files : TStringDynArray = nil;
  Dir : String;

implementation

{$R *.dfm}
procedure TForm1.WriteOptions;    // ################### Options Write
var
  OPT :string;
begin
   OPT := 'Options';

   if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Tags\')
   then ForceDirectories(ExtractFilePath(Application.ExeName) + 'Tags\');

   TIF := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Tags\Tags.ini');
   with TIF do
   begin
     WriteBool(OPT,'Tags',CheckBox6.Checked);
     if CheckBox6.Checked = true then
     begin
       WriteString(OPT,'Title', BatchEdit.Text);
       WriteString(OPT,'Album', BatchEdit2.Text);
       WriteString(OPT,'Artist', BatchEdit1.Text);
       WriteString(OPT,'Genre', BatchEdit4.Text);
       WriteString(OPT,'Year', BatchEdit3.Text);
       WriteString(OPT,'Comment', BatchEdit5.Text);
       WriteString(OPT,'URL', BatchEdit10.Text);
       WriteString(OPT,'Composer', BatchEdit6.Text);
       WriteString(OPT,'OriginalArtist', BatchEdit15.Text);
       WriteString(OPT,'Copyright', BatchEdit8.Text);
       WriteString(OPT,'Encoder', BatchEdit7.Text);
       WriteString(OPT,'Language', BatchEdit9.Text);
       WriteString(OPT,'Settings', BatchEdit16.Text);
       WriteString(OPT,'Media', BatchEdit17.Text);
       WriteString(OPT,'Length', BatchEdit18.Text);
       WriteString(OPT,'Publisher', BatchEdit19.Text);
       WriteString(OPT,'Lyri', BatchEdit20.Text);
       WriteString(OPT,'ReleaseYear', BatchEdit21.Text);
       WriteString(OPT,'AlbumTitle', BatchEdit22.Text);
     end;
      WriteBool(OPT,'id3v1',CheckBox7.Checked);
      WriteBool(OPT,'id3v2',CheckBox1.Checked);
      WriteBool(OPT,'Cover',CheckBox2.Checked);
      WriteBool(OPT,'Lyrics',CheckBox5.Checked);
      WriteBool(OPT,'EditLyrics',CheckBox4.Checked);
      WriteBool(OPT,'UTF8',RadioButton1.Checked);
      WriteBool(OPT,'Ansi',RadioButton2.Checked);
      WriteBool(OPT,'UTF8Boom',RadioButton3.Checked);
      WriteBool(OPT,'Unicode',RadioButton4.Checked);
    Free;
   end;
end;

procedure TForm1.ReadOptions;    // ################### Options Read
var
  OPT:string;
begin
  OPT := 'Options';
  if FileExists(ExtractFilePath(Application.ExeName) + 'Tags\Tags.ini') then
  begin
    TIF:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Tags\Tags.ini');
    with TIF do
    begin
      CheckBox6.Checked:=ReadBool(OPT,'Tags',CheckBox6.Checked);
      if CheckBox6.Checked = true then
      begin
        BatchEdit.Text:=ReadString(OPT,'Title',BatchEdit.Text);
        BatchEdit2.Text:=ReadString(OPT,'Album',BatchEdit2.Text);
        BatchEdit1.Text:=ReadString(OPT,'Artist',BatchEdit1.Text);
        BatchEdit4.Text:=ReadString(OPT,'Genre',BatchEdit4.Text);
        BatchEdit3.Text:=ReadString(OPT,'Year',BatchEdit3.Text);
        BatchEdit5.Text:=ReadString(OPT,'Comment',BatchEdit5.Text);
        BatchEdit10.Text:=ReadString(OPT,'URL',BatchEdit10.Text);
        BatchEdit6.Text:=ReadString(OPT,'Composer',BatchEdit6.Text);
        BatchEdit15.Text:=ReadString(OPT,'OriginalArtist',BatchEdit15.Text);
        BatchEdit8.Text:=ReadString(OPT,'Copyright',BatchEdit8.Text);
        BatchEdit7.Text:=ReadString(OPT,'Encoder',BatchEdit7.Text);
        BatchEdit9.Text:=ReadString(OPT,'Language',BatchEdit9.Text);
        BatchEdit16.Text:=ReadString(OPT,'Settings',BatchEdit16.Text);
        BatchEdit17.Text:=ReadString(OPT,'Media',BatchEdit17.Text);
        BatchEdit18.Text:=ReadString(OPT,'Length',BatchEdit18.Text);
        BatchEdit19.Text:=ReadString(OPT,'Publisher',BatchEdit19.Text);
        BatchEdit20.Text:=ReadString(OPT,'Lyri',BatchEdit20.Text);
        BatchEdit21.Text:=ReadString(OPT,'ReleaseYear',BatchEdit21.Text);
        BatchEdit22.Text:=ReadString(OPT,'AlbumTitle',BatchEdit22.Text);
      end;
        CheckBox7.Checked:=ReadBool(OPT,'id3v1',CheckBox7.Checked);
        CheckBox1.Checked:=ReadBool(OPT,'id3v2',CheckBox1.Checked);
        CheckBox2.Checked:=ReadBool(OPT,'Cover',CheckBox2.Checked);
        CheckBox5.Checked:=ReadBool(OPT,'Lyrics',CheckBox5.Checked);
        CheckBox4.Checked:=ReadBool(OPT,'EditLyrics',CheckBox4.Checked);
        RadioButton1.Checked:=ReadBool(OPT,'UTF8',RadioButton1.Checked);
        RadioButton2.Checked:=ReadBool(OPT,'Ansi',RadioButton2.Checked);
        RadioButton3.Checked:=ReadBool(OPT,'UTF8Boom',RadioButton3.Checked);
        RadioButton4.Checked:=ReadBool(OPT,'Unicode',RadioButton4.Checked);
      Free;
    end;
  end;
end;

function FindAllFiles(RootFolder: string; Mask: string = '*.*'; Recurse: Boolean
  = True): TStringDynArray;
var
  wfd : TWin32FindData;
  hFile : THandle;
begin
  if AnsiLastChar(RootFolder)^ <> '\' then
    RootFolder := RootFolder + '\';
  if Recurse then
  begin
    // Find all MP3 files in the folder.
    hFile := FindFirstFile(PChar(RootFolder + '*.mp3'), wfd);
    if hFile <> INVALID_HANDLE_VALUE then
    try
      repeat
        if wfd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY =
          FILE_ATTRIBUTE_DIRECTORY then
          if (string(wfd.cFileName) <> '.') and (string(wfd.cFileName) <> '..')
            then
            FindAllFiles(RootFolder + wfd.cFileName, Mask, Recurse);
      until FindNextFile(hFile, wfd) = False;
    finally
      windows.FindClose(hFile);
    end;
  end;                        // Specify the files to search for here.
  hFile := FindFirstFile(PChar(RootFolder + '*.mp3'), wfd);
  if hFile <> INVALID_HANDLE_VALUE then
  try
    repeat
      if wfd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY <>
        FILE_ATTRIBUTE_DIRECTORY then
      begin
        FileCount := length(Files)+1;
        Setlength(Files, FileCount);
        Files[FileCount - 1] := RootFolder + String(wfd.cFileName);
      end;
    until FindNextFile(hFile, wfd) = False;
  finally
    Windows.FindClose(hFile);
  end;
end;

procedure TForm1.Remove1Click(Sender: TObject);
begin
  Image1.Picture.Graphic := nil;
end;

procedure TForm1.Remove2Click(Sender: TObject);
var
  I : Integer;
begin
  ListBox1.Items.BeginUpdate; // Prevents the UI from flickering
  try
    for I := ListBox1.Items.Count - 1 downto 0 do
    begin
      if ListBox1.Selected[I] then
        ListBox1.Items.Delete(I);
    end;
  finally
    StatusBar1.Panels[1].Text := IntToStr(ListBox1.Items.Count);
    ListBox1.Items.EndUpdate; // Re-enables UI rendering
  end;
end;

{ The JPEG unit can convert the pixels to grayscale, but this function is
  faster and more accurate. }
procedure ImageGrayScale(var AnImage: TImage);
var
  JPGImage: TJPEGImage;
  BMPImage: TBitmap;
  MemStream: TMemoryStream;
begin
  BMPImage := TBitmap.Create;
  try
    BMPImage.Width  := AnImage.Picture.Bitmap.Width;
    BMPImage.Height := AnImage.Picture.Bitmap.Height;
    JPGImage := TJPEGImage.Create;
    try
      JPGImage.Assign(AnImage.Picture.Bitmap);
      JPGImage.CompressionQuality := 100;
      JPGImage.Compress;
      JPGImage.Grayscale := True;
      BMPImage.Canvas.Draw(0, 0, JPGImage);
      MemStream := TMemoryStream.Create;
      try
        BMPImage.SaveToStream(MemStream);
        //you need to reset the position of the MemoryStream to 0
        MemStream.Position := 0;
        AnImage.Picture.Bitmap.LoadFromStream(MemStream);
        AnImage.Refresh;
      finally
        MemStream.Free;
      end;
    finally
      JPGImage.Free;
    end;
  finally
    BMPImage.Free;
  end;
end;

// get file size of mp3 files
function Get_File_Size4(const S: string): Int64;
var
  FD: TWin32FindData;
  FH: THandle;
begin
  FH := FindFirstFile(PChar(S), FD);
  if FH = INVALID_HANDLE_VALUE then Result := 0
  else
    try
      Result := FD.nFileSizeHigh;
      Result := Result shl 32;
      Result := Result + FD.nFileSizeLow;
    finally
      //CloseHandle(FH);
    end;
end;

// Determine the version of the current ID3v2 metadata.
function GetID3v2Version(const FileName: string; var Major, Revision: Byte): Boolean;
var
  fs: TFileStream;
  Header: array[0..4] of AnsiChar;
begin
  Result := False;
  Major := 0;
  Revision := 0;
  fs := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    // The ID3v2 header is exactly 10 bytes long.
    if fs.Size < 10 then Exit;
    // Read the first 5 bytes ('ID3' + Major + Revision)
    fs.Read(Header, SizeOf(Header));
    // Check whether the 'ID3' signature is present.
    if (Header[0] = 'I') and (Header[1] = 'D') and (Header[2] = '3') then
    begin
      Major := Byte(Header[3]);
      Revision := Byte(Header[4]);
      Result := True;
    end;
  finally
    fs.Free;
  end;
end;

// // Determine the version of the current ID3v1 metadata.
function GetID3v1Version(const AFileName: string): string;
var
  fs: TFileStream;
  Buffer: array[0..127] of AnsiChar;
begin
  Result := 'Kein ID3v1';
  fs := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    // The ID3v1 tag is always located exactly 128 bytes before the end of the file.
    if fs.Size >= 128 then
    begin
      fs.Position := fs.Size - 128;
      fs.Read(Buffer, SizeOf(Buffer));
      // Check whether the identifier "TAG" is present.
      if (Buffer[0] = 'T') and (Buffer[1] = 'A') and (Buffer[2] = 'G') then
      begin
        // ID3v1.1 detection: Byte 125 must be 0, and byte 126 must not be a space or null.
        if (Buffer[125] = #0) and (Buffer[126] <> #0) then
          Result := 'v1: 1.1'
        else
          Result := 'v1: 1.0';
      end;
    end;
  finally
    fs.Free;
  end;
end;

procedure TForm1.Clear1Click(Sender: TObject);
begin
  ListBox1.Items.Clear;
end;

procedure TForm1.ClearAll;
begin
  { Clear all captions }
  BatchEdit.Text := '';
  BatchEdit1.Text := '';
  BatchEdit2.Text := '';
  BatchTrackEdit.Text := '';
  BatchEdit3.Text := '';
  BatchEdit4.Text := '';
  BatchEdit5.Text := '';
  BatchEdit6.Text := '';
  BatchEdit7.Text := '';
  BatchEdit8.Text := '';
  BatchEdit9.Text := '';
  BatchEdit10.Text := '';
  BatchTrackEdit.Text := '';
  BatchEdit14.Text := '';
  BatchEdit15.Text := '';
  BatchEdit16.Text := '';
  BatchEdit17.Text := '';
  BatchEdit18.Text := '';
  BatchEdit19.Text := '';
  BatchEdit20.Text := '';
  BatchEdit21.Text := '';
  BatchEdit22.Text := '';
end;

// Convert lowercase to uppercase.
function TForm1.ChangeLowToUpper(s: string): string;
const
  Symbols = ' _;.,1234567890';
var
  X: Integer;
begin
  Result := '';
  if Length(s) = 0 then
    exit;
  S[1] := AnsiUpperCase(s[1])[1];
  for X := 1 to length(s) do
    if POS(S[x], Symbols) <> 0 then begin
      if X <> Length(s) then
        S[x + 1] := AnsiUpperCase(s[x + 1])[1];
    end
    else
      S[x + 1] := AnsiLowerCase(S[x + 1])[1];
  Result := S;
end;

// involve changing encodings (e.g., AnsiString to UnicodeString), types, or casing.
function TForm1.ChangeStringToString(str, str1, str2: string): string;
var
  P, L: Integer;
begin
  Result := str;
  L := Length(Str1);
  repeat
    P := Pos(Str1, Result);
    if P > 0 then
    begin
      Delete(Result, P, L);
      Insert(Str2, Result, P);
    end;
  until P = 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.HintPause := 0;
  Application.HintHidePause := 50000;
  Listbox1.Perform(LB_SetHorizontalExtent, 1000, Longint(0));
  Id3v2Tag := TId3v2Tag.Create;
  Id3v1Tag := TId3v1Tag.Create;
  fNewPicureChoosed := False;    // check is cover loaded

  CheckBox7.Hint := 'Saves only the ID3v1 metadata, without modifying the ID3v2 data.';
  CheckBox1.Hint := 'Saves the ID3v2 metadata in its complete form.';
  CheckBox2.Hint := 'Embeds the loaded cover image into the MP3 file.' +#13#10+
                    'If "unchecked", any existing image is also removed from the file.';
  CheckBox5.Hint := 'Embeds the lyrics into the file in the selected Unicode format.';
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Id3v2Tag.Free;
  Id3v1Tag.Free;
  WriteOptions;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ReadOptions;
  BatchCheckBox3.OnClick(sender);
end;

procedure TForm1.Grayscale1Click(Sender: TObject);
var
  jpg : TJPEGImage;
  BWidth, BHeight: Integer;
begin
  if Grayscale1.Checked = true then
  begin
    // calculate image grayscale
    ImageGrayScale(Image1);
  end else begin
    jpg := TJpegImage.Create;
    try
      try
        jpg.LoadFromFile(OpenPictureDialog1.FileName);
        // Forces decoding into a bitmap to remove hidden data.
        // Detecting header errors immediately upon loading
        jpg.DIBNeeded;
        Image1.Picture.Bitmap.Assign(jpg);
        fNewPicureChoosed := True;
        Form1.Label51.Caption := ExtractFileName(Form1.OpenPictureDialog1.FileName);
        StatusBar1.Panels[5].Text := IntToStr(Get_File_Size4(Form1.OpenPictureDialog1.FileName) div 1000) + ' kb' + ' - ' +
                                     IntToStr(Jpg.Width) + 'x' + IntToStr(Jpg.Height);
        // The pixels are now available in BWidth and BHeight.
      except
        Image1.Picture.Assign(NIL);
        fNewPicureChoosed := False;
      end;
    finally
      jpg.Free;
    end;
  end;
end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
  Open1.OnClick(sender);
end;

// Create a negative from a JPEG
procedure TForm1.Invert1Click(Sender: TObject);
var
  Jpg: TJpegImage;
  Bmp: TBitmap;
  Row: Integer;
  Pixel: PByte; // Pointer to the color bytes
  WidthInBytes: Integer;
begin
  Jpg := TJpegImage.Create;
  Bmp := TBitmap.Create;
  try
    // 1. Load the JPG and assign it to the bitmap.
    Jpg.Assign(Image1.Picture.Graphic);
    // Pixels first need to be converted into bitmap pixels.
    Bmp.Assign(Jpg);
    // Force color depth to 24-bit (RGB)
    Bmp.PixelFormat := pf24bit;
    // 2. Manipulate pixel rows using ScanLine (significantly faster than Canvas.Pixels)
    for Row := 0 to Bmp.Height - 1 do
    begin
      // Get a pointer to the first byte of the current line
      Pixel := Bmp.ScanLine[Row];
      // Each pixel consists of 3 bytes (blue, green, red).
      WidthInBytes := Bmp.Width * 3;
      // Use the NOT operator to invert all bits (0–255).
      // (255 - Value) is mathematically identical to (not Value)
      while WidthInBytes > 0 do
      begin
        Pixel^ := not Pixel^;
        Inc(Pixel);
        Dec(WidthInBytes);
      end;
    end;
    // 3. Convert the inverted bitmap back to JPG format and save it.
    Jpg.Assign(Bmp);
    Image1.Picture.Graphic.Assign(jpg);
  finally
    Bmp.Free;
    Jpg.Free;
  end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  stream: TFilestream;
  PictureData: TMemoryStream;
  jp: TJPEGImage;
begin
  Screen.Cursor := crHourGlass;
  ProgressBar1.Max := ListBox1.Items.Count;
  //ClearAll;

  // Erstellen und Auslesen von ID3v2-Tags
  FileTag := TID3v2Tag.Create;
  // go out when no file loaded
  if Dir + '\' + ListBox1.Items.Strings[ListBox1.ItemIndex] = '' then exit;

  // check file exists
  if FileExists(Dir + '\' + ListBox1.Items.Strings[ListBox1.ItemIndex]) then
    try
      // Efficiently read data from or write data to a file
      stream := TFileStream.Create(Dir + '\' +
                                    ListBox1.Items.Strings[ListBox1.ItemIndex],
                                    fmOpenRead or fmShareDenyWrite);
      // get meta information from mp3
      FileTag.ReadFromStream(stream);
      if FileTag.Exists then
      begin
        BatchEdit.Text := FileTag.Title;
        BatchEdit1.Text := FileTag.Artist;
        BatchEdit2.Text := FileTag.Album;
        //if FileTag.Track > 0 then TrackEdit.Text := IntToStr(FileTag.Track);
        BatchEdit3.Text := FileTag.Year;
        BatchEdit4.Text := FileTag.Genre;
        BatchEdit5.Text := FileTag.Comment;
        BatchEdit6.Text := FileTag.Composer;
        BatchEdit7.Text := FileTag.EncodedBy;
        BatchEdit8.Text := FileTag.Copyright;
        BatchEdit9.Text := FileTag.Languages;
        BatchEdit10.Text := FileTag.URL;
        BatchEdit13.Text := IntToStr(FileTag.Rating);
        BatchEdit14.Text := IntToStr(FileTag.PlayCounter);
        BatchEdit15.Text := FileTag.OriginalArtist;
        BatchEdit16.Text := FileTag.SoftwareSettings;
        BatchEdit17.Text := FileTag.Mediatype;
        BatchEdit18.Text := FileTag.id3Length;
        BatchEdit19.Text := FileTag.Publisher;
        BatchEdit20.Text := FileTag.OriginalLyricist;
        BatchEdit21.Text := FileTag.OriginalReleaseYear;
        BatchEdit22.Text := FileTag.OriginalAlbumTitel;
        BatchTrackEdit.Text := IntToStr(ListBox1.Items.Count);

        try
          // create cover memory address
          PictureData := TMemoryStream.Create;
          // load listbox file
          PictureData.LoadFromFile(Dir + '\' +
                                    ListBox1.Items.Strings[ListBox1.ItemIndex]);
          // extract picture from file when exists
          FileTag.GetPicture(PictureData, '*');
          // data stream using the Seek or Position properties to parse or read raw data.
          PictureData.Seek(0, soFromBeginning);
          jp := TJPEGImage.Create;
          try
            try
              { This can trigger an error during debugging if the MP3 does not
                contain cover art. The error code is "JPEG Error 42";
                this is generally ignored. }
              jp.LoadFromStream(PictureData);
              // Forces decoding into a bitmap to remove hidden data.
              // Detecting header errors immediately upon loading
              jp.DIBNeeded;
              BatchImage1.Picture.Bitmap.Assign(jp);
              // Create a backup so you can access the image if necessary.
              Jp.SaveToFile(ExtractFilePath(Application.ExeName) + 'Backup\cover.jpg');
              Sleep(50);
              StatusBar1.Panels[3].Text := IntToStr(Get_File_Size4(Dir + '\' +
                                  ListBox1.Items.Strings[ListBox1.ItemIndex]) div 1000) + ' kb';
              StatusBar1.Panels[5].Text := IntToStr(Get_File_Size4(ExtractFilePath(Application.ExeName) + 'Backup\cover.jpg') div 1000) + ' kb' + ' - ' +
                                           IntToStr(Jp.Width) + 'x' + IntToStr(Jp.Height);
            except
              BatchImage1.Picture.Assign(nil);
            end;
          finally
            jp.Free;
          end;
        finally
          PictureData.Free;
        end;
      end
      else
      ShowMessage('Can not read tag from the file: ' + Dir + '\' +
                                  ListBox1.Items.Strings[ListBox1.ItemIndex])
    finally
      FileTag.Free;
      stream.Free;
      StatusBar1.Panels[1].Text := ListBox1.Items.Strings[ListBox1.ItemIndex];
    end;
  Screen.Cursor := crDefault;
end;

// create a horizontal scrollbar to ListBox
procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
 Len: Integer;
 NewText: String;
begin
  NewText:=Listbox1.Items[Index];

  with Listbox1.Canvas do
  begin
    FillRect(Rect);
    TextOut(Rect.Left + 1, Rect.Top, NewText);
    Len:=TextWidth(NewText) + Rect.Left + 10;
    if Len>flbHorzScrollWidth then
    begin
      flbHorzScrollWidth:=Len;
      Listbox1.Perform(LB_SETHORIZONTALEXTENT, flbHorzScrollWidth, 0 );
    end;
  end;
end;

procedure TForm1.Open1Click(Sender: TObject);
var
  jpg : TJPEGImage;
  BWidth, BHeight: Integer;
begin
  if OpenPictureDialog1.Execute then
  begin
    jpg := TJpegImage.Create;
    try
      try
        jpg.LoadFromFile(OpenPictureDialog1.FileName);
        // Forces decoding into a bitmap to remove hidden data.
        // Detecting header errors immediately upon loading
        jpg.DIBNeeded;
        Image1.Picture.Bitmap.Assign(jpg);
        // Image selected
        fNewPicureChoosed := True;

        Form1.Label51.Caption := ExtractFileName(Form1.OpenPictureDialog1.FileName);
        StatusBar1.Panels[5].Text := IntToStr(Get_File_Size4(Form1.OpenPictureDialog1.FileName) div 1000) + ' kb' + ' - ' +
                                     IntToStr(Jpg.Width) + 'x' + IntToStr(Jpg.Height);
        // create cover picture backup
        Jpg.SaveToFile(ExtractFilePath(Application.ExeName) + 'Backup\cover.jpg');
        // Nun stehen die Pixel in BWidth und BHeight zur Verfügung
      except
        Image1.Picture.Assign(NIL);
        // Deselect cover picture
        fNewPicureChoosed := False;
      end;
    finally
      jpg.Free;
    end;
  end;
  StatusBar1.SetFocus;
end;

// beginning batch process
procedure TForm1.BatchButton1Click(Sender: TObject);
var
  FileTag: TID3v2Tag;
  i, j : integer;
  PictureData: TMemoryStream;
  Title, Name, Rename : string;
begin
  Beep;
  if MessageBox(Handle,'ATTENTION !'+#13+
             'Batch is starting, all tags will be overwritten; are you sure?','Confirm',MB_YESNO) = IDYES then
  BEGIN
    Screen.Cursor := crHourGlass;
    Button5.Enabled := false;
    BatchButton1.Enabled := false;

    // Integrate covers for all images.
    if BatchCheckBox2.Checked = true then
      begin
        fNewPicureChoosed := true;
      end else begin
        fNewPicureChoosed := False;
    end;

    FileTag := TID3v2Tag.Create;
    // count mp3 files
    i := ListBox1.Items.Count;

    try
      for j := 0 to i-1 do
      begin
        FileTag.Title := BatchEdit.Text;

        // Pass the title in uppercase.
        if BatchCheckBox1.Checked = true then
        begin
          Title := UpperCase(BatchEdit.Text);
          FileTag.Title := Title;
        end;

        FileTag.Artist := BatchEdit1.Text;
        FileTag.Album := BatchEdit2.Text;
        FileTag.Year := BatchEdit3.Text;
        FileTag.Genre := BatchEdit4.Text;
        FileTag.Comment := BatchEdit5.Text;
        FileTag.Composer := BatchEdit6.Text;
        FileTag.EncodedBy := BatchEdit7.Text;
        FileTag.Copyright := BatchEdit8.Text;
        FileTag.Languages := BatchEdit9.Text;
        FileTag.URL := BatchEdit10.Text;
        FileTag.Track := IntToStr(j+1);
        //FileTag.PlayCounter := StrToInt(BatchEdit14.Text);
        //FileTag.Rating := StrToInt(BatchEdit13.Text);
        FileTag.OriginalArtist := BatchEdit15.Text;
        FileTag.SoftwareSettings := BatchEdit16.Text;
        FileTag.Mediatype := BatchEdit17.Text;
        FileTag.id3Length := BatchEdit18.Text;
        FileTag.Publisher := BatchEdit19.Text;
        FileTag.OriginalLyricist := BatchEdit20.Text;
        FileTag.OriginalReleaseYear := BatchEdit21.Text;
        FileTag.OriginalAlbumTitel := BatchEdit22.Text;

        // Cover Intigration
        if fNewPicureChoosed then
        begin
          // Reserve cover image in memory.
          PictureData := TMemoryStream.Create;
          // Load the previously saved cover backup.
          PictureData.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Backup\cover.jpg');
          // Integrate the image into the metadata.
          FileTag.SetPicture('image/jpeg', 0, '*', PictureData);
          // Make the image available again.
          PictureData.Free;
        end;

        // Here, all files are renamed using a numbered naming scheme.
        if BatchCheckBox3.Checked = true then
        begin
          // read the new name
          Name := BatchEditRename.Text;
          // Write the corresponding number after the name.
          Rename := Name + '_' + IntToStr(j+1) + '.mp3';
          // reanem the file
          RenameFile(Dir + '\' + ListBox1.Items.Strings[j],Dir + '\' + Rename);
          // Not necessary for an SSD.
          Sleep(50);
          // Write all meta information to the MP3.
          FileTag.WriteToFile(Rename);
        end else begin
          FileTag.WriteToFile(Dir + '\' + ListBox1.Items.Strings[j]);
        end;

        ProgressBar1.Position := j;
        StatusBar1.Panels[1].Text := ListBox1.Items.Strings[j];
        Application.ProcessMessages;
      end;
      finally
        FileTag.Free;
        j := 0;
        i := 0;
        StatusBar1.Panels[1].Text := 'Batch process finish.';
        StatusBar1.Panels[3].Text := '0 kb';
        StatusBar1.Panels[1].Text := '-';
        ProgressBar1.Position := ProgressBar1.Max;
        ListBox1.Clear;
        BatchImage1.Picture.Graphic := nil;
        Screen.Cursor := crDefault;
        Button5.Enabled := true;
        BatchButton1.Enabled := true;
        Label49.Caption := '0';
    end;
  END;
end;

// Load cover art for all MP3 files.
procedure TForm1.BatchButton2Click(Sender: TObject);
var
  jp: TJPEGImage;
begin
  if OpenDialog2.Execute then
  begin
    jp := TJpegImage.Create;
    try
      try
        jp.LoadFromFile(OpenDialog2.FileName);
        // Forces decoding into a bitmap to remove hidden data.
        // Detecting header errors immediately upon loading
        jp.DIBNeeded;
        // save cover as backup
        Jp.SaveToFile(ExtractFilePath(Application.ExeName) + 'Backup\cover.jpg');
        BatchImage1.Picture.Bitmap.Assign(jp);
        fNewPicureChoosed := True;
      except
        BatchImage1.Picture.Assign(NIL);
        fNewPicureChoosed := False;
      end;
    finally
      jp.Free;
    end;
  end;
end;

procedure TForm1.BatchCheckBox2Click(Sender: TObject);
begin
  if BatchCheckBox2.Checked = true then
  begin
    BatchButton2.Enabled := true;
  end else begin
    BatchButton2.Enabled := false;
  end;
end;

procedure TForm1.BatchCheckBox3Click(Sender: TObject);
begin
  if BatchCheckBox3.Checked = true then begin
    BatchEditRename.Enabled := true;
   end else begin
    BatchEditRename.Enabled := false;
  end;
end;

// load mp3 file
procedure TForm1.Button1Click(Sender: TObject);
var
  jpg : TJPEGImage;
begin
  if Opendialog1.Execute then
  begin
    Screen.Cursor := crHourGlass;
    Edit1.Text := Opendialog1.FileName;
    StatusBar1.Panels[1].Text := ExtractFileName(OpenDialog1.FileName);
    // get file soze from mp3
    StatusBar1.Panels[3].Text := IntToStr(Get_File_Size4(OpenDialog1.FileName) div 1000) + ' kb';
    Button2.Enabled := true;
    Button2Click(Nil);

    // enable image contex menu
    if CheckBox1.Checked = true then
    begin
      Open1.Enabled := true;
      Remove1.Enabled := true;
      Export1.Enabled := true;
      Grayscale1.Enabled := true;
      Invert1.Enabled := true;
      SetOptimalSize1.Enabled := true;
    end;

    // Retrieve the information for the loaded cover image.
    if Image1.Picture.Graphic <> nil then
    begin
      jpg := TJpegImage.Create;
        try
          jpg.Assign(Image1.Picture.Graphic);
          jpg.DIBNeeded;
          fNewPicureChoosed := True;
          Jpg.SaveToFile(ExtractFilePath(Application.ExeName) + 'Backup\cover.jpg');
          StatusBar1.Panels[5].Text := IntToStr(Get_File_Size4(ExtractFilePath(Application.ExeName) + 'Backup\cover.jpg') div 1000) + ' kb' + ' - ' +
                                           IntToStr(Jpg.Width) + 'x' + IntToStr(Jpg.Height);
        finally
          fNewPicureChoosed := False;
          jpg.Free;
        end;
    end;

  end;
  Screen.Cursor := crDefault;
end;

// write Id3v1Tag & Id3v2Tag meta data to file
procedure TForm1.Button2Click(Sender: TObject);
var
  stream : TFilestream;
  Maj, Rev: Byte;
begin
  fNewPicureChoosed := False;

  try
    // ID3v1 tag metadata is determined here.
    stream := TFileStream.Create(Edit1.Text, fmOpenRead or fmShareDenyWrite);
    Id3v1Tag.ReadFromStream(stream);
    Edit2.Text := Id3v1Tag.Title;
    Edit3.Text := Id3v1Tag.Album;
    Edit4.Text := Id3v1Tag.Artist;
    Edit5.Text := Id3v1Tag.Genre;
    Edit6.Text := Id3v1Tag.Track;
    Edit7.Text := Id3v1Tag.Year;
    Edit8.Text := Id3v1Tag.Comment;
    Edit27.Text := GetID3v1Version(Edit1.Text);
  finally
    stream.Free;
  end;

  try
    // ID3v2 tag metadata is determined here.
    stream := TFileStream.Create(Edit1.Text, fmOpenRead or fmShareDenyWrite);
    Id3v2Tag.ReadFromStream(stream);
    Edit2.Text := Id3v2Tag.Title;
    Edit3.Text := Id3v2Tag.Album;
    Edit4.Text := Id3v2Tag.Artist;
    Edit5.Text := Id3v2Tag.Genre;
    Edit6.Text := Id3v2Tag.Track;
    Edit7.Text := Id3v2Tag.Year;
    Edit8.Text := Id3v2Tag.Comment;
    Edit9.Text := Id3v2Tag.Lyrics;
    Memo1.Text := Id3v2Tag.Lyrics;
    Edit10.Text := Id3v2Tag.URL;
    Edit11.Text := IntToStr(Id3v2Tag.Rating);
    Edit12.Text := IntToStr(Id3v2Tag.PlayCounter);
    Edit13.Text := Id3v2Tag.Composer;
    Edit14.Text := Id3v2Tag.OriginalArtist;
    Edit15.Text := Id3v2Tag.Copyright;
    Edit16.Text := Id3v2Tag.EncodedBy;
    Edit17.Text := Id3v2Tag.Languages;
    Edit18.Text := Id3v2Tag.SoftwareSettings;
    Edit19.Text := Id3v2Tag.Mediatype;
    Edit20.Text := Id3v2Tag.id3Length;
    Edit21.Text := Id3v2Tag.Publisher;
    Edit22.Text := Id3v2Tag.OriginalFilename;
    Edit23.Text := Id3v2Tag.OriginalLyricist;
    Edit24.Text := Id3v2Tag.OriginalReleaseYear;
    Edit25.Text := Id3v2Tag.OriginalAlbumTitel;
     // Determine the metadata version.
     if GetID3v2Version(Edit1.Text, Maj, Rev) then
     Edit26.Text :=  (Format('v2: 2.%d.%d', [Maj, Rev]))
      else
        Edit26.Text :=  ('No ID3v2-Tag found!');
  finally
    stream.free;
  end;
  // Determine the metadata cover
  ShowID3v2Level2;
end;

// clear the tag informations
procedure TForm1.Button3Click(Sender: TObject);
var
  i : integer;
begin
  for i := 2 to 27 do
    begin
      TEdit(findcomponent('Edit' + inttostr(i))).Clear;
    end;

  Open1.Enabled := false;
  Remove1.Enabled := false;
  Export1.Enabled := false;
  Grayscale1.Enabled := false;
  Invert1.Enabled := false;
  SetOptimalSize1.Enabled := false;
  Memo1.Clear;
  Image1.Picture.Graphic := nil;
  Button2.Enabled := false;
end;

// Here, the cover image is resized to the optimal dimensions.
procedure TForm1.SetOptimalSize1Click(Sender: TObject);
var
  jpg: TJPEGImage;
  bmp: TBitmap;
begin
  jpg := TJPEGImage.Create;
  bmp := TBitmap.Create;
  try
    jpg.Assign(Image1.Picture.Graphic);
    // new width
    bmp.Width  := 300;
    // new height
    bmp.Height := 300;
    // stretch the graphic
    bmp.Canvas.StretchDraw(Rect(0, 0, 300, 300), jpg);
    // copy pixels
    jpg.Assign(bmp);
    // Pass the pixels of the image component.
    Image1.Picture.Graphic.Assign(jpg);
    StatusBar1.Panels[5].Text := IntToStr(Get_File_Size4(OpenPictureDialog1.FileName) div 1000) + ' kb' + ' - ' +
                                       IntToStr(Jpg.Width) + 'x' + IntToStr(Jpg.Height);
  finally
    bmp.Free;
    jpg.Free;
  end;
end;

procedure TForm1.ShowID3v2Level2;
var
  PictureData: TStream;
  jp: TJPEGImage;
begin
  PictureData := TMemoryStream.Create;
  try
    id3v2Tag.GetPicture(PictureData, '*');
      PictureData.Seek(0, soFromBeginning);
      jp := TJPEGImage.Create;
      try
        try
          { This can trigger an error during debugging if the MP3 does not
                contain cover art. The error code is "JPEG Error 42";
                this is generally ignored. }
          jp.LoadFromStream(PictureData);
          // Forces decoding into a bitmap to remove hidden data.
          // Detecting header errors immediately upon loading
          jp.DIBNeeded;
          Image1.Picture.Bitmap.Assign(jp);
        except
          Image1.Picture.Assign(nil);
        end;
      finally
        jp.Free;
      end;
  finally
      PictureData.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  PictureData: TMemoryStream;
begin
  Screen.Cursor := crHourGlass;

  // write only id3v1Tag version 1.0-1.1
  if CheckBox7.Checked = true then
  begin
    id3v1Tag.Title := Edit2.Text;
    id3v1Tag.Album := Edit3.Text;
    id3v1Tag.Artist := Edit4.Text;
    id3v1Tag.Genre := Edit5.Text;
    id3v1Tag.Track := Edit6.Text;
    id3v1Tag.Year := Edit7.Text;
    id3v1Tag.Comment := Edit8.Text;
    Id3v1Tag.WriteToFile(Edit1.Text);
  end;

  // write only id3v2Tag version 2.0-2.4
  if CheckBox1.Checked = true then
  begin
    try
      id3v2Tag.Title := Edit2.Text;
      id3v2Tag.Album := Edit3.Text;
      id3v2Tag.Artist := Edit4.Text;
      id3v2Tag.Genre := Edit5.Text;
      id3v2Tag.Track := Edit6.Text;
      id3v2Tag.Year := Edit7.Text;
      id3v2Tag.Comment := Edit8.Text;

      // unicode for lyrics text
      if CheckBox5.Checked = true then
      begin
        if RadioButton1.Checked = true then Memo1.Lines.Encoding.UTF8;
        if RadioButton1.Checked = true then Memo1.Lines.Encoding.ANSI;
        if RadioButton1.Checked = true then Memo1.Lines.Encoding.BigEndianUnicode;
        if RadioButton1.Checked = true then Memo1.Lines.Encoding.Unicode;
        id3v2Tag.Lyrics := Memo1.Text;
      end;

      id3v2Tag.URL := Edit10.Text;
      id3v2Tag.Rating := StrToInt(Edit11.Text);
      id3v2Tag.PlayCounter := StrToInt(Edit12.Text);
      id3v2Tag.Composer := Edit13.Text;
      id3v2Tag.OriginalArtist := Edit14.Text;
      id3v2Tag.Copyright := Edit15.Text;
      id3v2Tag.EncodedBy := Edit16.Text;
      id3v2Tag.Languages := Edit17.Text;
      id3v2Tag.SoftwareSettings := Edit18.Text;
      id3v2Tag.Mediatype := Edit19.Text;
      id3v2Tag.id3Length := Edit20.Text;
      id3v2Tag.Publisher := Edit21.Text;
      id3v2Tag.OriginalFilename := Edit22.Text;
      id3v2Tag.OriginalLyricist := Edit23.Text;
      id3v2Tag.OriginalReleaseYear := Edit24.Text;
      id3v2Tag.OriginalAlbumTitel := Edit25.Text;
    except
    end;
  end;

  // The cover image is integrated here.
  if CheckBox2.Checked = true then
  begin
    try
      if fNewPicureChoosed then
      begin
        Screen.Cursor := crHourGlass;
        PictureData := TMemoryStream.Create;
        PictureData.LoadFromFile(OpenPictureDialog1.FileName);
        id3v2Tag.SetPicture('image/jpeg', 0, '*', PictureData);
        PictureData.Free;
        Sleep(35);
        Screen.Cursor := crDefault;
      end;
    except
    end;
  end else begin
      begin
        // If the CheckBox is unchecked, the existing cover image is removed.
        id3v2Tag.SetPicture('',0,'', nil);
      end;
  end;

  // write complete information
  Id3v2Tag.WriteToFile(Edit1.Text);
  StatusBar1.SetFocus;
  Screen.Cursor := crDefault;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ClearAll;
end;

// Precise loading and locating of all MP3 files in a folder.
procedure TForm1.Button6Click(Sender: TObject);
var
  i : Integer;
begin
  if SelectDirectory('Select a directory', '', Dir) = true then
  begin
    Files := nil;
    ListBox1.Clear;
    Edit1.Text := Dir;
    // pass the search to the function
    FindAllFiles(Dir, '*.*', True);

    for i := 0 to length(Files) - 1 do
    begin
      // List the found MP3 files.
      Listbox1.Items.Add(ExtractFileName(Files[i]));
      // update form
      Application.ProcessMessages;
    end;
    // Count the MP3 files found.
    Label49.Caption := IntToStr(i) + ' Tracks found.';
  end;
end;

procedure TForm1.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
  if NOT (Key in [#08, '0'..'9']) then
    Key := #0;
end;

procedure TForm1.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if NOT (Key in [#08, '0'..'9']) then
    Key := #0;
end;

// Export the existing cover image if necessary.
procedure TForm1.Export1Click(Sender: TObject);
var
  jpg: TJPEGImage;
begin
  if SaveDialog1.Execute then
  begin
    jpg := TJPEGImage.Create;
    try
      // Assign image from TImage
      jpg.Assign(Image1.Picture.Graphic);

      // Adjust quality (optional; the default is often 80 or 90)
      jpg.CompressionQuality := 85;
      jpg.Compress;

      // save cover
      jpg.SaveToFile(SaveDialog1.FileName + '.jpg');
    finally
      jpg.Free;
    end;
  end;
end;

// the CheckBox “Save id3v2 Tags”
procedure TForm1.CheckBox1Click(Sender: TObject);
var
  i : integer;
begin
  // deactivate all edit boxes.
  if CheckBox1.Checked = false then
  begin
    for i := 2 to ComponentCount -1 do
    begin
      if (Components[i] is TEdit) then
        begin
          (Components[i] as TEdit).Enabled := false;
        end;
    end;

    // deactivate all labels.
    for i := 1 to ComponentCount -1 do
    begin
      if (Components[i] is TLabel) then
        begin
        (Components[i] as TLabel).Enabled := false;
        end;
    end;
  end else begin
    // Activate all edit boxes.
    for i := 2 to ComponentCount -1 do
    begin
      if (Components[i] is TEdit) then
        begin
        (Components[i] as TEdit).Enabled := true;
        end;
    end;

    // Activate all labels.
    for i := 1 to ComponentCount -1 do
    begin
      if (Components[i] is TLabel) then
        begin
        (Components[i] as TLabel).Enabled := true;
        end;
      end;
  end;

  CheckBox7.OnClick(sender);
  Form1.Refresh;
  StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked = true then begin
    SetWindowPos(Handle, HWND_TOPMOST, Left,Top, Width,Height,
               SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end else begin
    SetWindowPos(Handle, HWND_NOTOPMOST, Left,Top, Width,Height,
               SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end;
  StatusBar1.SetFocus;
end;

// deaktivate lyrics text memo
procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked = true then
  begin
    Memo1.Enabled := true;
  end else begin
    Memo1.Enabled := false;
  end;
end;

// select unicode
procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  if CheckBox5.Checked = true then
  begin
    RadioButton1.Enabled := true; RadioButton2.Enabled := true;
    RadioButton3.Enabled := true; RadioButton4.Enabled := true;
  end else begin
    RadioButton1.Enabled := false; RadioButton2.Enabled := false;
    RadioButton3.Enabled := false; RadioButton4.Enabled := false;
    RadioButton1.Checked := false; RadioButton2.Checked := false;
    RadioButton3.Checked := false; RadioButton4.Checked := false;
  end;
end;

// Selection of ID3v1 tags
procedure TForm1.CheckBox7Click(Sender: TObject);
var
  i : integer;
begin
  if CheckBox7.Checked = true then
  begin
    for i := 1 to 9 do
     begin
        TEdit(findcomponent('Edit' + inttostr(i))).Enabled := true;
     end;
  end;

  if CheckBox1.Checked = false then
  begin
    for i := 9 to 25 -1 do
    begin
      TEdit(findcomponent('Edit' + inttostr(i))).Enabled := false;
    end;
  end;
end;

end.
