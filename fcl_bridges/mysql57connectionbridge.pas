unit mysql57connectionbridge;

{$mode objfpc}{$H+}

interface

uses
  Classes, mysql57conn, sqldb;

type

  { TMySQL57ConnectionBridge }

  TMySQL57ConnectionBridge = class(TComponent)
  private

    FDatabaseName: string;
    FHostName: string;
    FPort: integer;
    FPassword: string;
    FUserName: string;

    procedure SetDatabaseName(database: string);
    procedure SetHostName(host: string);
    procedure SetPort(portnumber: integer);
    procedure SetPassword(pwd: string);
    procedure SetUserName(user: string);

  protected

  public

    MySQL57Connection: TMySQL57Connection;
    SQLQuery: TSQLQuery;
    SQLTransaction: TSQLTransaction;

    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function Connect(): boolean;


  published
    property DatabaseName: string read FDatabaseName write SetDatabaseName;
    property HostName: string read FHostName write SetHostName;
    property Port: integer read FPort write FPort;
    property Password: string read FPassword write SetPassword;
    property UserName: string read FUserName write SetUserName;

  end;


implementation

{ TMySQL57Bridge }

procedure TMySQL57ConnectionBridge.SetDatabaseName(database: string);
begin
   FDatabaseName:= database;
end;

procedure TMySQL57ConnectionBridge.SetHostName(host: string);
begin
   FHostName:= host;
end;

procedure TMySQL57ConnectionBridge.SetPort(portnumber: integer);
begin
   FPort:= portnumber;
end;

procedure TMySQL57ConnectionBridge.SetPassword(pwd: string);
begin
   FPassword:= pwd;
end;

procedure TMySQL57ConnectionBridge.SetUserName(user: string);
begin
  FUserName:= user;
end;

constructor TMySQL57ConnectionBridge.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  try
    MySQL57Connection:=TMySQL57Connection.Create(nil);
    MySQL57Connection.SkipLibraryVersionCheck:=true;
    SQLTransaction:=TSQLTransaction.Create(nil);
    SQLQuery:=TSQLQuery.Create(nil);
  except
     //ShowMessage('fail to init TMySQL57Bridge');
  end;
end;

destructor TMySQL57ConnectionBridge.Destroy;
begin
  SQLTransaction.Free;
  SQLQuery.Free;
  MySQL57Connection.Free;
  inherited Destroy;
end;

function TMySQL57ConnectionBridge.Connect(): boolean;
begin

  Result:= False;

  MySQL57Connection.DatabaseName:= FDatabaseName;
  MySQL57Connection.HostName:= FHostName;
  MySQL57Connection.Port:= FPort;
  MySQL57Connection.Password:= FPassword;
  MySQL57Connection.UserName:= FUserName;

  SQLQuery.DataBase:=MySQL57Connection;
  SQLQuery.Transaction:=SQLTransaction;
  try
    MySQL57Connection.Open();
    MySQL57Connection.Connected:= True;
  except
    MySQL57Connection.Connected:= False;
     //ShowMessage('connection fail...');
  end;

  Result:= MySQL57Connection.Connected;
end;

end.
