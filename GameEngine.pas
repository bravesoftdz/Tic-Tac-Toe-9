unit GameEngine;

interface
uses Tree,  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics;

type
 TGameEngine=class
  private
    Tree:TTree;
    InitialState: TData;
    nilGraphic, cross, toe:TBitmap;
  public
    procedure Draw(Canvas:TCanvas);
    procedure PlayerClick(X, Y:integer);
    constructor Create;
    destructor Destroy;
end;
implementation
  uses TicTacToe;
{ TGameEngine }

constructor TGameEngine.Create;
begin
     Tree:=TTree.Create;

     nilgraphic:=TBitmap.Create;
     cross:=TBitmap.Create;
     toe:=TBitmap.Create;

     nilGraphic.LoadFromFile('resource/nil.bmp');
     cross.LoadFromFile('resource/cross.bmp');
     toe.LoadFromFile('resource/toe.bmp');

     Tree.InitializationTree(Tree.Root,InitialState,9,nil);
end;

destructor TGameEngine.Destroy;
begin
   Tree.Destroy;

   nilGraphic.Destroy;
   cross.Destroy;
   toe.Destroy;
end;

procedure TGameEngine.Draw(Canvas: TCanvas);
var
   i,j:integer;
begin
    for I := 0 to 2 do
        for j := 0 to 2 do
      if InitialState[i,j]=0 then
         Canvas.Draw(i*96,j*96,nilGraphic)
                             else

      if InitialState[i,j]=1 then
         Canvas.Draw(i*96,j*96,cross)
                             else

      if InitialState[i,j]=2 then
         Canvas.Draw(i*96,j*96,toe);

         Canvas.MoveTo(96,0);
         Canvas.LineTo(96, 288);

         Canvas.MoveTo(192, 0);
         Canvas.LineTo(192, 288);

         Canvas.MoveTo(0,96);
         Canvas.LineTo(288, 96);

         Canvas.MoveTo(0, 192);
         Canvas.LineTo(288, 192);
end;

procedure TGameEngine.PlayerClick(X, Y: integer);
begin
     if InitialState[X div 96, Y div 96]=0 then
     begin
        InitialState[X div 96, Y div 96]:=1;
        form1.Label5.Caption:='59';
       // InitialState:=Tree.SearchState(Tree.Root, InitialState);
     end;
end;

end.
