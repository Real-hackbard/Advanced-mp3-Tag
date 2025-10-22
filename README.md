# Advanced-mp3-Tag:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) : ![Id3v2Frames pas](https://github.com/user-attachments/assets/d82efd32-bf8b-42e3-823e-c62e304c0d9c) ![Mp3FileUtils pas](https://github.com/user-attachments/assets/a9aeb815-219d-4bb6-915a-cf7e0cba53cb) ![U_CharCode pas](https://github.com/user-attachments/assets/cb7ba945-31a9-4138-a715-fd09463df5be)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) &nbsp;&nbsp;: ![Advanced mp3 Tag](https://github.com/user-attachments/assets/f90bb8d0-2a57-4c5a-ad8d-5df1781229ab)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) &nbsp;: ![102025](https://github.com/user-attachments/assets/62cea8cc-bd7d-49bd-b920-5590016735c0)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>

Advanced-mp3-Tag is a [metadata](https://en.wikipedia.org/wiki/Metadata) container most often used in conjunction with the [MP3](https://en.wikipedia.org/wiki/MP3) audio file format. It allows information such as the title, artist, album, track number, and other information about the file to be stored in the file itself.

ID3 is a [de facto standard](https://en.wikipedia.org/wiki/De_facto_standard) for metadata in MP3 files; no standardization body was involved in its creation nor has such an organization given it a formal approval status.[1] It competes with the APE tag in this area.

There are two unrelated versions of ID3: ID3v1 and ID3v2. In ID3v1, the metadata is stored in a 128-byte segment at the end of the file. In ID3v2, an [extensible](https://en.wikipedia.org/wiki/Extensibility) set of "frames" located at the start of the file is used. Sub-variants of both versions exist.

</br>

![Advanced mp3_file](https://github.com/user-attachments/assets/908d7ffc-136b-41d4-b02d-ea49c098ef38)

</br>

### ID3v2.0:
A ID3v2 tag consists of a number of optional frames, each of which contains a piece of metadata up to 16 MB in size. For example, a TT2 frame may be included to contain a title. The entire tag may be as large as 256 MB, and strings may be encoded in Unicode.

### ID3v2.2:
The first public variant of v2, ID3v2.2, used three character frame identifiers rather than four (TT2 for the title instead of TIT2). It is considered obsolete.

### ID3v2.3:
ID3v2.3 is the most widely used version of ID3v2 tags and is widely supported by Windows Explorer and Windows Media Player. Notably it introduced the ability to embed an image such as an album cover.

### ID3v2.4:
ID3v2.4 was published on November 1, 2000. It defines 83 frame types,[12] allows text frames to contain multiple values separated with a null byte, and permits the tag to be stored at either the beginning or the end of the file.

### Lyrics:
Lyrics3v1 and Lyrics3v2 were tag standards implemented before ID3v2, for adding lyrics to mp3 files. The difference with ID3v2 is that Lyrics3 is always at the end of an MP3 file, before the ID3v1 tag.

[Lyrics](https://simple.wikipedia.org/wiki/Lyrics) are the words to a song. A person who writes lyrics is called a lyricist.

The lyrics of a song will usually have a meaning. Some times the meaning is easy to find but other times it can be very difficult to know what the lyrics mean. Some lyrics are so strange that it is nearly impossible to understand them. In such cases, people tend to look more at the form, articulation, meter, and symmetries of the lyrics instead of looking at their meaning.

</br>

## Batch File Tag:
"mp3 batch tag" refers to editing the metadata (tags) of multiple MP3 files at the same time.

</be>

![Advanced mp3 batch](https://github.com/user-attachments/assets/e4017504-f035-4923-8755-44c840ec1874)

</br>

## Mp3FileUtils.pas Library:
A collection of classes for reading and writing various information from MP3 files with Delphi. The classes are compatible with Delphi 7 (possibly earlier) up to Delphi 2010.

### Properties:
* Reading and writing the ID3v1 tag
* Reading and writing the ID3v2 tag
* Support for all existing versions: v1, v1.1, v2.2, v2.3, and v2.4
* Easy access to standard properties such as artist and title
* Access to extended properties such as lyrics, images, URLs, and ratings
* Access to any information fields is possible, requiring advanced programming knowledge of the ID3 tag structure.
* Unicode support
* Unsynchronization support
* Unknown frames (~ information fields) in the tag are retained.
* Reading/calculating the MPEG information of an MP3 file - e.g., bit rate, channel mode, sample rate, duration
* Fast data determination: Even with vbr, the playing time is (almost) always determined correctly without having to read the entire file.

Download latest Version : [Mp3FileUtils](https://www.gausi.de/mp3fileutils.html?file=files/delphi/mp3fileutils_06a.zip&cid=181)  
Download latest Version (Lazarus) : [Mp3FileUtils](https://www.gausi.de/mp3fileutils.html?file=files/delphi/mp3fileutils_06_lazarus.zip&cid=757)

### Required Additional Components:
Depending on the compiler switch settings (in the config.inc file), the TNT Unicode Controls are required for Delphi 2007 (or earlier). The older (free) versions can be found [here](https://www.yunqa.de/delphi/products/tntunicodecontrols/index) , or you can search the web yourself. Or purchase the current versions from TMS. Without these components, files with "Unicode filenames" cannot be processed.

Delphi 2009 or later support Unicode natively.

### Lazarus port:
This isn't mine, but Frank Plagge's. Details can be found in the unit's comments. The archive contains demo programs for Windows and Mac.
