unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ContNrs, Dialogs, ExtCtrls, StdCtrls, Vcl.ComCtrls, JPEG, Mp3FileUtils,
  id3v2Frames, ExtDlgs, Vcl.FileCtrl, IniFiles;

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
    Image1: TImage;
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
    DriveList: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileList: TFileListBox;
    GroupBox2: TGroupBox;
    BatchImage1: TImage;
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
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Button3: TButton;
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
    procedure ShowID3v2Level2;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FileListChange(Sender: TObject);
    procedure BatchButton2Click(Sender: TObject);
    procedure BatchButton1Click(Sender: TObject);
    procedure BatchCheckBox3Click(Sender: TObject);
    procedure BatchCheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private-Deklarationen }
    fNewPicureChoosed: Boolean;
    function ChangeLowToUpper(s: string): string;
    function ChangeStringToString(str, str1, str2: string): string;
    procedure ClearAll;
  public
    { Public-Deklarationen }
    procedure WriteOptions;
    procedure ReadOptions;
  end;

var
  Form1: TForm1;
  Id3v2Tag: TId3v2Tag;
  FileTag: TId3v2Tag;
  TIF : TIniFile;

implementation

{$R *.dfm}
procedure TForm1.WriteOptions;    // ################### Options Write
var OPT :string;
begin
   OPT := 'Options';

   if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Tags\')
   then ForceDirectories(ExtractFilePath(Application.ExeName) + 'Tags\');

   TIF := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Tags\Tags.ini');
   with TIF do
   begin
     WriteBool(OPT,'Tags',CheckBox6.Checked);
     if CheckBox6.Checked = true then begin
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
   Free;
   end;
   end;
end;

procedure TForm1.ReadOptions;    // ################### Options Read
var OPT:string;
begin
  OPT := 'Options';
  if FileExists(ExtractFilePath(Application.ExeName) + 'Tags\Tags.ini') then
  begin
  TIF:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Tags\Tags.ini');
  with TIF do
  begin
    CheckBox6.Checked:=ReadBool(OPT,'Tags',CheckBox6.Checked);
    if CheckBox6.Checked = true then begin
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
  Free;
  end;
  end;
  end;
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

procedure TForm1.FileListChange(Sender: TObject);
var
  stream: TFilestream;
begin
  ProgressBar1.Max := FileList.Count;
  //ClearAll;
  FileTag := TID3v2Tag.Create;
  if FileList.FileName = '' then exit;
  if FileExists(FileList.FileName) then
    try
    stream := TFileStream.Create(FileList.FileName, fmOpenRead or fmShareDenyWrite);
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
        BatchTrackEdit.Text := IntToStr(FileList.Count);
      end
      else
      ShowMessage('Can not read tag from the file: ' + FileList.FileName)
    finally
    FileTag.Free;
    stream.Free;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Id3v2Tag := TId3v2Tag.Create;
  fNewPicureChoosed := False;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Id3v2Tag.Free;
  WriteOptions;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ReadOptions;
end;

procedure TForm1.BatchButton1Click(Sender: TObject);
var
  FileTag: TID3v2Tag;
  i, j : integer;
  PictureData: TMemoryStream;
  Title, Name, Rename : string;
begin
  Beep;
  if MessageBox(Handle,'ATTENTION !'+#13+
             'Save Tags to all Files, are you sure ? : ','Confirm',MB_YESNO) = IDYES then
  BEGIN
  Screen.Cursor := crHourGlass;
  if BatchCheckBox2.Checked = true then
    begin
    fNewPicureChoosed := true;
    end else begin
    fNewPicureChoosed := False;
  end;

  FileTag := TID3v2Tag.Create;
  i := FileList.Count;

  try
    for j := 0 to i-1 do begin
    FileTag.Title := BatchEdit.Text;

    if BatchCheckBox1.Checked = true then begin
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

      if fNewPicureChoosed then   // Cover Intigration
      begin
        PictureData := TMemoryStream.Create;
        PictureData.LoadFromFile(OpenDialog2.FileName);
        FileTag.SetPicture('image/jpeg', 0, '*', PictureData);
        PictureData.Free;
      end;

      if BatchCheckBox3.Checked = true then begin
      Name := BatchEditRename.Text;
      Rename := Name + '_' + IntToStr(j+1) + '.mp3';
      RenameFile(FileList.Items.Strings[j], Rename);
      Sleep(50);
      FileTag.WriteToFile(Rename);
      end else begin
      FileTag.WriteToFile(FileList.Items.Strings[j]);
      end;

    ProgressBar1.Position := j;
    Label49.Caption := FileList.Items.Strings[j];
    Application.ProcessMessages;
    end;

    finally
    FileTag.Free;
    j := 0;
    i := 0;
    Label49.Caption := 'ready.';
    ProgressBar1.Position := ProgressBar1.Max;
    FileList.Clear;
    Screen.Cursor := crDefault;
  end;

  END;
end;

procedure TForm1.BatchButton2Click(Sender: TObject);
var jp: TJPEGImage;
begin
  if OpenDialog2.Execute then
  begin
    jp := TJpegImage.Create;
    try
      try
        jp.LoadFromFile(OpenDialog2.FileName);
        jp.DIBNeeded;
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
  if BatchCheckBox2.Checked = true then begin
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Opendialog1.Execute then
  begin
    Edit1.Text := Opendialog1.FileName;
    Button2Click(Nil);
  end;
  StatusBar1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
var stream: TFilestream;
begin
  fNewPicureChoosed := False;
  stream := TFileStream.Create(Edit1.Text, fmOpenRead or fmShareDenyWrite);

  try
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

  finally
  stream.free;
  end;

  ShowID3v2Level2;
  StatusBar1.SetFocus;
end;

procedure TForm1.ShowID3v2Level2;
var PictureData: TStream;
    jp: TJPEGImage;
begin
  PictureData := TMemoryStream.Create;
  id3v2Tag.GetPicture(PictureData, '*');
  try
      PictureData.Seek(0, soFromBeginning);
      jp := TJPEGImage.Create;
      try
        try
          jp.LoadFromStream(PictureData);
          jp.DIBNeeded;
          Image1.Picture.Bitmap.Assign(jp);
        except
          Image1.Picture.Assign(NIL);
        end;
      finally
        jp.Free;
      end;
  finally
      PictureData.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var jp: TJPEGImage;
begin
  if OpenPictureDialog1.Execute then
  begin
    jp := TJpegImage.Create;
    try
      try
        jp.LoadFromFile(OpenPictureDialog1.FileName);
        jp.DIBNeeded;
        Image1.Picture.Bitmap.Assign(jp);
        fNewPicureChoosed := True;
      except
        Image1.Picture.Assign(NIL);
        fNewPicureChoosed := False;
      end;
    finally
      jp.Free;
    end;
  end;
  StatusBar1.SetFocus;
end;

procedure TForm1.Button4Click(Sender: TObject);
var PictureData: TMemoryStream;
begin
  Screen.Cursor := crHourGlass;

  if CheckBox1.Checked = true then begin
  try
    id3v2Tag.Title := Edit2.Text;
    id3v2Tag.Album := Edit3.Text;
    id3v2Tag.Artist := Edit4.Text;
    id3v2Tag.Genre := Edit5.Text;
    id3v2Tag.Track := Edit6.Text;
    id3v2Tag.Year := Edit7.Text;
    id3v2Tag.Comment := Edit8.Text;

    if CheckBox5.Checked = true then begin
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

    Id3v2Tag.WriteToFile(Edit1.Text);
  finally
    StatusBar1.SimpleText := 'id3v2 Tags saved..';
    Sleep(25);
  end;
  end;

  if CheckBox2.Checked = true then begin
  try
  if fNewPicureChoosed then
  begin
      PictureData := TMemoryStream.Create;
      PictureData.LoadFromFile(OpenPictureDialog1.FileName);
      id3v2Tag.SetPicture('image/jpeg', 0, '*', PictureData);
      PictureData.Free;
  end;
  Id3v2Tag.WriteToFile(Edit1.Text);
  finally
    StatusBar1.SimpleText := 'Cover Image saved..';
    Sleep(25);
  end;
  end;
  StatusBar1.SetFocus;
  Screen.Cursor := crDefault;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ClearAll;
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

procedure TForm1.CheckBox1Click(Sender: TObject);
var i : integer;
begin
  if CheckBox1.Checked = false then begin
  for i := 2 to ComponentCount -1 do begin
  if (Components[i] is TEdit) then
    begin
    (Components[i] as TEdit).Enabled := false;
    end;
  end;

  for i := 1 to ComponentCount -1 do begin
  if (Components[i] is TLabel) then
    begin
    (Components[i] as TLabel).Enabled := false;
    end;
  end;
  end else begin
  for i := 2 to ComponentCount -1 do begin
  if (Components[i] is TEdit) then
    begin
    (Components[i] as TEdit).Enabled := true;
    end;
  end;

  for i := 1 to ComponentCount -1 do begin
  if (Components[i] is TLabel) then
    begin
    (Components[i] as TLabel).Enabled := true;
    end;
  end;
  end;


  Form1.Refresh;
  StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked = false then begin
  Button3.Enabled := false;

  end else begin
  Button3.Enabled := true;

  end;

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

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked = true then begin
  Memo1.Enabled := true;
  end else begin
  Memo1.Enabled := false;
  end;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  if CheckBox5.Checked = true then begin
  RadioButton1.Enabled := true; RadioButton2.Enabled := true;
  RadioButton3.Enabled := true; RadioButton4.Enabled := true;
  end else begin
  RadioButton1.Enabled := false; RadioButton2.Enabled := false;
  RadioButton3.Enabled := false; RadioButton4.Enabled := false;
  RadioButton1.Checked := false; RadioButton2.Checked := false;
  RadioButton3.Checked := false; RadioButton4.Checked := false;
  end;
end;

end.
