program Perpustakaan;

uses crt;
Const Hotel    = 15;
Const Kuliner  = 5;
Const Film     = 10;

type DataPeminjam = record
        Nama    :   String;
        Point   :   integer;
        Tiket   :   String;
end;

var
        Data                                  :       array of DataPeminjam;
        indeks                                :       integer;
        dicari                                :       integer;
        status                                :       boolean;
        j                                     :       integer;
        Simpan                                :       File of DataPeminjam;
        SimpanIndeks                          :       File of integer;

procedure Delete();
var
        x, k                                  :       integer;
begin
        for j:=0 to indeks-1 do
        begin
        writeln('No. ',J+1);
        writeln('Nama: ',(Data[j].Nama));
        writeln('Point: ',(Data[j].Point));
        writeln('Tiket: ',(Data[j].Tiket));
        writeln;
        end;
        write('Opsi yang ingin dihapus ');
        Readln(x);
        while (x > indeks) or (x <= 0) do
        begin
        writeln();
        writeln('Opsi Tidak Tersedia');
        writeln();
        write('Opsi yang ingin dihapus ');
        readln(x);
        end;
        for k := x to indeks - 1 do
        begin
        Data[k-1] := Data[k];
        end;
        indeks := indeks - 1;
end;

procedure editData();
Var
        Namaganti                                : String;
begin
        writeln('Silahkan Masukkan Nomor Inputan yang akan diganti');
        readln(j);
        writeln('Silahkan Masukkan Nama Orang yang akan di ganti pada buku nomor',j);
        readln(namaganti);
        Data[j-1].Nama:=namaganti;
        Writeln('SELAMAT! DATA ANDA TELAH DIGANTI! ');
        readln;
end;

procedure LihatData();
var
        pilihan    :       char;
begin
        writeln('Lihat Data Peminjam');
        for j:=0 to indeks-1 do
        begin
        writeln('No. ',J+1);
        writeln('Nama: ',(Data[j].Nama));
        writeln('Point: ',(Data[j].Point));
        writeln('Tiket: ',(Data[j].Tiket));
        writeln;
        end;
        writeln('Ingin mengedit data? (Y/N)');
        readln(pilihan);
                if (pilihan='y') or (pilihan='Y') then begin
                        editdata();
                end;
        readln;
end;

Procedure SearchingNama(var x : string);
var
        i       : integer;
begin
        i := 0;
        dicari := 0;
        status := false;
        while (i < indeks-1) and (x <> Data[i].Nama) do
                i := i + 1;
        if ( x = Data[i].Nama ) then
        begin
                dicari := i;
                status := true;
        end;
end;

Procedure Sorting();
Var
        pass, j, max  : integer;
        temp       : DataPeminjam;
Begin
        for pass:= 0 to indeks-1 do
        begin
                max := pass;
                for j := max+1 to indeks do
                begin
                        if (Data[j].Point > Data[max].Point) then
                                max := j;
                end;
        temp := Data[pass];
        Data[pass] := Data[max];
        Data[max] := temp;
        end;
End;

Procedure Reset_Lanjut();
var
        X       :       integer;
begin
        clrscr;
        Writeln('============================== WELCOME ==============================');
        Writeln('                                                                     ');
        Writeln('                                                                     ');
        Writeln('                            1.Reset Data                             ');
        Writeln('                            2.Lanjut Data                            ');
        Writeln('                                                                     ');
        Writeln('=====================================================================');
        Writeln('                                 ***                                 ');
        Writeln('                                                                     ');
        Write('Pilihan :  ');
        Readln(x);
        case x of
           1 : Begin
                Rewrite(SimpanIndeks);
                Write(SimpanIndeks,0);
                Reset(SimpanIndeks);
                Read(SimpanIndeks,indeks);
                indeks :=0;
               end;
           2 : Begin
                Reset(SimpanIndeks);
                Read(SimpanIndeks,indeks);
                Reset(Simpan);
                for J :=0 to indeks - 1 do
                        Read(Simpan,Data[J]);
               end;
           0 : begin
               end;
           end;
End;

procedure menu();
var
        NamaID, NamaBuku                      :       String;
        DataMenu                              :       integer;
        menu,opsi                             :       integer;
        Buku                                  :       string;
        i, j, tukar                           :       integer;
Begin
        clrscr;
        writeln('==========================================================================================================');
        writeln('*                                                                                                        *');
        writeln('*                                                                                                        *');
        writeln('*                  [[[[SELAMAT DATANG DI APLIKASI PERPUSTAKAAN EMERALD CITY]]]]                          *');
        writeln('*                                                                                                        *');
        writeln('*                                                                                                        *');
        writeln('==========================================================================================================');
        writeln();
        writeln(' Setiap Kali Pengunjung Meminjam Buku akan Mendapatkan Level Point yang Bisa ditukar dengan Tiket Menarik ');
        writeln();
        writeln('                                         ~TEKAN ENTER~                                                    ');
        writeln();
        readln;
        Reset_Lanjut();
        repeat
        clrscr;
        writeln('========================== MENU ==================================');
        writeln();
        writeln('1.Peminjaman Buku');
        writeln('2.Lihat Point Peminjam (Berdasarkan Poin Tertinggi)');
        writeln('3.Mencari Data Peminjam');
        writeln('4.Lihat Data Peminjam');
        writeln('5.Hapus Data');
        writeln('0.Keluar');
        writeln();
        writeln('==================================================================');
        writeln();
        writeln();
        write(' Masukan No Menu : ');
        readln(DataMenu);
        while (DataMenu <> 1) and (DataMenu <> 2) and (DataMenu <> 3) and (DataMenu<>4) and (DataMenu <> 5) and (DataMenu <> 0) do
        begin
                writeln(' Opsi yang Anda Masukkan Tidak Tersedia, Silahkan Masukkan Kembali: ');
                readln(DataMenu);
        end;
        clrscr;
        case DataMenu of
        1:      begin
                clrscr;
                writeln('Masukan Nama Peminjam Buku : ');
                readln(NamaID);
                NamaID := Upcase(NamaID);
                SearchingNama(NamaID);
                if (status = true) then
                        j := dicari
                else
                begin
                        j := indeks;
                        Data[j].Nama := NamaID;
                end;
                writeln('Masukan Judul Buku yang di Pinjam   ');
                readln(Buku);

                Data[j].Point := Data[j].Point + 1;
                clrscr;
                writeln('Data Berhasil di tambahkan');
                writeln('[[[[[[[[[[Klik Enter untuk Kembali ke Menu Sebelumnya...]]]]]]]]]]');
                if (j = indeks) then
                        indeks := indeks + 1;
                readln;
                end;
        2:      begin
                clrscr;
                Sorting();
                for i:=0 to indeks-1 do
                        begin
                        writeln('Nama Peminjam  : ',Data[i].Nama);
                        Writeln('Poin           : ',Data[i].Point);
                        Writeln('Tiket          : ',Data[i].Tiket);
                        Writeln();
                        end;
                Writeln('<<<<<<<<<< 1.Tukar Tiket >>>>>>>>>>');
                Writeln('<<<<<<<<<<  0.Kembali    >>>>>>>>>>');
                Write('Pilihan : ');
                readln(opsi);
                while (opsi <> 1) and (opsi <> 0) do
                        readln(opsi);
                case opsi of
                1:      begin
                        Writeln();
                        Write('Masukkan Nama Peminjam : ');
                        readln(NamaID);
                        NamaID := Lowercase(NamaID);
                        SearchingNama(NamaID);
                        Writeln();
                        Writeln('1.[Tiket Hotel  (15 Poin)]');
                        Writeln('2.[Tiket Film   (10 Poin)]');
                        Writeln('3.[Tiket Kuliner( 5 Poin)]');
                        Write('Pilihan : ');
                        readln(tukar);
                        while (tukar <> 1) and (tukar <> 2) and (tukar <> 3) do
                                readln(tukar);
                        case tukar of
                                1 :     Begin
                                        if (Data[dicari].Point < Hotel) then
                                        begin
                                                writeln();
                                                writeln('Poin Tidak cukup');
                                                readln;
                                        end
                                        else
                                        begin
                                                Data[dicari].Point := Data[dicari].Point - Hotel;
                                                Data[dicari].Tiket := Data[dicari].Tiket + 'Hotel ';
                                        end;
                                        End;
                                2 :     Begin
                                        if (Data[dicari].Point < Film) then
                                        begin
                                                writeln();
                                                writeln('Poin Tidak cukup');
                                                readln;
                                        end
                                        else
                                        begin
                                                Data[dicari].Point := Data[dicari].Point - Film;
                                                Data[dicari].Tiket := Data[dicari].Tiket + 'Film ';
                                        end;
                                        End;
                                3 :     Begin
                                        if (Data[dicari].Point < Kuliner) then
                                        begin
                                                writeln();
                                                writeln('Poin Tidak Cukup');
                                                readln;
                                        end
                                        else
                                        begin
                                                Data[dicari].Point := Data[dicari].Point - Kuliner;
                                                Data[dicari].Tiket := Data[dicari].Tiket + 'Kuliner ';
                                        end;
                                        End;
                        end;
                        end;
                2:      begin
                        end;
                end;
                end;
        3:      Begin
                Clrscr;
                Write('Masukkan Nama Peminjam yang Ingin Dicari : ');
                Readln(NamaID);
                NamaID := Upcase(NamaID);
                SearchingNama(NamaID);
                If (status = false) then
                Begin
                        Writeln('Data peminjam tidak ditemukan');
                        Readln;
                End
                Else
                Begin
                        writeln();
                        Writeln('Nama Peminjam : ',Data[dicari].Nama);
                        Writeln('Poin          : ',Data[dicari].Point);
                        Writeln('Tiket         : ',Data[dicari].Tiket);
                        Readln;
                End;
                End;
        4       :begin
               LihatData();
               end;
        5       :begin
                Delete();
                 end;
        end;
        until DataMenu = 0;
end;


Begin
        setlength(Data,999999);
        Assign(Simpan,'SimpanData.dat');
        Reset(Simpan);
        Assign(SimpanIndeks,'SimpanIndeksData.dat');
        Reset(Simpan);
        indeks := 0;
        menu();
        Reset(Simpan);
        Rewrite(Simpan);
        Rewrite(SimpanIndeks);
        Write(SimpanIndeks,indeks);
        close(SimpanIndeks);
        for J :=0 to indeks - 1 do
        begin
         write(Simpan,Data[J]);
        end;
        close(Simpan);
End.
