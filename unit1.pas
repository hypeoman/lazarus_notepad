unit Unit1;

{$mode objfpc}{$H+}

interface

uses
        Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
		StdCtrls, ActnList;

type

		{ TForm1 }

        TForm1 = class(TForm)
				FileOpenAction: TAction;
				FileSaveAction: TAction;
				FileCreateAction: TAction;
				ActionList: TActionList;
				ColorDialog: TColorDialog;
				FontDialog: TFontDialog;
				MainMenu: TMainMenu;
				FileItem: TMenuItem;
				FileCreate: TMenuItem;
				FileOpen: TMenuItem;
				FileSave: TMenuItem;
				Memo: TMemo;
				FormatItem: TMenuItem;
				FontChange: TMenuItem;
				FontColorChangeItem: TMenuItem;
				AboutProgramItem: TMenuItem;
				BackgroundColorChangeItem: TMenuItem;
				ReferenceItem: TMenuItem;
				ViewItem: TMenuItem;
				OpenDialog: TOpenDialog;
				SaveDialog: TSaveDialog;
				procedure AboutProgramItemClick(Sender: TObject);
    procedure BackgroundColorChangeItemClick(Sender: TObject);
    procedure FileCreateActionExecute(Sender: TObject);
    procedure FileCreateClick(Sender: TObject);
	procedure FileOpenActionExecute(Sender: TObject);
				procedure FileOpenClick(Sender: TObject);
				procedure FileSaveActionExecute(Sender: TObject);
				procedure FileSaveClick(Sender: TObject);
				procedure FontColorChangeItemClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
	procedure FontChangeClick(Sender: TObject);
        private

        public

        end;

var
        Form1: TForm1;
        OpenedFileName : string;

implementation
uses Unit2;
{$R *.lfm}

{ TForm1 }

procedure TForm1.FormResize(Sender: TObject);
begin
        Memo.Height := Form1.Height;
        Memo.Width := Form1.Width;
end;

procedure TForm1.FontChangeClick(Sender: TObject);
begin
     FontDialog.Execute;
     Memo.Font := FontDialog.Font;
end;

procedure TForm1.FileCreateClick(Sender: TObject);
begin
     Form1.Caption := 'Блокнот - Безымянный';
     Memo.Lines.Clear;
     OpenedFileName := '';
end;

procedure TForm1.FileCreateActionExecute(Sender: TObject);
begin
        FileCreateClick(FileCreate);
end;

procedure TForm1.BackgroundColorChangeItemClick(Sender: TObject);
begin

end;

procedure TForm1.AboutProgramItemClick(Sender: TObject);
begin
     Form2.Show;
end;

procedure TForm1.FileOpenClick(Sender: TObject);
begin
     OpenDialog.Execute;
     if OpenDialog.FileName <> '' then begin
        Memo.Lines.LoadFromFile(OpenDialog.FileName);
        OpenedFileName := ExtractFileName(OpenDialog.Filename);
        Form1.Caption := concat('Блокнот - ', OpenedFileName);
	 end;
end;

procedure TForm1.FileOpenActionExecute(Sender: TObject);
begin
     FileOpenClick(FileOpen);
end;

procedure TForm1.FileSaveClick(Sender: TObject);
begin
     SaveDialog.Execute;
     if SaveDialog.Filename <> '' then begin
        Memo.Lines.SaveToFile(SaveDialog.FileName);
        OpenedFileName := ExtractFileName(SaveDialog.Filename);
        Form1.Caption := concat('Блокнот - ', OpenedFileName);
	 end;
end;

procedure TForm1.FontColorChangeItemClick(Sender: TObject);
begin

end;

procedure TForm1.FileSaveActionExecute(Sender: TObject);
begin
     FileSaveClick(FileSave);
end;

end.

