*proc stobul
*do dmn
set talk off
set cent on
set dele on
CLOS DATa
sele 1
USE STOK INDE STOK1
sele 2
use lstok
sele 3
use jual inde jualb
sele 4
use beli inde belib
DEFI WIND dokt;
FROM 10.5,(wcols()-75)/2 to 24.7,((wcols()-75)/2)+75 system title'Stok Barang Bulanan';
colo rgb(255,255,255,129,126,101) font'Times New Roman',12
DEFI WIND dokt1;
FROM 0,(wcols()-130)/2 to wrows()-1,((wcols()-130)/2)+130 system title'Daftar Barang' font'arial' clos
acti wind dokt
tah=spac(7)
do while.t.
   store spac(7) to bul
   isian='Bulan'
   gambar='99-9999'
   clear
   @0,0 say 'hdr11.bmp'bitm
   @7.5,0 say 'scree.bmp'bitm
   ??sys(2002,1)
   @4.5,6 say isian styl'b'
   @4.5,15 get bul pict gambar size 1,9
   @7.5,0.1 get nud PICTURE '@*IHT ;;' font 'Arial',9;
    size 2.3,19.1,0 default 0 
   read
   if read()=12.or.nud=3
      exit
   endi
   if bul=spac(7)
      loop
   endi
   sele 2
   dele all
   sele 1
   maxtgl=0
   wumont=left(bul,2)
   tayear=righ(bul,4)
   do maxhari
   tggl=str(maxtgl,2)
   tglmula=ctod('01/'+wumont+'/'+tayear)
   tglstop=ctod(tggl+'/'+wumont+'/'+tayear)
   tglstar=date()
   go top
   do while !eof()
      nom=kbrg
      if nom<>'999999'
      namaw=nbrg
      hrg_beliw=hsat
      stokstar=ukecil
      qtyjual=0
      qtybeli=0
      sele 3
      seek nom
      if found()
         do while kbrg=nom.and.!eof()
            if tjual>tglstop.and.tjual<=tglstar
               qtyjual=qtyjual+ukecil
            endif
            skip
         enddo
      endi
      sele 4
      seek nom
      if found()
         do while kbrg=nom.and.!eof()
            if tbeli>tglstop.and.tbeli<=tglstar
               qtybeli=qtybeli+ukecil
            endif
            skip
         enddo
      endi
      stokw=stokstar+qtyjual-qtybeli
      sele 2
      appe blan
      repl no with nom, nama with namaw, hrg_beli with hrg_beliw, stok with stokw, ket with bul
      endif
      sele 1
      skip
   enddo 
*
   tot=0
   sele 2
   go top
   do while !eof()
      nom=no
      qtyjual=0
      qtybeli=0
      qtyawal=0
      stokw=stok
      totalw=stokw*hrg_beli
      tot=tot+totalw
      sele 3
      seek nom
      if found()
         do while kbrg=nom.and.!eof()
            if tjual>=tglmula.and.tjual<=tglstop
               qtyjual=qtyjual+ukecil
            endif
            skip
         enddo
      endi
      sele 4
      seek nom
      if found()
         do while kbrg=nom.and.!eof()
            if tbeli>tglmula.and.tbeli<=tglstop
               qtybeli=qtybeli+ukecil
            endif
            skip
         enddo
      endi
      qtyawal=stokw+qtyjual-qtybeli
      sele 2
      repl hrg_jual with qtyawal, hrg_telkom with qtybeli, hrg_askes with qtyjual, total with totalw
      skip
   enddo   
   sele 2
   appe blan
   repl total with tot, ket with bul
   go top
   repo form stobul prev
   repo form stobul to print prom
enddo
*do emn
deac wind dokt
clos data
return
*


proc maxhari
     do case
     case wumont='01'
          karmont='Januari  '
          maxtgl=31
     case wumont='02'
          karmont='Pebruari '
          maxtgl=-1
          tgpeb=1
          tpeb=ctod('01/02/'+tayear)
          do while mont(tpeb)=2
             if tgpeb<10
                stlp='0'+str(tgpeb,1)
             else   
                stlp=str(tgpeb,2)
             endi
             maxtgl=maxtgl+1
             tpeb=ctod(stlp+'/02/'+tayear)
             tgpeb=tgpeb+1
          enddo
     case wumont='03'
          karmont='Maret    '
          maxtgl=31
     case wumont='04'
          karmont='April    '
          maxtgl=30
     case wumont='05'
          karmont='Mei      '
          maxtgl=31
     case wumont='06'
          karmont='Juni     '
          maxtgl=30
     case wumont='07'
          karmont='Juli     '
          maxtgl=31
     case wumont='08'
          karmont='Agustus  '
          maxtgl=31
     case wumont='09'
          karmont='September'
          maxtgl=30
     case wumont='10'
          karmont='Oktober  '
          maxtgl=31
     case wumont='11'
          karmont='November '
          maxtgl=30
     case wumont='12'
          karmont='Desember '
          maxtgl=31
     endcase
retu
*
