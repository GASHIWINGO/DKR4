uses CRT;
uses graphabc;
var n:byte;
function func(var x:real):real;
begin
  var f:real;
  f:=(exp(ln(x)*3))-1*(exp(ln(x)*2))+5*x+3;
  func:=f;
end;

function pervoobr(x:real):real;
begin
pervoobr:=(x*(x*(exp(ln(x)*3))-2*(exp(ln(x)*2))+15*x+18))/6;
end;

procedure ploshad;
begin
  println('Введите пределы интегрирования');
  var a := ReadInteger('Первая координата:');
  var b := ReadInteger('Вторая координата:');
  var n := ReadInteger('Количество секций:');
  var h:=(b-a)/n;
  var f:real;
  var x:=a+h;
  var s:real;
  for var i:=0 to n-1 do begin
    s+=func(x);
    x+=h;
  end;
  s:=s*h;
  println('Площадь:',s);
  Textcolor(4);
  Println('****************************************************');
  Textcolor(15);
  println('Для вычисления погрешности введите 2');
  println('Чтобы выйти из программы введите любой другой символ');
  readln(n);
  if n=2 then begin
  var y:=pervoobr(b)- pervoobr(a);
  writeln('Погрешность = ',abs(y-s)/y);
  Textcolor(4);
  Println('****************************************************');
  Textcolor(15);
  end;
end;

procedure integral;
begin
  setpencolor(clpurple);
  setpenstyle(psDash);
  line(315,255,315,105);
  line(310,255,310,140);
  line(305,255,305,180);
  line(300,255,300,210);
  setfontcolor(clRed);
  textout(292,260,'a');
  textout(317,260,'b');
  SetFontSize(5);
  setfontcolor(clblack);
  textout(292,280,'x0');
  textout(317,280,'xn');
  textout(295,255,'x0');
  textout(305,255,'x1');
  textout(295,245,'h');
  textout(280,205,'f(x0)');
  textout(285,180,'f(x1)');
  textout(230,198,'b');
  textout(230,220,'a');
  SetFontSize(10);
  setfontcolor(clblue);
  textout(230,205,'∫f(x)dx');
end;

procedure strichovka;
begin
  setpencolor(clred);
  line(296,240,320,240);
  line(298,230,320,230);
  line(300,220,320,220);
  line(301,210,320,210);
  line(302,200,320,200);
  line(303,190,320,190);
  line(304,180,320,180);
  line(305,170,320,170);
  line(307,160,320,160);
  line(309,150,320,150);
  line(310,140,320,140);
  line(312,130,320,130);
  line(313,120,320,120);
  line(314,110,320,110);
  line(315,100,320,100);
  line(316,90,320,90);
  textout(0,150,'Введите 6 для визуализации вычисления');
  textout(0,165,'интеграла');
  var n:integer;
  read(n);
  if n=6 then integral;
end;

procedure mastab;
begin
  ClearWindow;
  line(0,255,640,255);
  line(320,0,320,510);
  SetFontSize(10);
  var xh:=round((640/2)/4); //80x
  var i:=3;
  var xz:=640-xh;
  repeat 
    line(xz,250,xz,260);
    textout(xz-3,265,i);
    xz-=xh;
    i-=1;
  until i=0;
  xh:=round((640/2)/4);
  i:=-3;
  xz:=xh;
  repeat 
    line(xz,250,xz,260);
    textout(xz-7,265,i);
    xz+=xh;
    i+=1;
  until i=0;
  textout(xz+10,260,0);
  var yh:=round((510/2)/4);//63,75y
  i:=3;
  var yz:=yh;
  repeat 
    line(315,yz,325,yz);
    textout(328,yz-7,i);
    yz+=yh;
    i-=1;
  until i=0;
  yh:=round((510/2)/4);
  i:=-3;
  yz:=510-yh;
  repeat 
    line(315,yz,325,yz);
    textout(328,yz-8,i);
    yz-=yh;
    i+=1;
  until i=0;
  setpencolor(clgreen);
  line(260,510,328,0);
  setpencolor(clblack);
  textout(0,0,'Информация о задании:');
  textout(0,15,'1. Дополнить программу, реализованную в ходе');
  textout(0,30,'предыдущей лабораторной работы, режимом');
  textout(0,45,'визуализации.');
  textout(0,60,'2. Предусмотреть возможность вывода кривой.');
  textout(0,75,'3. Масштабирование графика, подписи на осях,');
  textout(0,90,'вывод информации о задании.');
  textout(0,105,'4. Штриховка вычисляемой площади,');
  textout(0,120,'визуализация численного расчета интеграла.');
  textout(0,135,'Введите 5 для штриховки фигуры');
  var n:integer;
  read(n);
  if n=5 then strichovka;
end;

procedure graph;
begin
  line(0,300,200,300);
  line(100,215,100,400);
  line(100,215,95,220);
  line(100,215,105,220);
  setfontcolor(clRed);
  textout(110,210,'y');
  line(200,300,195,295);
  line(200,300,195,305);
  textout(194,306,'x');
  setfontcolor(clblack);
  var xm:=0;
  var i:=-9;
  repeat 
    xm+=10;
    line(xm,302,xm,298);
    SetFontSize(5);
    textout(xm-3,304,i);
    inc(i);
  until i = 0;
  i:=1;
  xm+=10;
  textout(xm+2,303,'0');
  repeat
    xm+=10;
    line(xm,302,xm,298);
    SetFontSize(5);
    textout(xm-3,304,i);
    inc(i);
  until xm > 180;
  var ym:=215;
  i:=8;
  repeat
    ym+=10;
    line(102,ym,98,ym);
    SetFontSize(5);
    textout(105,ym-3,i);
    i-=1;
  until i=0;
  i:=-1;
  ym+=10;
  repeat
    ym+=10;
    line(102,ym,98,ym);
    SetFontSize(5);
    textout(105,ym-3,i);
    i-=1;
  until ym > 380;
  setpencolor(clgreen);
  line(88,400,95,300);
  line(95,300,100,270);
  line(100,270,108,220);
  setpencolor(clblack);
  setfontcolor(clblue);
  textout(35,350,'y=2x^3-1x^2+5x+3');
  setfontcolor(clblack);
  var n:integer;
  textout(120,217,'Информация о задании:');
  textout(120,223,'1. Дополнить программу, реализованную в ходе предыдущей лабораторной работы, режимом визуализации.');
  textout(120,229,'2. Предусмотреть возможность вывода кривой.');
  textout(120,235,'3. Масштабирование графика, подписи на осях, вывод информации о задании.');
  textout(120,241,'4. Штриховка вычисляемой площади, визуализация численного расчета интеграла.');
  SetFontSize(10);
  textout(0,400,'Введите 4 для масштабирования графика');
  read(n);
  if n=4 then mastab;
end;

begin
    setwindowsize(640,510);
    Textcolor(4);
    Println('****************************************************');
    Textcolor(15);
    Println('Вычисление площади фигуры, ограниченной кривой');
    println('Для вычисления площади введите 1');
    println('Чтобы выйти из программы введите любой другой символ');
    Textcolor(4);
    Println('****************************************************');
    Textcolor(15);
    readln(n);
    if n=1 then ploshad;
    print('Введите 3 для построения графика');
    read(n);
    if n = 3 then graph;
end.