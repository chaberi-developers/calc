//k-hatori
//Four arithmetic operations soft
//プログラム参考サイトさまです
//http://www.ne.jp/asahi/aaa/tach1394/delphi/index.htm
unit Unit1;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFnDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType, LMessages,
{$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;



type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Label1: TLabel;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);

    procedure Proc(ch:string);
    procedure ButtonClick(Sender: TObject);
    function CheckStatus():Boolean;
    function GetCalculate(Param:Integer):Boolean;
  private
    { Private 宣言 }
    value1,value2:string;//２つの文字列型の変数を宣言する。
    status:integer;//statusは電卓の入力状況を管理する。
    modeoperation:integer;//計算モード
  public
    { Public 宣言 }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

//定数
  const
    DEFAULT = '0';   //'01'
    ONE = ' ';       //'1'
    SETTING_ZERO = 0;
    SETTING_ONE = 1;
    SETTING_TWO = 2;
    SETTING_THREE = 3;
    SETTING_FOUR = 4;
    SETTING_FIVE = 5;
    SETTING_SIX = 6;
    MODE_PLUS = 1;
    MODE_MINUS = 2;
    MODE_TIMES = 3;
    MODE_DIVIDED = 4;
//汎用 ボタンクリック
procedure TForm1.ButtonClick(Sender: TObject);
var
   Sparam: String;
begin

  try

    //パラメータ取得
    Sparam := (Sender as TButton).Caption;

    //パラメータ分岐
    if Sparam = 'AC'then
    begin
      Proc('A');
    end
    else if Sparam = 'C' then
    begin
      Proc('C');
    end
    else if Sparam = '=' then
    begin
      Proc('=');
    end
    else if Sparam = '+' then
    begin
      modeoperation:=MODE_PLUS;
      Proc('p');
    end
    else if Sparam = '-' then
    begin
      label1.Tag:=MODE_MINUS;
      Proc('p');
    end
    else if Sparam = '×' then
    begin
      modeoperation:=MODE_TIMES;
      Proc('p');
    end
    else if Sparam = '÷' then
    begin
      modeoperation:=MODE_DIVIDED;
      Proc('p');
    end
    else
    begin
      Proc(Sparam);
    end;
  except
    on E: Exception do
    begin
        ShowMessage(E.Message) ;
        raise ;
    end;
  end;
end;

//初期処理
procedure TForm1.FormCreate (Sender: TObject);
begin
  label1.Caption:=DEFAULT;
  status:=0;
end;

//ステータスチェック
function TForm1.CheckStatus():Boolean;
begin
  if (status <= 10) or (status >= 1) then
    begin
      RESULT := TRUE;
    end
    else
    begin
      RESULT := FALSE;
    end;
end;


//計算をする
function TForm1.GetCalculate(Param:Integer):Boolean;
begin
  try
    if(Param = 1) then
    begin
      TForm1(self).value1 := floattostr(strtofloat(TForm1(self).value1)+strtofloat(TForm1(self).value2));
    end
    else if(Param = 2) then
    begin
      TForm1(self).value1 := floattostr(strtofloat(TForm1(self).value1)-strtofloat(TForm1(self).value2));
    end
    else if(Param = 3) then
    begin
      TForm1(self).value1 := floattostr(strtofloat(TForm1(self).value1)*strtofloat(TForm1(self).value2));
    end
    else if(Param = 4) then
    begin
      //0除算処理入れる予定・・・
      TForm1(self).value1 := floattostr(strtofloat(TForm1(self).value1)/strtofloat(TForm1(self).value2));
    end;
    RESULT := true;
  except
    on E: Exception do
    begin
        //0による浮動小数点エラー
        ShowMessage(E.Message) ;
        RESULT := false;
        exit ;
    end;
  end;
end;


//計算処理
procedure TForm1.Proc(ch: string);
begin

  //ステータスをチェックする
  Assert(CheckStatus, 'ステータス エラー発生');

  //ALLクリア時
  if ch='A' then begin
    status:=0;
    label1.Caption:=DEFAULT;
    exit;
  end;

  //ステータス制御
  case status of
           
    //数字を入力する前の場合
    SETTING_ZERO:begin
    
        //抜ける
        if (ch='p') or (ch='=') or (ch='C') then exit;

        //小数点が押されたとき
        if ch='.' then
        begin
          value1:='0.';
          label1.Caption:=value1+ONE;
          status:=2;
          exit;
        end
        else
        begin
          //小数点以外
          value1:=ch;
          label1.Caption:=value1+ONE;
          status:=1;
        end;
      end;

  //数字や小数点が押されている場合
  SETTING_ONE,SETTING_TWO:begin

        //数学記号が押されたとき
        if ch='p' then
        begin
          status:=3;
          exit;
        end;
        
        //抜ける    
        if ch='=' then exit;
        
        //クリアキーが押されたとき
        if ch='C' then
        begin
          label1.Caption:=DEFAULT;//表示を'01'にする
          status:=0;
          exit;
        end;

        //小数点が押されたとき
        if ch='.' then
        begin
          if status=2 then exit;
          value1:=value1+'.';
          label1.Caption:=value1+ONE;
          status:=2;
          exit;
        end
        else
        begin
          //小数点が押されたとき以外
          value1:=value1+ch;
          label1.Caption:=value1+ONE;
          if status=0 then status:=1;
        end;
        
      end;

    //数学記号が押されている場合
    SETTING_THREE:begin

        //抜ける
        if (ch='p') or (ch='=') then exit;

        //クリアキーが押された場合
        if ch='C' then
        begin
          status:=0;
          label1.Caption:=DEFAULT;
          exit;
        end;
        
        //小数点が押された場合
        if ch='.' then
        begin
          value2:='0.';
          label1.Caption:=value2+ONE;
          status:=5;
          exit;
        end  
        else
        begin
          //数字キーが押されたとき
          value2:=ch;
          label1.Caption:=value2+ONE;
          if status =3 then status:=4;
        end;
      end;

    //数学記号が押された後数字や小数点が押されている場合
    SETTING_FOUR,SETTING_FIVE:begin

        //数学記号が押された場合
        if ch='p' then
        begin
          GetCalculate(modeoperation);
          label1.Caption:=value1+ONE;
          status:=3;
          exit;
        end;

        //＝が押された場合
        if ch='=' then begin
          GetCalculate(modeoperation);
          label1.Caption:=value1+ONE;
          status:=SETTING_SIX;
          exit;
        end;

        //クリアが押されたら
        if ch='C' then begin;
          label1.Caption:=DEFAULT;
          value2:='';
          status:=3;
        end;
        
        //小数点が押されたら
        if ch='.' then begin
          if status=5 then exit;
          value2:='0.';
          label1.Caption:=value2+ONE;
          status:=5;
          exit;
        end
        else
        begin
          //数字キーが押された場合
          value2:=value2+ch;
          label1.Caption:=value2+ONE;
        end;
      end;
      
    //＝が押された後の場合  
    SETTING_SIX:begin
    
        //数学記号が押された場合
        if ch='p' then
        begin
          status:=3;
          exit;
        end;

        //＝が押された場合
        if ch='=' then exit;

        //クリアが押されたら
        if ch='C' then begin
          label1.Caption:=DEFAULT;
          status:=0;
          exit;
        end;

        //小数点が押されたら
        if ch='.' then
        begin
          value1:='0.';
          label1.Caption:=value1+ONE;
          status:=2;
          exit;
        end
        else
        begin
          //数字キーが押された場合
          value1:=ch;
          label1.Caption:=value1+ONE;
          status:=1;
        end;
        
      end;
  end;
end;
end.

