
unit ID3v2Frames;
{$I config.inc}
interface
uses
  SysUtils, Classes, Windows, dialogs, U_CharCode
  {$IFDEF USE_TNT_COMPOS}, TntSysUtils, TntClasses{$ENDIF};
type
  {$IFDEF USE_TNT_COMPOS}
      TMPFUFileStream = TTNTFileStream;
  {$ELSE}
      TMPFUFileStream = TFileStream;
  {$ENDIF}
  {$IFNDEF UNICODE}
      UnicodeString = WideString;
  {$ENDIF}
  TID3v2FrameTypes = (FT_INVALID, FT_UNKNOWN,
                      FT_TextFrame,
                      FT_CommentFrame,
                      FT_LyricFrame,
                      FT_UserDefinedURLFrame,
                      FT_PictureFrame,
                      FT_PopularimeterFrame,
                      FT_URLFrame,
                      FT_UserTextFrame
                      );
  TID3v2FrameVersions = (FV_2 = 2, FV_3, FV_4);
  TFrameFlags = (FF_TagAlter, FF_FileAlter, FF_ReadOnly, FF_UnknownStatus,
                 FF_Compression, FF_Encryption, FF_GroupID, FF_Unsync, FF_DataLength, FF_UnknownFormat);
const TFrameFlagValues : Array [TID3v2FrameVersions] of Array [TFrameFlags] of Byte =
             (
              (0,0,0,0,0,0,0,0,0,0),  
              (128, 64, 32, 31, 128, 64, 32, 0, 0, 31 ),
              (128, 64, 32, 31,   8,  4, 64, 2, 1, 176)
             );
Type TFrameIDs = (
  IDv2_UNKNOWN,
  IDv2_MP3FileUtilsExperimental, 
  IDv2_ARTIST, IDv2_TITEL, IDv2_ALBUM, IDv2_YEAR, IDv2_GENRE,  
  IDv2_TRACK, IDv2_COMPOSER, IDv2_ORIGINALARTIST, IDv2_COPYRIGHT, IDv2_ENCODEDBY, 
  IDv2_LANGUAGES, IDv2_SOFTWARESETTINGS, IDv2_MEDIATYPE, IDv2_LENGTH, IDv2_PUBLISHER,  
  IDv2_ORIGINALFILENAME, IDv2_ORIGINALLYRICIST, IDv2_ORIGINALRELEASEYEAR, IDv2_ORIGINALALBUMTITEL,
  IDv2_BPM, IDv2_PLAYLISTDELAY, IDv2_FILETYPE, IDv2_INITIALKEY, IDv2_BANDACCOMPANIMENT, 
  IDv2_CONDUCTORREFINEMENT, IDv2_INTERPRETEDBY, IDv2_PARTOFASET, IDv2_ISRC, IDv2_CONTENTGROUPDESCRIPTION,  
  IDv2_SUBTITLEREFINEMENT, IDv2_LYRICIST, IDv2_FILEOWNER, IDv2_INTERNETRADIONAME, IDv2_INTERNETRADIOOWNER, 
  IDv2_ENCODINGTIME, IDv2_RECORDINGTIME, IDv2_RELEASETIME, IDv2_TAGGINGTIME, IDv2_MUSICIANCREDITLIST, 
  IDv2_MOOD, IDv2_PRODUCEDNOTICE, IDv2_ALBUMSORTORDER, IDv2_PERFORMERSORTORDER, IDv2_TITLESORTORDER, IDv2_SETSUBTITLE,
  IDv2_USERDEFINEDTEXT,
  IDv2_AUDIOFILEURL, IDv2_ARTISTURL, IDv2_AUDIOSOURCEURL, IDv2_COMMERCIALURL, IDv2_COPYRIGHTURL,
  IDv2_PUBLISHERSURL, IDv2_RADIOSTATIONURL, IDv2_PAYMENTURL,
  IDv2_PICTURE, IDv2_LYRICS, IDv2_COMMENT, IDv2_RATING, IDv2_USERDEFINEDURL, IDv2_RECOMMENDEDBUFFERSIZE, 
  IDv2_PLAYCOUNTER, IDv2_AUDIOENCRYPTION, IDv2_EVENTTIMINGCODES, IDv2_EQUALIZATION, IDv2_GENERALOBJECT, 
  IDv2_LINKEDINFORMATION, IDv2_MUSICCDID, IDv2_MPEGLOOKUPTABLE, IDv2_REVERB, IDv2_VOLUMEADJUSTMENT,    
  IDv2_SYNCHRONIZEDLYRICS, IDv2_SYNCEDTEMPOCODES, IDv2_UNIQUEFILEID,
  IDv2_COMMERCIALFRAME, IDv2_ENCRYPTIONMETHODREGISTRATION, IDv2_GROUPIDREGISTRATION, IDv2_OWNERSHIP,
  IDv2_PRIVATE, IDv2_POSITIONSYNCHRONISATION, IDv2_TERMSOFUSE, IDv2_SEEKPOINTINDEX, IDv2_SEEKFRAME,
  IDv2_SIGNATURE,
  IDv2_INVOLVEDPEOPLE, IDv2_ENCRYPTEDMETAFRAME, IDv2_RECORDINGDATES, IDv2_DATE, IDv2_TIME, IDv2_SIZE
  )  ;
type
  TTextEncoding = (TE_Ansi, TE_UTF16, TE_UTF16BE, UTF8);
  TID3v2FrameDescriptionData = record
      IDs: Array[TID3v2FrameVersions] of AnsiString;           
      Description: String;                                     
  end;
  TBuffer = Array of byte;
  TID3v2Frame = class(TObject)
      private
          fVersion: TID3v2FrameVersions;  
          fIDString: AnsiString;          
          fID: TFrameIDs;                 
          fHeader: TBuffer;
          fData: TBuffer;
          fGroupID: Byte;
          fDataLength: Integer; 
          fAlwaysWriteUnicode: Boolean;
          fAutoCorrectCodepage: Boolean; 
          fCharCode: TCodePage;
          fParsable: Boolean;
          function ValidFrameID: Boolean;
          function GetFrameType: TID3v2FrameTypes;    
          function GetFrameTypeDescription: String;   
          function GetFrameTypeID: TFrameIDs;
          function GetFlagTagAlterPreservation: Boolean;
          function GetFlagFileAlterPreservation: Boolean;
          function GetFlagReadOnly: Boolean;
          function GetFlagCompression: Boolean;
          function GetFlagEncryption : Boolean;
          function GetFlagGroupingIdentity : Boolean;
          procedure SetFlagGroupingIdentity(Value: Boolean);
          function GetFlagUnsynchronisation : Boolean;
          function GetFlagDataLengthIndicator : Boolean;
          function GetUnknownStatusFlags: Boolean;
          function GetUnknownEncodingFlags: Boolean;
          procedure SetFlag(aFlag: TFrameFlags);
          procedure UnSetFlag(aFlag: TFrameFlags);
          procedure UnSetFlagSomeFlagsAfterDataSet;
          function GetDataSize: Integer;
          procedure SyncStream(Source, Target: TStream; aSize: Integer);
          procedure UpdateHeader(aSize: Integer = -1); 
          function IsUnicodeNeeded(aString: UnicodeString): Boolean;   
          function GetConvertedUnicodeText(Start, Ende: integer; TextEncoding: TTextEncoding): UnicodeString;
          function WideStringToData(Value: UnicodeString; start: integer; UnicodeIsNeeded: Boolean): integer;
          function AnsiStringToData(Value: AnsiString; start: integer): integer;
      public
          property FrameType: TID3v2FrameTypes read GetFrameType;
          property FrameTypeDescription: String read GetFrameTypeDescription;   
          property FrameIDString: AnsiString read fIDString;                    
          property FrameID: TFrameIDs read GetFrameTypeID;
          property FlagTagAlterPreservation : Boolean read  GetFlagTagAlterPreservation;
          property FlagFileAlterPreservation: Boolean read  GetFlagFileAlterPreservation;
          property FlagReadOnly             : Boolean read  GetFlagReadOnly;
          property FlagCompression          : Boolean read  GetFlagCompression;
          property FlagEncryption           : Boolean read  GetFlagEncryption;
          property FlagGroupingIndentity    : Boolean read  GetFlagGroupingIdentity write SetFlagGroupingIdentity;
          property FlagUnsynchronisation    : Boolean read  GetFlagUnsynchronisation;
          property FlagDataLengthIndicator  : Boolean read  GetFlagDataLengthIndicator;
          property FlagUnknownStatus        : Boolean read  GetUnknownStatusFlags;
          property FlagUnknownEncoding      : Boolean read  GetUnknownEncodingFlags;
          property GroupID  : Byte read fGroupID write fGroupID;
          property DataSize : Integer read  GetDataSize;
          property AlwaysWriteUnicode: Boolean read fAlwaysWriteUnicode write fAlwaysWriteUnicode;
          property CharCode: TCodePage read fCharCode write fCharCode;
          property AutoCorrectCodepage: Boolean read fAutoCorrectCodepage write fAutoCorrectCodepage;
          constructor Create(aID: AnsiString; aVersion: TID3v2FrameVersions); 
          procedure ReadFromStream(aStream: tStream); 
          procedure WriteToStream(aStream: tStream);  
          procedure WriteUnsyncedToStream(aStream: TStream);
          function GetText: UnicodeString;
          procedure SetText(Value: UnicodeString);
          function GetUserText(out Description: UnicodeString): UnicodeString;
          procedure SetUserText(Description, Value: UnicodeString);
          function GetCommentsLyrics(out Language: AnsiString; out Description: UnicodeString): UnicodeString;
          procedure SetCommentsLyrics(Language: AnsiString; Description, Value: UnicodeString);
          function GetUserdefinedURL(out Description: UnicodeString): AnsiString;
          procedure SetUserdefinedURL(Description: UnicodeString; URL: AnsiString);
          function GetURL: AnsiString;
          procedure SetURL(Value: AnsiString);
          function GetPicture(out Mime: AnsiString; out PicType: Byte; out Description: UnicodeString; PictureData: TStream): Boolean;
          procedure SetPicture(Mime: AnsiString; PicType: Byte; Description: UnicodeString; PictureData: TStream);
          function GetRating(out UserEMail: AnsiString): Byte;
          procedure SetRating(UserEMail: AnsiString; Value: Byte);
          function GetPersonalPlayCounter(out UserEMail: AnsiString): Cardinal;
          procedure SetPersonalPlayCounter(UserEMail: AnsiString; Value: Cardinal);
          function GetPrivateFrame(out OwnerID: AnsiString; Data: TStream): Boolean;
          procedure SetPrivateFrame(aOwnerID: AnsiString; Data: TStream);
          procedure GetData(Data: TStream);
          procedure SetData(Data: TStream);
  end;
const  ID3v2KnownFrames : Array[TFrameIDs] of TID3v2FrameDescriptionData =
        (  
           ( IDs: ('XXX', 'XXXX', 'XXXX') ; Description : 'Unknown/experimental Frame'),
           ( IDs: ('XMP', 'XMP3', 'XMP3') ; Description : 'Mp3FileUtils experimental Frame'),
           ( IDs: ('TP1', 'TPE1', 'TPE1') ; Description : 'Lead artist(s)/Lead performer(s)/Soloist(s)/Performing group'),
           ( IDs: ('TT2', 'TIT2', 'TIT2') ; Description : 'Title/Songname/Content description'),
           ( IDs: ('TAL', 'TALB', 'TALB') ; Description : 'Album/Movie/Show title'),
           ( IDs: ('TYE', 'TYER', 'TDRC') ; Description : 'Year'),
           ( IDs: ('TCO', 'TCON', 'TCON') ; Description : 'Content type'),
           ( IDs: ('TRK', 'TRCK', 'TRCK') ; Description : 'Track number/Position in set'),
           ( IDs: ('TCM', 'TCOM', 'TCOM') ; Description : 'Composer'),
           ( IDs: ('TOA', 'TOPE', 'TOPE') ; Description : 'Original artist(s)/performer(s)'),
           ( IDs: ('TCR', 'TCOP', 'TCOP') ; Description : 'Copyright message'),
           ( IDs: ('TEN', 'TENC', 'TENC') ; Description : 'Encoded by'),
           ( IDs: ('TLA', 'TLAN', 'TLAN') ; Description : 'Language(s)'),
           ( IDs: ('TSS', 'TSSE', 'TSSE') ; Description : 'Software/hardware and settings used for encoding'),
           ( IDs: ('TMT', 'TMED', 'TMED') ; Description : 'Media type'),
           ( IDs: ('TLE', 'TLEN', 'TLEN') ; Description : 'Length'),
           ( IDs: ('TPB', 'TPUB', 'TPUB') ; Description : 'Publisher'),
           ( IDs: ('TOF', 'TOFN', 'TOFN') ; Description : 'Original filename'),
           ( IDs: ('TOL', 'TOLY', 'TOLY') ; Description : 'Original Lyricist(s)/text writer(s)'),
           ( IDs: ('TOR', 'TORY', 'TDOR') ; Description : 'Original release year'),
           ( IDs: ('TOT', 'TOAL', 'TOAL') ; Description : 'Original album/Movie/Show title'),
           ( IDs: ('TBP', 'TBPM', 'TBPM') ; Description : 'BPM (Beats Per Minute)'),
           ( IDs: ('TDY', 'TDLY', 'TDLY') ; Description : 'Playlist delay'),
           ( IDs: ('TFT', 'TFLT', 'TFLT') ; Description : 'File type'),
           ( IDs: ('TKE', 'TKEY', 'TKEY') ; Description : 'Initial key'),
           ( IDs: ('TP2', 'TPE2', 'TPE2') ; Description : 'Band/Orchestra/Accompaniment'),
           ( IDs: ('TP3', 'TPE3', 'TPE3') ; Description : 'Conductor/Performer refinement'),
           ( IDs: ('TP4', 'TPE4', 'TPE4') ; Description : 'Interpreted, remixed, or otherwise modified by'),
           ( IDs: ('TPA', 'TPOS', 'TPOS') ; Description : 'Part of a set'),
           ( IDs: ('TRC', 'TSRC', 'TSRC') ; Description : 'ISRC (International Standard Recording Code)'),
           ( IDs: ('TT1', 'TIT1', 'TIT1') ; Description : 'Content group description'),
           ( IDs: ('TT3', 'TIT3', 'TIT3') ; Description : 'Subtitle/Description refinement'),
           ( IDs: ('TXT', 'TEXT', 'TEXT') ; Description : 'Lyricist/text writer'),
           ( IDs: ('---', 'TOWN', 'TOWN') ; Description : 'File owner/licensee'),
           ( IDs: ('---', 'TRSN', 'TRSN') ; Description : 'Internet radio station name'),
           ( IDs: ('---', 'TRSO', 'TRSO') ; Description : 'Internet radio station owner'),
           ( IDs: ('---', '----', 'TDEN') ; Description : 'Encoding time'),
           ( IDs: ('---', '----', 'TDRC') ; Description : 'Recording time'),
           ( IDs: ('---', '----', 'TDRL') ; Description : 'Release time'),
           ( IDs: ('---', '----', 'TDTG') ; Description : 'Tagging time'),
           ( IDs: ('---', '----', 'TMCL') ; Description : 'Musician credits list'),
           ( IDs: ('---', '----', 'TMOO') ; Description : 'Mood'),
           ( IDs: ('---', '----', 'TPRO') ; Description : 'Produced notice'),
           ( IDs: ('---', '----', 'TSOA') ; Description : 'Album sort order'),
           ( IDs: ('---', '----', 'TSOP') ; Description : 'Performer sort order'),
           ( IDs: ('---', '----', 'TSOT') ; Description : 'Title sort order'),
           ( IDs: ('---', '----', 'TSST') ; Description : 'Set subtitle'),
           ( IDs: ('TXX', 'TXXX', 'TXXX') ; Description : 'User defined text information frame'),
           ( IDs: ('WAF', 'WOAF', 'WOAF') ; Description : 'Official audio file webpage'),
           ( IDs: ('WAR', 'WOAR', 'WOAR') ; Description : 'Official artist/performer webpage'),
           ( IDs: ('WAS', 'WOAS', 'WOAS') ; Description : 'Official audio source webpage'),
           ( IDs: ('WCM', 'WCOM', 'WCOM') ; Description : 'Commercial information'),
           ( IDs: ('WCP', 'WCOP', 'WCOP') ; Description : 'Copyright/Legal information'),
           ( IDs: ('WPB', 'WPUB', 'WPUB') ; Description : 'Publishers official webpage'),
           ( IDs: ('---', 'WORS', 'WORS') ; Description : 'Official internet radio station homepage'),
           ( IDs: ('---', 'WPAY', 'WPAY') ; Description : 'Payment'),
           ( IDs: ('PIC', 'APIC', 'APIC') ; Description : 'Attached picture'),
           ( IDs: ('ULT', 'USLT', 'USLT') ; Description : 'Unsychronized lyric/text transcription'),
           ( IDs: ('COM', 'COMM', 'COMM') ; Description : 'Comments'),
           ( IDs: ('POP', 'POPM', 'POPM') ; Description : 'Popularimeter'),
           ( IDs: ('WXX', 'WXXX', 'WXXX') ; Description : 'User defined URL link frame'),
           ( IDs: ('BUF', 'RBUF', 'RBUF') ; Description : 'Recommended buffer size'),
           ( IDs: ('CNT', 'PCNT', 'PCNT') ; Description : 'Play counter'),
           ( IDs: ('CRA', 'AENC', 'AENC') ; Description : 'Audio encryption'),
           ( IDs: ('ETC', 'ETCO', 'ETCO') ; Description : 'Event timing codes'),
           ( IDs: ('EQU', 'EQUA', 'EQU2') ; Description : 'Equalization'),
           ( IDs: ('GEO', 'GEOB', 'GEOB') ; Description : 'General encapsulated object'),
           ( IDs: ('LNK', 'LINK', 'LINK') ; Description : 'Linked information'),
           ( IDs: ('MCI', 'MCDI', 'MCDI') ; Description : 'Music CD Identifier'),
           ( IDs: ('MLL', 'MLLT', 'MLLT') ; Description : 'MPEG location lookup table'),
           ( IDs: ('REV', 'RVRB', 'RVRB') ; Description : 'Reverb'),
           ( IDs: ('RVA', 'RVAD', 'RVA2') ; Description : 'Relative volume adjustment'),
           ( IDs: ('SLT', 'SYLT', 'SYLT') ; Description : 'Synchronized lyric/text'),
           ( IDs: ('STC', 'SYTC', 'SYTC') ; Description : 'Synced tempo codes'),
           ( IDs: ('UFI', 'UFID', 'UFID') ; Description : 'Unique file identifier'),
           ( IDs: ('---', 'COMR', 'COMR') ; Description : 'Commercial frame'),
           ( IDs: ('---', 'ENCR', 'ENCR') ; Description : 'Encryption method registration'),
           ( IDs: ('---', 'GRID', 'GRID') ; Description : 'Group identification registration'),
           ( IDs: ('---', 'OWNE', 'OWNE') ; Description : 'Ownership frame'),
           ( IDs: ('PRV', 'PRIV', 'PRIV') ; Description : 'Private frame'),
           ( IDs: ('---', 'POSS', 'POSS') ; Description : 'Position synchronisation frame'),
           ( IDs: ('---', 'USER', 'USER') ; Description : 'Terms of use'),
           ( IDs: ('---', '----', 'ASPI') ; Description : 'Audio seek point index'),
           ( IDs: ('---', '----', 'SEEK') ; Description : 'Seek frame'),
           ( IDs: ('---', '----', 'SIGN') ; Description : 'Signature frame'),
           ( IDs: ('IPL', 'IPLS', 'TIPL') ; Description : 'Involved people list'),
           ( IDs: ('CRM', '----', '----') ; Description : 'Encrypted meta frame'),
           ( IDs: ('TRD', 'TRDA', '----') ; Description : 'Recording dates'),
           ( IDs: ('TDA', 'TDAT', '----') ; Description : 'Date'),
           ( IDs: ('TIM', 'TIME', '----') ; Description : 'Time'),
           ( IDs: ('TSI', 'TSIZ', '----') ; Description : 'Size')
        );
        Picture_Types: Array[0..20] of string =      
          (	'Other',
            '32x32 pixels file icon (PNG only)',
            'Other file icon',
            'Cover (front)',
            'Cover (back)',
            'Leaflet page',
            'Media (e.g. lable side of CD)',
            'Lead artist/lead performer/soloist',
            'Artist/performer',
            'Conductor',
            'Band/Orchestra',
            'Composer',
            'Lyricist/text writer',
            'Recording Location',
            'During recording',
            'During performance',
            'Movie/video screen capture',
            'A bright coloured fish',
            'Illustration',
            'Band/artist logotype',
            'Publisher/Studio logotype' );
function UnSyncStream(Source, Target: TStream): Boolean;
procedure SetStreamEnd(aStream: TStream);
implementation
function ByteToTextEncoding(Value: Byte): TTextEncoding;
begin
  case Value of
    0: result := TE_Ansi;
    1: result := TE_UTF16;
    2: result := TE_UTF16BE;
    3: result := UTF8
  else
    result := TE_Ansi;
  end;
end;
function UnSyncStream(Source, Target: TStream): Boolean;
var buf: TBuffer;
    i, last: Int64;
const
    zero: byte = 0;
begin
    result := false;
    setlength(buf, Source.Size);
    Source.Read(buf[0], length(buf));
    i := 0;
    last := 0;
    while i <= length(buf)-1 do
    begin
        While (i < length(buf)-2)
              and
              ( (buf[i] <> $FF)
                 or
               ( (buf[i+1] <> $00) and (buf[i+1] < $E0) )
              )
        do
            inc(i);
        if (buf[i] = $FF) and
               ( (buf[i+1] = $00) or (buf[i+1] >= $E0) )
        then
        begin
            Target.Write(buf[last], i - last + 1);
            Target.Write(zero, SizeOf(Zero));
            last := i + 1;
            inc(i, 1);   
            result := True;
        end else
        begin
            Target.Write(buf[last], length(buf) - last);
            if buf[length(buf)-1] = $FF then
            begin
                result := True;
                Target.Write(zero, SizeOf(Zero));
            end;
            i := length(buf);
        end;
    end;
end;
procedure SetStreamEnd(aStream: TStream);
begin
  if aStream is THandleStream then
    SetEndOfFile((aStream as THandleStream).Handle)
  else
    if aStream is TMemoryStream then
      TMemoryStream(aStream).SetSize(aStream.Position);
end;
constructor TID3v2Frame.Create(aID: AnsiString; aVersion: TID3v2FrameVersions);
begin
    inherited Create;
    fVersion := aVersion;
    fIDString := aID;
    fID := IDv2_UNKNOWN;
    fParsable := True;
    if fVersion = FV_2 then
    begin
        Setlength(fHeader, 6);
        if not ValidFrameID then
          fIDString := 'XXX';
    end
    else
    begin
        Setlength(fHeader, 10);
        if not ValidFrameID  then
          fIDString := 'XXXX';
    end;
    move(fIDString[1], fHeader[0], length(fIDString));
    fAlwaysWriteUnicode := False;
    fCharCode := DefaultCharCode;
    fAutoCorrectCodepage := False;
end;
procedure TID3v2Frame.SyncStream(Source, Target: TStream; aSize: Integer);
var buf: TBuffer;
    i, last: Int64;
begin
    setlength(buf, aSize);
    Source.Read(buf[0], aSize);
    Target.Size := aSize;
    i := 0;
    last := 0;
    while i <= length(buf)-1 do
    begin
        While (i < length(buf)-2) and ((buf[i] <> $FF) or (buf[i+1] <> $00)) do
            inc(i);
        if (buf[i] = $FF) and (buf[i+1] = $00) then
        begin
            Target.Write(buf[last], i - last + 1);
            last := i + 2;
            inc(i, 2);   
        end else
        begin
            Target.Write(buf[last], length(buf) - last);
            i := length(buf); 
        end;
    end;
    SetStreamEnd(Target);
end;
procedure TID3v2Frame.ReadFromStream(aStream: tStream);
var locSize: Integer;
    DataOffset: Integer;
    SyncedStream: TStream;
begin
  locSize := 0;
  fParsable := True;
  aStream.Read(fHeader[length(fIDString)], length(fHeader) - length(fIDString));
  case fVersion of
    FV_2: begin  locSize := 65536 * fHeader[3]
                + 256 * fHeader[4]
                + fHeader[5];
                fParsable := True;
    end;
    FV_3: begin  locSize := 16777216 * fHeader[4]
                + 65536 * fHeader[5]
                + 256 * fHeader[6]
                + fHeader[7];
                if (fHeader[9] and $DF) <> 0 then
                    fParsable := False;
    end;
    FV_4: begin  locSize := 2097152 * fHeader[4]
                + 16384 * fHeader[5]
                + 128 * fHeader[6]
                + fHeader[7];
                if (fHeader[9] and $BC) <> 0 then
                    fParsable := False;
    end;
  end;
  if FlagUnsynchronisation then
  begin
      SyncedStream := TMemoryStream.Create;
      SyncStream(aStream, SyncedStream, locSize);
      locSize := SyncedStream.Size;
      SyncedStream.Position := 0;
  end else
      SyncedStream := aStream;
  DataOffset := 0;
  if fParsable then
  begin
      if FlagGroupingIndentity then
      begin
          inc(DataOffset);
          SyncedStream.Read(fGroupID, SizeOf(fGroupID));
      end;
      if FlagDataLengthIndicator then
      begin
          inc(DataOffset, 4);
          SyncedStream.Read(fDataLength, SizeOf(fDataLength));
      end;
      SetLength(fData, locSize - DataOffset);
      if length(fData) <> 0 then
          SyncedStream.ReadBuffer(fData[0], length(fData))
      else
          fData := NIL;
  end else
  begin
      SetLength(fData, SyncedStream.Size);
      if length(fData) <> 0 then
          SyncedStream.ReadBuffer(fData[0], length(fData))
      else
          fData := NIL;
  end;
  if aStream <> SyncedStream then
      SyncedStream.Free;
end;
procedure TID3v2Frame.WriteToStream(aStream: tStream);
begin
    UnsetFlag(FF_Unsync);
    if fParsable then
    begin
        UnsetFlag(FF_DataLength); 
        if FlagGroupingIndentity then
            Updateheader(length(fData) + 1);
        aStream.WriteBuffer(fHeader[0],length(fHeader));
        if  FlagGroupingIndentity then
            aStream.Write(fGroupID, SizeOf(fGroupID));
        aStream.WriteBuffer(fData[0],length(fData));
    end else
    begin
        UpdateHeader; 
        aStream.WriteBuffer(fHeader[0],length(fHeader));
        aStream.WriteBuffer(fData[0],length(fData));
    end;
end;
procedure TID3v2Frame.WriteUnsyncedToStream(aStream: TStream);
var tmpStream, UnsyncedStream: TMemoryStream;
begin
    UnsyncedStream := TMemoryStream.Create;
    tmpStream := TMemoryStream.Create;
    if fParsable then
    begin
        UnsetFlag(FF_DataLength);
        if  FlagGroupingIndentity then
            tmpStream.Write(fGroupID, SizeOf(fGroupID));
        tmpStream.WriteBuffer(fData[0],length(fData));
        tmpStream.Position := 0;
        if UnsyncStream(tmpStream, UnsyncedStream) then
        begin
            SetFlag(FF_Unsync)
        end else
            UnSetFlag(FF_Unsync);
        UpdateHeader(UnsyncedStream.Size);
        aStream.WriteBuffer(fHeader[0],length(fHeader));
        aStream.CopyFrom(UnsyncedStream, 0);
    end else
    begin
        tmpStream.WriteBuffer(fData[0],length(fData));
        tmpStream.Position := 0;
        if UnsyncStream(tmpStream, UnsyncedStream) then
        begin
            SetFlag(FF_Unsync)
        end else
            UnsetFlag(FF_Unsync);
        UpdateHeader(UnsyncedStream.Size);
        aStream.WriteBuffer(fHeader[0],length(fHeader));
        aStream.CopyFrom(UnsyncedStream, 0);
    end;
    UnsyncedStream.Free;
    tmpStream.Free;
end;
function TID3v2Frame.ValidFrameID: Boolean;
var  i: Integer;
begin
    result := True;
    if ((fVersion = FV_2) and (length(fIDString) <> 3))
        OR
       ((fVersion <> FV_2) and (length(fIDString) <> 4)) then
    begin
       result := False;
       exit;
    end;
    for i := 1 to length(fIDString) do
        if not (fIDString[i] in ['0'..'9', 'A'..'Z']) then
        begin
            result := False;
            Break;
        end;
end;
function TID3v2Frame.GetFrameType: TID3v2FrameTypes;
begin
    if Not ValidFrameID then
    begin
       result := FT_INVALID;
       exit;
    end;
    case self.fVersion of
      FV_2: begin
        if (fIDString[1] = 'T') and (fIDString <> 'TXX') then
          result := FT_TextFrame
        else
          if (fIDString = 'TXX') then
            result := FT_UserTextFrame
          else
            if (fIDString = 'WXX') then
              result := FT_UserDefinedURLFrame
            else
              if (fIDString = 'COM') then
                result := FT_CommentFrame
              else
                if (fIDString = 'ULT') then
                  result := FT_LyricFrame
                else
                  if (fIDString = 'PIC') then
                    result := FT_PictureFrame
                  else
                    if (fIDString = 'POP') then
                      result := FT_PopularimeterFrame
                    else
                          if (fIDString = 'WCM') OR (fIDString = 'WCP') OR (fIDString = 'WAF') OR
                             (fIDString = 'WAR') OR (fIDString = 'WAS') OR (fIDString = 'WPB') then
                            result := FT_URLFrame
                          else
                            result := FT_UNKNOWN;
      end
      else begin
        if (fIDString[1] = 'T') and (fIDString <> 'TXXX') then
          result := FT_TextFrame
        else
          if (fIDString = 'TXXX') then
            result := FT_UserTextFrame
          else
            if (fIDString = 'WXXX') then
              result := FT_UserDefinedURLFrame
            else
              if (fIDString = 'COMM') then
                result := FT_CommentFrame
              else
                if (fIDString = 'USLT') then
                  result := FT_LyricFrame
                else
                  if (fIDString = 'APIC') then
                    result := FT_PictureFrame
                  else
                    if (fIDString = 'POPM') then
                      result := FT_PopularimeterFrame
                    else
                          if (fIDString = 'WCOM') OR (fIDString = 'WCOP') OR (fIDString = 'WOAF') OR (fIDString = 'WOAR') OR
                             (fIDString = 'WOAS') OR (fIDString = 'WORS') OR (fIDString = 'WPAY') OR (fIDString = 'WPUB') then
                            result := FT_URLFrame
                          else
                            result := FT_UNKNOWN;
      end;
    end; 
end;
function TID3v2Frame.GetFrameTypeDescription: String;    
var i: TFrameIDs;
begin
    if fID <> IDv2_UNKNOWN then
        result := ID3v2KnownFrames[fID].Description
    else
    begin
        {$IFDEF UNICODE}
            result := 'Unknown Frame (' + String(fIDString) + ')';
        {$ELSE}
            result := 'Unknown Frame (' + fIDString + ')';
        {$ENDIF}
        for i := low(TFrameIDs) to High(TFrameIDs) do
            if  ID3v2KnownFrames[i].IDs[fVersion] = fIDString then
            begin
                result := ID3v2KnownFrames[i].Description;
                break;
            end;
    end;
end;
function TID3v2Frame.GetFrameTypeID: TFrameIDs;
var i: TFrameIDs;
begin
    if fID <> IDv2_UNKNOWN then
        result := fID
    else
    begin
        result := IDv2_UNKNOWN;
        for i := low(TFrameIDs) to High(TFrameIDs) do
        if  ID3v2KnownFrames[i].IDs[fVersion] = fIDString then
        begin
            result := i;
            fID := i;
            break;
        end;
    end;
end;
function TID3v2Frame.GetFlagTagAlterPreservation: Boolean;
begin
    case fVersion of
      FV_2: result := True;
      FV_3: result := (fHeader[8] and 128) = 0;
      FV_4: result := (fHeader[8] and 128) = 0
    else result := True;
    end;
end;
function TID3v2Frame.GetFlagFileAlterPreservation: Boolean;
begin
    case fVersion of
      FV_2: result := True;
      FV_3: result := (fHeader[8] and 64) = 0;
      FV_4: result := (fHeader[8] and 64) = 0
    else result := True;
    end;
end;
function TID3v2Frame.GetFlagReadOnly: Boolean;
begin
    case fVersion of
      FV_2: result := False;
      FV_3: result := (fHeader[8] and 32) = 32;
      FV_4: result := (fHeader[8] and 32) = 32
    else result := True;
    end;
end;
function TID3v2Frame.GetFlagCompression: Boolean;
begin
    case fVersion of
      FV_2: result := False;
      FV_3: result := (fHeader[9] and 128) = 128;
      FV_4: result := (fHeader[9] and 8) = 8
    else result := True;
    end;
end;
function TID3v2Frame.GetFlagEncryption : Boolean;
begin
    case fVersion of
      FV_2: result := False;
      FV_3: result := (fHeader[9] and 64) = 64;
      FV_4: result := (fHeader[9] and 4) = 4
    else result := True;
    end;
end;
function TID3v2Frame.GetFlagGroupingIdentity : Boolean;
begin
    case fVersion of
      FV_2: result := False;
      FV_3: result := (fHeader[9] and 32) = 32;
      FV_4: result := (fHeader[9] and 64) = 64
    else result := True;
    end;
end;
procedure TID3v2Frame.SetFlagGroupingIdentity(Value: Boolean);
begin
    if Value then
      SetFlag(FF_GroupID)
    else
      UnsetFlag(FF_GroupID);
end;
function TID3v2Frame.GetFlagUnsynchronisation : Boolean;
begin
    case fVersion of
      FV_2: result := False;
      FV_3: result := False;
      FV_4: result := (fHeader[9] and 2) = 2
    else result := True;
    end;
end;
function TID3v2Frame.GetFlagDataLengthIndicator : Boolean;
begin
    case fVersion of
      FV_2: result := False;
      FV_3: result := False;
      FV_4: result := (fHeader[9] and 1) = 1
    else result := True;
    end;
end;
function TID3v2Frame.GetUnknownStatusFlags: Boolean;
begin
    case fVersion of
      FV_2: result := False;
      FV_3: result := (fHeader[8] and 31) <> 0;
      FV_4: result := (fHeader[8] and 143) <> 0  
    else result := True;
    end;
end;
function TID3v2Frame.GetUnknownEncodingFlags: Boolean;
begin
    case fVersion of
      FV_2: result := False;
      FV_3: result := (fHeader[9] and 31) <> 0;
      FV_4: result := (fHeader[9] and 176) = 176 
    else result := True;
    end;
end;
procedure TID3v2Frame.SetFlag(aFlag: TFrameFlags);
begin
    if fVersion <> FV_2 then
    begin
        if aFlag <= FF_UnknownStatus then
          fHeader[8] := fHeader[8] or TFrameFlagValues[fVersion][aFlag]
        else
          fHeader[9] := fHeader[9] or TFrameFlagValues[fVersion][aFlag];
    end;
end;
procedure TID3v2Frame.UnSetFlag(aFlag: TFrameFlags);
begin
    if fVersion <> FV_2 then
    begin
        if aFlag <= FF_UnknownStatus then
          fHeader[8] := fHeader[8] and (Not TFrameFlagValues[fVersion][aFlag])
        else
          fHeader[9] := fHeader[9] and (Not TFrameFlagValues[fVersion][aFlag]);
    end;
end;
procedure TID3v2Frame.UnSetFlagSomeFlagsAfterDataSet;
begin
    if fVersion <> FV_2 then
    begin
          fHeader[8] := fHeader[8] and (Not TFrameFlagValues[fVersion][FF_ReadOnly]);
          fHeader[8] := fHeader[8] and (Not TFrameFlagValues[fVersion][FF_UnknownStatus]);
          fHeader[9] := fHeader[9] and (Not TFrameFlagValues[fVersion][FF_Compression]);
          fHeader[9] := fHeader[9] and (Not TFrameFlagValues[fVersion][FF_Encryption]);
          fHeader[9] := fHeader[9] and (Not TFrameFlagValues[fVersion][FF_Unsync]);
          fHeader[9] := fHeader[9] and (Not TFrameFlagValues[fVersion][FF_DataLength]);
          fHeader[9] := fHeader[9] and (Not TFrameFlagValues[fVersion][FF_UnknownFormat]);
    end;
end;
function TID3v2Frame.GetDataSize: Integer;
begin
  if fData <> NIL then
    result := length(fData)
  else
    result  := 0;
end;
procedure TID3v2Frame.UpdateHeader(aSize: Integer = -1);
begin
  if aSize = -1 then
    aSize := length(fData);
  case fVersion of
    FV_2: begin
      fHeader[3] := aSize DIV 65536;
      aSize := aSize MOD 65536;
      fHeader[4] := aSize DIV 256;
      aSize := aSize MOD 256;
      fHeader[5] := aSize;
    end;
    FV_3: begin
      fHeader[4] := aSize DIV 16777216;
      aSize := aSize MOD 16777216;
      fHeader[5] := aSize DIV 65536;
      aSize := aSize MOD 65536;
      fHeader[6] := aSize DIV 256;
      aSize := aSize MOD 256;
      fHeader[7] := aSize;
    end;
    FV_4: begin
      fHeader[4] := aSize DIV 2097152;
      aSize := aSize MOD 2097152;
      fHeader[5] := aSize DIV 16384;
      aSize := aSize MOD 16384;
      fHeader[6] := aSize DIV 128;
      aSize := aSize MOD 128;
      fHeader[7] := aSize;
    end;
  end;
end;
function TID3v2Frame.IsUnicodeNeeded(aString: UnicodeString): Boolean;
var i:integer;
begin
  result := False;
  for i := 1 to length(aString) do
    if Word(aString[i]) > 255 then
    begin
      result := True;
      break;
    end;
end;
function TID3v2Frame.GetConvertedUnicodeText(Start, Ende: integer; TextEncoding: TTextEncoding): UnicodeString;
var
  L, i:integer;
  tmp: AnsiString;
  tmpbuf: TBuffer;
  aLength: Integer;
begin
    if Ende >= length(fData) then Ende := length(fData) - 1;
    if Start < 0 then Start := 0;
    if Start > Ende  then
    begin
        result := '';
        exit;
    end;
    aLength := Ende-Start+1;
    Setlength(result, aLength);
    Fillchar(result[1], length(result)*2, 0);
    case TextEncoding of  
        TE_Ansi: begin
            if (fAutoCorrectCodepage)  then
            begin
                setlength(tmp, aLength);
                move(fData[start], tmp[1], length(tmp));
                L := MultiByteToWideChar( FCharCode.CodePage,
                          MB_PRECOMPOSED,
                          @tmp[1],       
                          length(tmp),   
                          nil,           
                          0);            
                if L = 0 then
                begin
                    setlength(tmp, aLength);
                    move(fData[start], tmp[1], length(tmp));
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
                              @tmp[1],
                              length(tmp),
                              @Result[1],
                              L);
                end;
            end else
            begin
                setlength(tmp, aLength);
                move(fData[start], tmp[1], length(tmp));
                {$IFDEF UNICODE}
                    result := trim(String(tmp));
                {$ELSE}
                    result := trim(tmp);
                {$ENDIF}
            end;
            result := trim(result);
        end;
        TE_UTF16: begin
            setlength(result, aLength DIV 2 - 1);
            if (fData[start] = $FE) and (fData[start + 1] = $FF) then
            begin
              setlength(tmpbuf, alength - 2);
              for i := 1 to length(result) do
              begin
                  tmpbuf[2*i - 2] := fData[start + 2*i + 1];
                  tmpbuf[2*i - 1] := fData[start + 2*i];
                  move(tmpbuf[0], result[1], 2*length(result));
              end;
            end else
            begin
              setlength(result, alength DIV 2 - 1);       
              if length(result) > 0 then
                  move(fData[start+2], result[1], 2*length(result))
              else
                  result := '';
            end;
            result := trim(result);
        end;
        TE_UTF16BE: begin
            setlength(result, alength DIV 2);
            move(fData[start], result[1], 2*length(result));
            result := trim(result);
        end;
        UTF8: begin
            setlength(tmp,alength);
            move(fData[start], tmp[1], alength);
            {$IFDEF UNICODE}
                result := UTF8ToString(tmp);    
            {$ELSE}
                result := UTF8Decode(tmp); 
            {$ENDIF}
            result := trim(result);
        end;
        else result := '';
    end;
end;
function TID3v2Frame.WideStringToData(Value: UnicodeString; start: integer; UnicodeIsNeeded: Boolean): integer;
var tmpstr: AnsiString;
begin
  if UnicodeIsNeeded then
  begin
      fData[start] := $FF;
      fData[start+1] := $FE;
      if length(value) > 0 then
        move(value[1], fData[start+2], length(Value) * SizeOf(Widechar));
      result := 2 + SizeOf(WideChar)*length(Value);
  end else
  begin
      {$IFDEF UNICODE}
          tmpstr := AnsiString(Value);
      {$ELSE}
          tmpstr := Value;
      {$ENDIF}
      if length(tmpstr) > 0 then
          move(tmpstr[1], fData[start], length(tmpstr));
      result := length(tmpstr);
  end;
end;
function TID3v2Frame.AnsiStringToData(Value: AnsiString; start: integer): integer;
begin
    if length(Value) > 0 then
      move(Value[1], fData[start], length(Value));
    result := length(Value);
end;
function TID3v2Frame.GetText: UnicodeString;
begin
    if fParsable then
      result :=
        GetConvertedUnicodeText(
        1,                            
        length(fData)-1,              
        ByteToTextEncoding(fData[0])  
        )
    else
      result := '';
end;
procedure TID3v2Frame.SetText(Value: UnicodeString);
var UseUnicode: Boolean;
begin
    UseUnicode := fAlwaysWriteUnicode OR IsUnicodeNeeded(Value);
    If UseUnicode then
    begin
        Setlength(fData, length(Value) * SizeOf(WideChar) + 3);
        fData[0] := 1;
    end else
    begin
        Setlength(fData, length(Value)+1);
        fData[0] := 0;
    end;
    WideStringToData(Value, 1, UseUnicode);
    UnSetFlagSomeFlagsAfterDataSet;
    UpdateHeader;
end;
function TID3v2Frame.GetUserText(out Description: UnicodeString): UnicodeString;
var enc: TTextEncoding;
  i: Integer;
begin
    if fParsable then
    begin
        if length(fData) < 3 then
        begin
            Description := '';
            result := '';
            exit;
        end;
        enc := ByteToTextEncoding(fData[0]);
        i := 1;
        if (enc = TE_UTF16) or (enc = TE_UTF16BE) then
        begin
            While (i < length(fData)-1) and ((fData[i] <> 0) or (fData[i+1] <> 0)) do
                inc(i,2);
            Description := GetConvertedUnicodetext(1, i, enc);
            inc(i,2) 
        end
        else
        begin
            While (i < length(fData)) and (fData[i] <> 0) do
                inc(i);
            Description := GetConvertedUnicodetext(1, i, enc);
            inc(i,1); 
        end;
        result := GetConvertedUnicodetext(i, length(fData)-1, enc);
    end
    else
    begin
        result := '';
        Description := '';
    end;
end;
procedure TID3v2Frame.SetUserText(Description, Value: UnicodeString);
var UseUnicode: Boolean;
    BytesWritten: Integer;
begin
    UseUnicode := AlwaysWriteUnicode OR IsUnicodeNeeded(Value) OR IsUnicodeNeeded(Description);
    If UseUnicode then
    begin
        Setlength(fData,
              1                                             
            + 4 + length(Description) * SizeOf(WideChar)    
            + 2 + length(Value) * SizeOf(WideChar)  );      
        fData[0] := 1;                                      
    end else
    begin
      Setlength(fData,
            1                           
          + 1 + length(Description)     
          + length(Value) );            
      fData[0] := 0;                    
    end;
    BytesWritten := WideStringToData(Description, 1, UseUnicode);
    fData[1 + BytesWritten] := 0;
    inc(BytesWritten);
    if UseUnicode then
    begin 
      fData[1 + BytesWritten] := 0;
      inc(BytesWritten);
    end;
    WideStringToData(Value, 1 + BytesWritten, UseUnicode);
    UnSetFlagSomeFlagsAfterDataSet;
    UpdateHeader;
end;
function TID3v2Frame.GetCommentsLyrics(out Language: AnsiString; out Description: UnicodeString): UnicodeString;
var enc: TTextEncoding;
  i: Integer;
begin
    if fParsable then
    begin
        if length(fData) < 5 then
        begin
            Language := '';
            Description := '';
            result := '';
            exit;
        end;
        enc := ByteToTextEncoding(fData[0]);
        setlength(Language, 3);
        Move(fData[1], Language[1], 3);
        i := 4;
        if (enc = TE_UTF16) or (enc = TE_UTF16BE) then
        begin
            While (i < length(fData)-1) and ((fData[i] <> 0) or (fData[i+1] <> 0)) do
                inc(i,2);
            Description := GetConvertedUnicodetext(4, i, enc);
            inc(i,2) 
        end
        else
        begin
            While (i < length(fData)) and (fData[i] <> 0) do
                inc(i);
            Description := GetConvertedUnicodetext(4, i, enc);
            inc(i,1); 
        end;
        result := GetConvertedUnicodetext(i, length(fData)-1, enc);
    end else
    begin
        Language := '';
        Description := '';
        Result := '';
    end;
end;
procedure TID3v2Frame.SetCommentsLyrics(Language: AnsiString; Description, Value: UnicodeString);
var UseUnicode: Boolean;
    BytesWritten: Integer;
begin
    UseUnicode := AlwaysWriteUnicode OR IsUnicodeNeeded(Value) OR IsUnicodeNeeded(Description);
    if length(Language) <> 3 then Language := 'eng';
    If UseUnicode then
    begin
        Setlength(fData,
              4                                             
            + 4 + length(Description) * SizeOf(WideChar)    
            + 2 + length(Value) * SizeOf(WideChar)  );      
        fData[0] := 1;                                      
    end else
    begin
      Setlength(fData,
            4                           
          + 1 + length(Description)     
          + length(Value) );            
      fData[0] := 0;                    
    end;
    move(Language[1], fData[1], 3);
    BytesWritten := WideStringToData(Description, 4, UseUnicode);
    fData[4 + BytesWritten] := 0;
    inc(BytesWritten);
    if UseUnicode then
    begin 
      fData[4 + BytesWritten] := 0;
      inc(BytesWritten);
    end;
    WideStringToData(Value, 4 + BytesWritten, UseUnicode);
    UnSetFlagSomeFlagsAfterDataSet;
    UpdateHeader;
end;
function TID3v2Frame.GetUserdefinedURL(out Description: UnicodeString): AnsiString;
var enc: TTextEncoding;
  i: Integer;
begin
    if fParsable then
    begin
        if length(fData) < 2 then
        begin
            Description := '';
            result := '';
            exit;
        end;
        enc := ByteToTextEncoding(fData[0]);
        i := 1;
        if (enc = TE_UTF16) or (enc = TE_UTF16BE) then
        begin
            While (i < length(fData)-1) and ((fData[i] <> 0) or (fData[i+1] <> 0)) do
                inc(i,2);
            Description := GetConvertedUnicodetext(1, i, enc);
            inc(i,2) 
        end
        else
        begin
            While (i < length(fData)) and (fData[i] <> 0) do
                inc(i);
            Description := GetConvertedUnicodetext(1, i, enc);
            inc(i,1); 
        end;
        setlength(result, length(fData) - i);
        move(fData[i], result[1], length(result));
        {$IFDEF UNICODE}
            result := AnsiString(trim(String(result)));
        {$ELSE}
            result := trim(result);
        {$ENDIF}
    end else
    begin
        Description := '';
        result := '';
    end;
end;
procedure TID3v2Frame.SetUserdefinedURL(Description: UnicodeString; URL: AnsiString);
var UseUnicode: Boolean;
    BytesWritten: Integer;
begin
    UseUnicode := IsUnicodeNeeded(Description);
    If UseUnicode then
    begin
        Setlength(fData,
              1                                             
            + 4 + length(Description) * SizeOf(WideChar)    
            + length(URL)   );                              
        fData[0] := 1;                                      
    end else
    begin
      Setlength(fData,
            1                           
          + 1 + length(Description)     
          + length(URL) );              
      fData[0] := 0;                    
    end;
    BytesWritten := WideStringToData(Description, 1, UseUnicode);
    fData[1 + BytesWritten] := 0;
    inc(BytesWritten);
    if UseUnicode then
    begin
      fData[1 + BytesWritten] := 0;
      inc(BytesWritten);
    end;
    AnsiStringToData(URL, 1 + BytesWritten);
    UnSetFlagSomeFlagsAfterDataSet;
    UpdateHeader;
end;
function TID3v2Frame.GetURL: AnsiString;
begin
    if fParsable then
    begin
        setlength(result, length(fData));
        if length(result) > 0 then
          move(fData[0], result[1], length(result))
        else
          result := '';
    end else
        result := '';
end;
procedure TID3v2Frame.SetURL(Value: AnsiString);
begin
  if Value = '' then
    Value := ' ';
  Setlength(fData, length(Value));
  move(Value[1], fData[0], length(Value));
  UnSetFlagSomeFlagsAfterDataSet;
  UpdateHeader;
end;
function TID3v2Frame.GetPicture(out Mime: AnsiString; out PicType: Byte; out Description: UnicodeString; PictureData: TStream): Boolean;
var
    enc: TTextEncoding;
    i, dStart: Integer;
begin
    if fParsable then
    begin
        result := True;
        case fVersion of
            FV_2: begin
                if length(fData) <= 6 then  
                begin
                    Mime := '';
                    PicType := 0;
                    Description := '';
                    result := False;
                end else
                begin
                    enc := ByteToTextEncoding(fData[0]);
                    SetLength(Mime, 3);
                    Move(fData[1], Mime[1], 3);
                    PicType := fData[4];
                    i := 5;
                    if (enc = TE_UTF16) or (enc = TE_UTF16BE) then
                    begin
                        While (i < length(fData)-1) and ((fData[i] <> 0) or (fData[i+1] <> 0)) do
                            inc(i,2);
                        Description := GetConvertedUnicodetext(5, i, enc);
                        inc(i,2) 
                    end
                    else
                    begin
                        While (i < length(fData)) and (fData[i] <> 0) do
                            inc(i);
                        Description := GetConvertedUnicodetext(5, i, enc);
                        inc(i,1); 
                    end;
                    if i < length(fData) then
                      PictureData.Write(fData[i], length(fData) - i)
                    else
                      result := False;
                end;
            end
        else begin
                if length(fData) <= 4 then  
                begin
                    Mime := '';
                    PicType := 0;
                    Description := '';
                    result := False;
                end else
                begin
                    enc := ByteToTextEncoding(fData[0]);
                    i := 1;
                    While (i < length(fData)) and (fData[i] <> 0) do
                      inc(i);
                    Setlength(Mime, i-1);
                    Move(fData[1], Mime[1], i-1);
                    inc(i);
                    if i < length(fData) then
                        PicType := fData[i]
                    else result := False;
                    inc(i);
                    dStart := i;
                    if (enc = TE_UTF16) or (enc = TE_UTF16BE) then
                    begin
                        While (i < length(fData)-1) and ((fData[i] <> 0) or (fData[i+1] <> 0)) do
                            inc(i,2);
                        Description := GetConvertedUnicodetext(dStart, i, enc);
                        inc(i,2) 
                    end
                    else
                    begin
                        While (i < length(fData)) and (fData[i] <> 0) do
                            inc(i);
                        Description := GetConvertedUnicodetext(dStart, i, enc);
                        inc(i,1); 
                    end;
                    if i < length(fData) then
                      PictureData.Write(fData[i], length(fData) - i)
                    else
                      result := False;
                end
            end; 
        end;
    end else
    begin
      result := False;
      Mime := '';
      PicType := 0;
      Description := '';
    end;
end;
procedure TID3v2Frame.SetPicture(Mime: AnsiString; PicType: Byte; Description: UnicodeString; PictureData: TStream);
var UseUnicode: Boolean;
    BytesWritten, helpIdx: Integer;
begin
    UseUnicode :=  IsUnicodeNeeded(Description);
    if Pictype > 20 then PicType := 0;
    case fVersion of
        FV_2: begin
            If length(Mime) <> 3 then
            begin
                if Mime = 'image/png'  then
                    Mime := 'PNG'
                else
                    Mime := 'JPG';
            end;
            if UseUnicode then
            begin
                setlength(fData, 1 + 3 + 1 + (length(Description) + 1) * SizeOf(Widechar) + PictureData.size);
                fData[0] := 1;
            end else
            begin
                setlength(fData, 1 + 3 + 1 + length(Description) + 1 + PictureData.size);
                fData[0] := 0;
            end;
            move(Mime[1], fData[1], 3);
            fData[4] := PicType;
            helpIdx := 5;
        end
        else
        begin
            if UseUnicode then
            begin
                setlength(fData, 1 + length(Mime) + 1 + 1 + (length(Description) + 1) * SizeOf(Widechar) + PictureData.size);
                fData[0] := 1;
            end else
            begin
                setlength(fData, 1 + length(Mime) + 1 + 1 + length(Description) + 1 + PictureData.size);
                fData[0] := 0;
            end;
            move(Mime[1], fData[1], length(Mime));
            fData[1 + length(Mime)] := 0; 
            fData[2 + length(Mime)] := PicType;
            helpIdx := 3 + length(Mime);
        end; 
    end;  
    BytesWritten := WideStringToData(Description, helpIdx, UseUnicode);
    fData[helpIdx + BytesWritten] := 0;
    inc(BytesWritten);
    if UseUnicode then
    begin
      fData[helpIdx + BytesWritten] := 0;
      inc(BytesWritten);
    end;
    PictureData.Seek(0, soFromBeginning);
    PictureData.Read(fData[helpIdx + BytesWritten], PictureData.Size);
    UnSetFlagSomeFlagsAfterDataSet;
    UpdateHeader;
end;
function TID3v2Frame.GetRating(out UserEMail: AnsiString): Byte;
var i: Integer;
begin
    if fParsable then
    begin
        i := 0;
        result := 0; 
        While (i < length(fData)) and (fData[i] <> 0) do
            inc(i);
        Setlength(UserEMail, i);
        Move(fData[0], UserEMail[1], i);
        inc(i);   
        if i < length(fData) then
            result := fData[i];
    end else
    begin
        result := 0;
        UserEMail := '';
    end;
end;
procedure TID3v2Frame.SetRating(UserEMail: AnsiString; Value: Byte);
var tmpmail: AnsiString;
    BackUpCounter: Cardinal;
    i: Integer;
begin
    BackUpCounter := GetPersonalPlayCounter(tmpmail);
    if BackUpCounter = 0 then
        Setlength(fData, length(UserEMail) + 2)
    else
        Setlength(fData, length(UserEMail) + 2 + 4);
    move(UserEMail[1], fData[0], length(UserEMail));
    fData[length(UserEMail)] := 0;
    fData[length(UserEMail) + 1] := Value;
    if BackUpCounter <> 0 then
    begin
        i := length(UserEMail) + 2;
        fData[i] := BackUpCounter DIV 16777216;
        BackUpCounter := BackUpCounter MOD 16777216;
        fData[i+1] := BackUpCounter DIV 65536;
        BackUpCounter := BackUpCounter MOD 65536;
        fData[i+2] := BackUpCounter DIV 256;
        BackUpCounter := BackUpCounter MOD 256;
        fData[i+3] := BackUpCounter;
    end;
    UnSetFlagSomeFlagsAfterDataSet;
    UpdateHeader;
end;
function TID3v2Frame.GetPersonalPlayCounter(out UserEMail: AnsiString): Cardinal;
var i: Integer;
begin
    if fParsable then
    begin
        i := 0;
        While (i < length(fData)) and (fData[i] <> 0) do
            inc(i);
        Setlength(UserEMail, i);
        Move(fData[0], UserEMail[1], i);
        inc(i);   
        inc(i);   
        if i < length(fData) then
        begin
            case (length(fData) - i) of
                0..3: begin
                    result := 0;
                end;
                4: begin
                    result :=  fData[i] * 16777216
                             + fData[i+1] * 65536
                             + fData[i+2] * 256
                             + fData[i+3];
                end;
            else
                begin
                    result := 0; 
                end;
            end;
        end else
        begin
            result := 0;
        end;
    end else
    begin
        result := 0;
        UserEMail := '';
    end;
end;
procedure TID3v2Frame.SetPersonalPlayCounter(UserEMail: AnsiString; Value: Cardinal);
var tmpmail: AnsiString;
    BackUpRating: Byte;
    i: Integer;
begin
    BackUpRating := GetRating(tmpmail);
    if Value = 0 then
        Setlength(fData, length(UserEMail) + 2)
    else
        Setlength(fData, length(UserEMail) + 2 + 4);
    move(UserEMail[1], fData[0], length(UserEMail));
    fData[length(UserEMail)] := 0;
    fData[length(UserEMail) + 1] := BackUpRating;
    if Value <> 0 then
    begin
        i := length(UserEMail) + 2;
        fData[i] := Value DIV 16777216;
        Value := Value MOD 16777216;
        fData[i+1] := Value DIV 65536;
        Value := Value MOD 65536;
        fData[i+2] := Value DIV 256;
        Value := Value MOD 256;
        fData[i+3] := Value;
    end;
    UnSetFlagSomeFlagsAfterDataSet;
    UpdateHeader;
end;
function TID3v2Frame.GetPrivateFrame(out OwnerID: AnsiString;
  Data: TStream): Boolean;
var i: Integer;
begin
    if fParsable then
    begin
        i := 0;
        result := True;
        While (i < length(fData)) and (fData[i] <> 0) do
            inc(i);
        Setlength(OwnerID, i);
        Move(fData[0], OwnerID[1], i);
        inc(i);   
        if i < length(fData) then
            Data.Write(fData[i], length(fData) - i)
        else
            result := False;
    end else
        result := False;
end;
procedure TID3v2Frame.SetPrivateFrame(aOwnerID: AnsiString; Data: TStream);
begin
    SetLength(fData, Length(aOwnerID) + 1 + Data.Size);
    Move(aOwnerID[1], fData[0], length(aOwnerID));
    fData[length(aOwnerID)] := 0;
    Data.Seek(0, soFromBeginning);
    Data.Read(fData[length(aOwnerID) + 1], Data.Size);
    UnSetFlagSomeFlagsAfterDataSet;
    UpdateHeader;
end;
procedure TID3v2Frame.GetData(Data: TStream);
begin
  if length(fData) > 0 then
    Data.Write(fData[0], length(fData));
end;
procedure TID3v2Frame.SetData(Data: TStream);
begin
  Data.Seek(0, soFromBeginning);
  setlength(fData, Data.Size);
  Data.Read(fData[0], Data.Size);
  UpdateHeader;
end;
end.

