unit Tree;

interface
uses System.SysUtils, System.Variants, System.Classes, Wintypes;
  type
    pNode = ^TNode; //��������� �� TNode
    TData = array [0..2,0..2] of integer;//��� ���� ����
    TField = array of TPoint;//��� ������� ��������� �����

   //����� ����-----------------------------------------------------------------

    TNode = class
    private
    // ����
      FData: TData;  //���� ������
      FParent:pNode; //��������
      FVertKey:integer; //���� �� ���������
      FHorzKey:integer; //���� �� �����������
      FCountChild:integer;    //���-�� ��������
      FLinks:array of pNode; //����  ���������� �� �������� �� ��������
      CoordinatesEmptyField:TField; //������ ��������� �����

    // ������-������
    function GetLinks(index:integer):pNode;        // ������ ���������� �� ��������
    procedure SetLinks(index:integer;value:pNode); // ������ ���������� ��������

    function GetData :TData;       //������ ��������� ����
    procedure SetData (Data:TData);//������ ��������� ����


    public
    // ��������
      property Parent:pNode read FParent write FParent;
      property Data :TData read GetData write SetData;
      property CountChild:integer read FCountChild write FCountChild;
      property Links[index:integer]:pNode read GetLinks write SetLinks;
      property VertKey:integer read FVertKey write FVertKey;
      property HorzKey:integer read FHorzKey write FHorzKey;

      function KeyWin:byte;
    // ������������
      constructor Create();overload;// ������ �����������
      constructor Create(Data:TData);overload;// ������������� ������
      constructor Create(Data:TData;CountChild:integer);overload; //������������� ������ � ��������(������ ������)
      constructor Create(Data:TData;CountChild:integer; Parent:pNode);overload;//������������� ������, �������� ���� � ��������(������ ������)
    //--------------------------------------------------------------------------
    end;


    TTree = class
      private
      // ����
       FRoot:pNode;// ������ ������


      public
      property Root:pNode read FRoot write FRoot;
      // �����������
        constructor Create();

      // ����������
        destructor Destroy;

      //������������� ������
        procedure InitializationTree(Root: pNode; Data:TData; CountChild:integer; Parent:pNode);

      //����� � ������������ ���������
        function SearchState(Root:pNode; Data: TData):TData;

    end;

implementation

{ TNode }

 // ���������� ������ ����------------------------------------------------------
constructor TNode.Create;
var
  I, j: Integer;
begin
for I := 0 to 2 do
for j := 0 to 2 do
      FData[i,j]:=0 ;
      FCountChild:=0;
      FLinks:=nil;
      FVertKey:=0;
      FHorzKey:=0;
end;

constructor TNode.Create(Data: TData );
begin
      FData:= Data;
      FCountChild:=0;
      FLinks:=nil;
      FVertKey:=0;
      FHorzKey:=0;
end;

constructor TNode.Create(Data:TData; CountChild: integer);
begin
      FData:= Data;
      FCountChild:=CountChild;
      SetLength(FLinks, CountChild); // ��������� ������ ��� ������
      FVertKey:=0;
      FHorzKey:=0;
end;

constructor TNode.Create(Data: TData; CountChild: integer; Parent: pNode);
var
  I: Integer;
  j, l: Integer;
begin

      FData:= Data;
      FCountChild:=CountChild;
      SetLength(FLinks, CountChild); // ��������� ������ ��� ������
      FVertKey:=0;
      FHorzKey:=0;
      FParent:=Parent;
       l:=0;

      //���� ���� ��������, �� ������� ��������� ����� �������� ������ ��������
      if Parent<>nil then
        begin
             SetLength(CoordinatesEmptyField, length(FParent^.CoordinatesEmptyField));//��������� ������
             CoordinatesEmptyField:=FParent^.CoordinatesEmptyField;//����������� ������
        end
                      else
       //���� ���, �� �������� ������� ��� ������(�.�. ��� ������ ����� ������)
       begin
             SetLength(CoordinatesEmptyField, CountChild); //��������� ������
             for I := 0 to 2 do
               for j := 0 to 2 do
                begin
                  CoordinatesEmptyField[l].X:=i;
                  CoordinatesEmptyField[l].Y:=j;
                  l:=l+1;
                end;

       end;
end;


function TNode.GetData: TData;
begin
      Getdata:= FData;
end;


function TNode.KeyWin: byte;
begin


end;

function TNode.GetLinks(index: integer): pNode;
begin
     result:=FLinks[index];
end;

procedure TNode.SetData(Data:TData);
begin
     FData:=Data;
end;


procedure TNode.SetLinks(index: integer; value: pNode);
begin
     FLinks[index]:=value;
end;
//------------------------------------------------------------------------------


{ TTree }

 // ���������� ������ ������----------------------------------------------------
constructor TTree.Create;
begin
   //FRoot:=nil;
   new(FRoot);
end;


destructor TTree.destroy;
begin
    FRoot:=nil;
    dispose(FRoot);
end;



procedure TTree.InitializationTree(Root: pNode; Data:TData; CountChild: integer; Parent:pNode);

//----------------------------�������� ����-------------------------------------
function Generation(Node:pNode; cross,toe:integer):TData;
var value, j:integer;
 begin
   value:=0;
   //new(Node);
   randomize;
   value:=random(length(Node^.CoordinatesEmptyField));

   Result:=Node^.Data;

   //����� ���� � ������������ ���������� ���� (�� ������� ��������� ������) 1 ��� 2
  if length(Node^.CoordinatesEmptyField)<>0 then
  begin
   if (cross>toe)  then
       Result[Node^.Parent^.CoordinatesEmptyField[value].X,Node^.Parent^.CoordinatesEmptyField[value].Y]:=2
                   else
       Result[Node^.Parent^.CoordinatesEmptyField[value].X,Node^.Parent^.CoordinatesEmptyField[value].Y]:=1;

   //����� ��������� �����, ������� ��������� ������ �� ������������
   for j := value to high(Node^.Parent^.CoordinatesEmptyField) do

     if j<>high(Node^.Parent^.CoordinatesEmptyField) then
         begin

           //����� ��������� � ����
           Node^.CoordinatesEmptyField[j].X:=Node^.CoordinatesEmptyField[j+1].X;
           Node^.CoordinatesEmptyField[j].Y:=Node^.CoordinatesEmptyField[j+1].Y;

           //����� ��������� � �������� ����
           Node^.Parent^.CoordinatesEmptyField[j].X:=Node^.Parent^.CoordinatesEmptyField[j+1].X;
           Node^.Parent^.CoordinatesEmptyField[j].Y:=Node^.Parent^.CoordinatesEmptyField[j+1].Y;
         end;

      //�������� �������� ��������
     setlength(Node^.CoordinatesEmptyField, length(Node^.CoordinatesEmptyField)-1);
     setlength(Node^.Parent^.CoordinatesEmptyField, length(Node^.Parent^.CoordinatesEmptyField)-1);
  end;
 end;
 //-----------------------------------------------------------------------------

var
  I, k: Integer;
  cross,toe:byte;
  begin
   cross:=0;
   toe:=0;


   // ������� ������------------------------
       Root^:=Tnode.Create(Data,CountChild, Parent);


      if Root^.Parent<>nil then
        begin

          //������� ���-�� ��������� � �������
           for i := 0 to 2 do
            for k := 0 to 2 do
              begin
                    if Root^.Parent^.Data[i,k]=1 then
                       cross:=cross+1 else
                    if Root^.Parent^.Data[i,k]=2 then
                       toe:=toe+1;
              end;

           //���������� ���� ��� ����� ����
           Root^.Data:=Generation(Root, cross, toe);
        end;



        //�������� ��������
      if Root^.CountChild>0 then
        begin
             for I := 0 to Root^.CountChild-1 do
                 if Root^.Links[i]=nil then
                   begin
                      Root^.Links[i]:=new(pNode);
                      InitializationTree( Root^.Links[i], Root^.Data, Root^.CountChild-1, Root);
                   end;

        end;


 end;



function TTree.SearchState(Root:pNode; Data: TData):TData;
var
  I: Integer;
begin




end;

//------------------------------------------------------------------------------
end.
