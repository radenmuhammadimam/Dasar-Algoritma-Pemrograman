{File : tugasbesarDAP.pas}
{Desc : Menyediakan Informasi Review Cafe Berdasarkan Kualitas Wifi, Pastry, dan Coffee}
{Date : 24 Mei '17}

program tugasbesarDAP;
uses crt;

type
        cafe      = record
        nama_cafe : string;
        wifi      : integer;
        pastry    : integer;
        coffee    : integer;
        ratarata  : real;
end;

var
        daftar_cafe        : array [1..100] of cafe;
        i, menu,search     : integer;
        jumlah_cafe, cafe1 : integer;
        subsearch          : integer;
        max                : cafe;
        cari               : string;

procedure sorting();
var
        j : integer;
        tmp : cafe;
begin
        for i := 2 to jumlah_cafe do
        begin
                tmp := daftar_cafe[i];
                j:=1;
                while ((j>1) and (tmp.ratarata<daftar_cafe[j-1].ratarata)) do
                begin
                        daftar_cafe[j] := daftar_cafe[j-1];
                        j := j-1;
                end;
                daftar_cafe[j] := tmp
        end;
end;

procedure review();
var
	cafe1 : integer;

begin
        clrscr;
        writeln ('Masukkan Jumlah Cafe : ');
        readln  (cafe1);
        for i := jumlah_cafe + 1 to jumlah_cafe + cafe1 do
        begin
                writeln ('Nama Cafe       : ');
                readln  (daftar_cafe[i].nama_cafe);
                writeln ('Kualitas Wifi   : ');
                readln  (daftar_cafe[i].wifi);
                writeln ('Kualitas Pastry : ');
                readln  (daftar_cafe[i].pastry);
                writeln ('Kualitas Coffee : ');
                readln  (daftar_cafe[i].coffee);
        end;
		jumlah_cafe := jumlah_cafe + cafe1;
end;

procedure search_wifi(var max : cafe;var l:integer);
begin
        max.wifi := 0;
        for i := 1 to jumlah_cafe do
        begin
                if daftar_cafe[i].wifi > max.wifi then
                begin
                        max := daftar_cafe[i];
                        l:=i;
                        break;
                end;
        end;
end;

procedure search_pastry(var max : cafe;var l:integer);
begin
        max.pastry := 0;
        for i := 1 to jumlah_cafe do
        begin
                if daftar_cafe[i].pastry > max.pastry then
                begin
                        max := daftar_cafe[i];
                        l:=i;
                        break;
                end;
        end;
end;

procedure search_coffee(var max : cafe;var l:integer);
begin
        max.coffee := 0;
        for i := 1 to jumlah_cafe do
        begin
                if daftar_cafe[i].coffee > max.coffee then
                begin
                        max := daftar_cafe[i];
                        l:=i;
                        break;
                end;
        end;
end;

procedure show();
begin
        for i := 1 to jumlah_cafe do
        begin                           ;
                writeln ('Cafe Ke - ',i);
                writeln ('Nama Cafe       : ',daftar_cafe[i].nama_cafe);
                writeln ('Kualitas Wifi   : ',daftar_cafe[i].wifi);
                writeln ('Kualitas Pastry : ',daftar_cafe[i].pastry);
                writeln ('Kualitas Coffee : ',daftar_cafe[i].coffee);
                daftar_cafe[i].ratarata:=(daftar_cafe[i].coffee+daftar_cafe[i].pastry+daftar_cafe[i].wifi)/3;
                writeln;
        end;
		readln();
end;

procedure search_cafe(var i:integer;var cari:string);
begin
        i := 1;
        while ((i <= jumlah_cafe) and (daftar_cafe[i].nama_cafe <> cari)) do
        begin
                i := i + 1;
        end;
end;


begin

        while menu<>6 do
        begin
                clrscr;
                writeln ('SELAMAT DATANG DI INFORMASI REVIEW CAFE');
                writeln ('Menu');
                writeln ('1. Input  Data');
                writeln ('2. Show   Data');
                writeln ('3. Search Data');
                writeln ('4. Edit   Data');
                writeln ('5. Delete Data');
                writeln ('6. Exit       ');
                writeln ('Pilih Menu :  ');
                readln  (menu);
                case menu of

                        1: begin
                                review;
                           end;

                        2: begin
                                show;
                           end;

                        3: begin
                                writeln('Cari Berdasarkan : ');
                                writeln('1. Wifi      ');
                                writeln('2. Pastry    ');
                                writeln('3. Coffee    ');
                                writeln('4. Nama Cafe ');
                                readln(subsearch);
                                case subsearch of

                                1: begin
                                        search:=0;
                                        search_wifi(max,search);
                                        writeln('Cafe Dengan Wifi Tercepat Adalah Cafe ' ,max.nama_cafe);
                                        readln;
                                   end;

                                2: begin
                                        search:=0;
                                        search_pastry(max,search);
                                        writeln('Cafe Dengan Pastry Terenak Adalah Cafe ' ,max.nama_cafe);
                                        readln;
                                   end;

                                3: begin
                                        search:=0;
                                        search_coffee(max,search);
                                        writeln('Cafe Dengan Coffee Terenak Adalah Cafe ' ,max.nama_cafe);
                                        readln;
                                   end;

                                4: begin
                                        search:=0;
                                        writeln('Masukkan Nama Cafe Yang Akan Di Cari : ');
                                        readln(cari);
                                        search_cafe(search,cari);
                                        if daftar_cafe[search].nama_cafe = cari then
                                        begin
                                        writeln('Nama Cafe       : ',daftar_cafe[search].nama_cafe);
                                        writeln('Kualitas Wifi   : ',daftar_cafe[search].wifi);
                                        writeln('Kualitas Pastry : ',daftar_cafe[search].pastry);
                                        writeln('Kualitas Coffee : ',daftar_cafe[search].coffee);
                                        writeln('Score Cafe      : ',daftar_cafe[search].ratarata:0:0);
                                        end;
                                        readln;
                                   end;

                                end;
                          end;

			5 : begin
                                writeln('Cari Berdasarkan : ');
                                writeln('1. Wifi      ');
                                writeln('2. Pastry    ');
                                writeln('3. Coffee    ');
                                writeln('4. Nama Cafe ');
                                readln(subsearch);
                                case subsearch of

                                1: begin
                                        search:=0;
                                        search_wifi(max,search);
                                        if max.wifi<>0 then
                                        begin
                                                daftar_cafe[search].nama_cafe:='0';
                                                daftar_cafe[search].wifi:=0;
                                                daftar_cafe[search].pastry:=0;
                                                daftar_cafe[search].coffee:=0;
                                                daftar_cafe[search].ratarata:=0;
                                        end;
                                        readln;
                                   end;

                                2: begin
                                        search:=0;
                                        search_pastry(max,search);
                                        if max.pastry<>0 then
                                        begin
                                                daftar_cafe[search].nama_cafe:='0';
                                                daftar_cafe[search].wifi:=0;
                                                daftar_cafe[search].pastry:=0;
                                                daftar_cafe[search].coffee:=0;
                                                daftar_cafe[search].ratarata:=0;
                                        end;
                                        readln;
                                   end;

                                3: begin
                                        search:=0;
                                        search_coffee(max,search);
                                        if max.coffee<>0 then
                                        begin
                                                daftar_cafe[search].nama_cafe:='0';
                                                daftar_cafe[search].wifi:=0;
                                                daftar_cafe[search].pastry:=0;
                                                daftar_cafe[search].coffee:=0;
                                                daftar_cafe[search].ratarata:=0;
                                        end;
                                        readln;
                                   end;

                                4: begin
                                        search:=0;
                                        writeln('Masukkan Nama Cafe Yang Akan Di Cari : ');
                                        readln(cari);
                                        search_cafe(search,cari);
                                        if daftar_cafe[search].nama_cafe = cari then
                                        begin
                                                daftar_cafe[search].nama_cafe:='0';
                                                daftar_cafe[search].wifi:=0;
                                                daftar_cafe[search].pastry:=0;
                                                daftar_cafe[search].coffee:=0;
                                                daftar_cafe[search].ratarata:=0;
                                        end;
                                        readln;
                                   end;

                            end;
                            end;

			4 : begin
                                writeln('Cari Berdasarkan : ');
                                writeln('1. Wifi      ');
                                writeln('2. Pastry    ');
                                writeln('3. Coffee    ');
                                writeln('4. Nama Cafe ');
                                readln(subsearch);
                                case subsearch of

                                1: begin
                                        search_wifi(max,search);
                                        if max.wifi<>0 then
                                        begin
                                                write('Nama: ');
                                                readln(daftar_cafe[search].nama_cafe);
                                                write('Wifi: ');
                                                readln(daftar_cafe[search].wifi);
                                                write('Pastry: ');
                                                readln(daftar_cafe[search].pastry);
                                                write('Coffee: ');
                                                readln(daftar_cafe[search].coffee);
                                                daftar_cafe[search].ratarata:=(daftar_cafe[search].coffee+daftar_cafe[search].pastry+daftar_cafe[search].wifi)/3;
                                        end;
                                        readln;
                                   end;

                                2: begin
                                        search_pastry(max,search);
                                        if max.pastry<>0 then
                                        begin
                                                write('Nama: ');
                                                readln(daftar_cafe[search].nama_cafe);
                                                write('Wifi: ');
                                                readln(daftar_cafe[search].wifi);
                                                write('Pastry: ');
                                                readln(daftar_cafe[search].pastry);
                                                write('Coffee: ');
                                                readln(daftar_cafe[search].coffee);
                                                write('Rata-rata: ');
                                                daftar_cafe[search].ratarata:=(daftar_cafe[search].coffee+daftar_cafe[search].pastry+daftar_cafe[search].wifi)/3;
                                        end;
                                        readln;
                                   end;

                                3: begin
                                        search_coffee(max,search);
                                        if max.coffee<>0 then
                                        begin
                                                write('Nama: ');
                                                readln(daftar_cafe[search].nama_cafe);
                                                write('Wifi: ');
                                                readln(daftar_cafe[search].wifi);
                                                write('Pastry: ');
                                                readln(daftar_cafe[search].pastry);
                                                write('Coffee: ');
                                                readln(daftar_cafe[search].coffee);
                                                daftar_cafe[search].ratarata:=(daftar_cafe[search].coffee+daftar_cafe[search].pastry+daftar_cafe[search].wifi)/3;
                                        end;
                                        readln;
                                   end;

                                4: begin
                                        writeln('Masukkan Nama Cafe Yang Akan Di Cari : ');
                                        readln(cari);
                                        search_cafe(search,cari);
                                        if daftar_cafe[search].nama_cafe = cari then
                                        begin
                                                write('Nama: ');
                                                readln(daftar_cafe[search].nama_cafe);
                                                write('Wifi: ');
                                                readln(daftar_cafe[search].wifi);
                                                write('Pastry: ');
                                                readln(daftar_cafe[search].pastry);
                                                write('Coffee: ');
                                                readln(daftar_cafe[search].coffee);
                                                daftar_cafe[search].ratarata:=(daftar_cafe[search].coffee+daftar_cafe[search].pastry+daftar_cafe[search].wifi)/3;
                                        end;
                                        readln;
                                   end;

                                 end;
                        end;
                      end;
        end;
                readln;
End.
