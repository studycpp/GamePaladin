program GamePaladin;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  GetProcessIDUnit in 'GetProcessIdUnit.pas' {ProcessListForm},
  GPKernel in 'GPKernel.pas',
  InputhelpUnit in 'InputhelpUnit.pas' {InputHelpForm},
  MemEditUnit in 'MemEditUnit.pas' {MemEditForm},
  MyCalcUnit in 'MyCalcUnit.pas' {MyCalcForm},
  MemRecordUnit in 'MemRecordUnit.pas' {MemRecordForm},
  ChildFormUnit in 'ChildFormUnit.pas' {ChildForm},
  CapturePicUnit in 'CapturePicUnit.pas' {CapturePicForm},
  GameRecordUnit in 'GameRecordUnit.pas' {GameRecordForm},
  MyFavoritesUnit in 'MyFavoritesUnit.pas' {MyFavoritesForm},
  ArchiveEditUnit in 'ArchiveEditUnit.pas' {ArchiveEditForm},
  AddFileTaskUnit in 'AddFileTaskUnit.pas' {AddFileTaskForm},
  FileRecordUnit in 'FileRecordUnit.pas' {FileRecordForm},
  FileEditUnit in 'FileEditUnit.pas' {FileEditForm},
  HelpWebBrowserUnit in 'HelpWebBrowserUnit.pas' {HelpWebBrowserForm},
  RegisterUnit in 'RegisterUnit.pas' {RegisterForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMemEditForm, MemEditForm);
  Application.CreateForm(TMyCalcForm, MyCalcForm);
  Application.CreateForm(TMemRecordForm, MemRecordForm);
  Application.CreateForm(TProcessListForm, ProcessListForm);
  Application.CreateForm(TAddFileTaskForm, AddFileTaskForm);
  Application.CreateForm(TFileRecordForm, FileRecordForm);
  Application.CreateForm(TFileEditForm, FileEditForm);
  Application.Run;
end.
