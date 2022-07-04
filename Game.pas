program game;

uses crt;
var ctrl:char;
    i,all,score,xxx,yyy,x,y:longint;
{$sound}
procedure soundwin;
 begin
  sound(2000);
  sound(9000);
  delay(500);
  nosound;
 end;

procedure soundlose;
begin
 sound(350);
 sound(550);
 delay(500);
 nosound;
end;
{$pad}
procedure GO(x:longint);
 begin
  TEXTCOLOR(WHITE);
  gotoxy(x,19);
  write('XXXXX');
 end;
{$ball}
PROCEDure CONTROL(XXX,yyy:longint);
 begin
 TEXTCOLOR(random(50));
 gotoxy(XXX,yyy);
 write('00');
 gotoxy(XXX,yyy);
 WRITE('00');
 end;

{$gui}
PROCEdure GUI;
var i:longint;
BEGIN
TEXTCOLOR(WHITE);
 GOTOxy(61,1);
WRITE('******************');
FOR I:=2 TO 6 DO
BEGIN
GOTOxy(61,I);
WRITE('*');
end;
FOR I:=2 TO 6 DO
BEGIN
GOTOxy(78,i);
write('*');
end;
gotoxy(61,I);
write('*****************');
gotoxy(62,10);
WRITE('EGG CATCHING GAME');
gotoxy(62,11);
WRITE('DEMO V1');
GOTOXY(62,12);
WRITE('BY METARU');
{--------------------------------------------}
for i:=1 to 19 do
begin
GOTOXY(1,i);
write('*');
GOTOXY(60,I);
WRITE('*');
end;
end;

BEGIN
CLRSCR;
x:=45;
gui;
{$Mechanic}
Repeat
RANDOMIZE;
xxx:=random(60);
for yyy:=1 to 18 do
begin
  CONTROL(XXX,YYY);
  DELAY(20);
IF keypressed=true then
 BEGIN
ctrl:=readkey;
IF CTRL='P' then halt;
if ctrl='A' then
 BEGIN
 CLRSCR;
// CLREOL;
 GUI;
  GOTOXY(63,3);
  write(score,'/',all);
 IF X-3>1 THEN
  x:=X-3;
  GO(x);
 end;
if ctrl='D' then
 BEGIN
 CLRSCR;
//  CLREOL;
 GUI;
  GOTOXY(63,3);
  write(score,'/',all);
 IF X+3<60 THEN
 X:=X+3;
 GO(X);
 end;
END;
delay(120);

IF (YYY=18) AND ((XXX=X) OR (XXX=X+1) OR(XXX=X+2) OR (xXX=X+3) OR (XXX=X+4) OR (xxx=x+5))THEN
BEGIN
 INC(Score);
 soundwin;
end;
IF (YYY=18) AND ((XXX<>X) and (XXX<>X+1) and(XXX<>X+2) and (xXX<>X+3) and (XXX<>X+4) and (xxx<>x+5))THEN
BEGIN
 soundlose;
end;

IF YYY=18 THEN
begin
 inc(all);
 gui;
 GOTOXY(63,3);
  write(score,'/',all);
end;

end;
until ctrl=('P');


readln;
END.


