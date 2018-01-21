#define   Name       "FindAverageValueOfArray"
#define   Version    "1.0.0"
#define   Publisher  "GMS Inc."
#define   URL        "http://www.leofesk.ru"
#define   ExeName    "FAVOA.exe"
#define   gitFolder  "C:\Temp\Study"

[Setup]

AppId={{4271EBAF-C84E-4A11-8B3F-6A047A6E2529}

AppName={#Name}
AppVersion={#Version}
AppPublisher={#Publisher}
AppPublisherURL={#URL}
AppSupportURL={#URL}
AppUpdatesURL={#URL}

DefaultDirName={pf}\{#Name}
DefaultGroupName={#Name}

OutputDir={#gitFolder}\Setup
OutputBaseFileName=FAVOA

Compression=lzma
SolidCompression=yes

[Files]

Source: "{#gitFolder}\bin\FindAverageValueOfArray.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#gitFolder}\bin\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs