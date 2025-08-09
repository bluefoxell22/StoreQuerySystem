proc ejual
do dmn
set dele on
KSR=SPAC(3)
VASMO=SPAC(3)
VASMO=ASMO
VASMO=RTRIM(VASMO)
VASMO=RIGHT(VASMO,1)
KSR='K-'+VASMO
SPGW=SPAC(3)
dime ki(95)
dime di(95)
dime ji(95)
dime serd(4)
serd(1)=' '
serd(2)='D'
serd(3)='Q'
serd(4)='R'
clos data
SELE 1 
USE STOK INDE STOK1,STOK2,stok6
SELE 2
USE JUAL INDE JUAL9,jualg,jualj
sele 3
use greet
sele 4
use nota
sele 5
use cus inde cus1,cus2
sele 6
use trans inde trans5
DEFI WIND jual;
FROM 0,(wcols()-168)/2 to 42,((wcols()-168)/2)+168 system title'Nota penjualan' font'foxprint',9;
colo rgb(0,0,0,115,110,88)
DEFI WIND jadi in wind jual FROM 12,15 to 20,70 system titl'Print' colo rgb(0,0,0,40,54,40) font'arial',9 
defi wind konf in wind jual from 10,28.5 to 21.5,72 syst font'Arial',9 colo rgb(255,255,255,0,0,0) titl'Info'
acti wind jual
kdokw=spac(5)
do while.t.
  tbeliw=date()
  nbeliw=spac(7)
  membara=spac(1)
  brkl=spac(1)
  her=1
  penyu=1
  store.f. to ono,moleh,teesc,simp
  store 1 to mel1,mel2,mel3,mel4,mel5,mel6,mel7,mel8,mel9,mel10,mel11,mel12,mel13,mel14,mel15,mel16,mel17,mel18,mel19
  store 0 to sto1,sto2,sto3,sto4,sto5,sto6,sto7,sto8,sto9,sto10,sto11,sto12,sto13,sto14,sto15,sto16,sto17,sto18,sto19
  store 0 to dsc1,dsc2,dsc3,dsc4,dsc5,dsc6,dsc7,dsc8,dsc9,dsc10,dsc11,dsc12,dsc13,dsc14,dsc15,dsc16,dsc17,dsc18,dsc19
  store 0 to trf1,trf2,trf3,trf4,trf5,trf6,trf7,trf8,trf9,trf10,trf11,trf12,trf13,trf14,trf15,trf16,trf17,trf18,trf19
  store 1 to dqr1,dqr2,dqr3,dqr4,dqr5,dqr6,dqr7,dqr8,dqr9,dqr10,dqr11,dqr12,dqr13,dqr14,dqr15,dqr16,dqr17,dqr18,dqr19
  store 1 to jmp1,jmp2,jmp3,jmp4,jmp5,jmp6,jmp7,jmp8,jmp9,jmp10,jmp11,jmp12,jmp13,jmp14,jmp15,jmp16,jmp17,jmp18,jmp19
  store spac(13) to kbn1,kbn2,kbn3,kbn4,kbn5,kbn6,kbn7,kbn8,kbn9,kbn10,kbn11,kbn12,kbn13,kbn14,kbn15,kbn16,kbn17,kbn18,kbn19
  store spac(9) to kbg1,kbg2,kbg3,kbg4,kbg5,kbg6,kbg7,kbg8,kbg9,kbg10,kbg11,kbg12,kbg13,kbg14,kbg15,kbg16,kbg17,kbg18,kbg19
  store spac(28) to nbg1,nbg2,nbg3,nbg4,nbg5,nbg6,nbg7,nbg8,nbg9,nbg10,nbg11,nbg12,nbg13,nbg14,nbg15,nbg16,nbg17,nbg18,nbg19
  nangw=spac(30)
  alam=spac(30)
  arema=spac(15)
  kangw=spac(5)
  kgb=spac(9)
  bares=1
  phju=1
  store 0 to apem,pema,bayarw,utangw,nudok,tot1,jtem
  clear
  ??sys(2002,1)
  for ti=1 to 95
    ki(ti)=spac(28)+ spac(13)+spac(10)
  next
  for ti=1 to 95
    di(ti)='1'+'    .  '
  next
  for ti=1 to 95
    ji(ti)='     1.00'
  next
  sele 2
  set orde to 1
  if bof()
      no=750001
      nrsp=750001
  else
      GO BOTT
      no=val(righ(njual,6))+1
      if no>999999
         wait'NOMOR NOTA SUDAH HABIS'wind
         clos data
         deac wind jual
         retu
      endi
  endif    
  nomor=str(no)
  pjnomor=len(ltrim(nomor))
  nbeliw=left('J000000',len('J000000')-pjnomor)+ltrim(nomor)
  tot1=0
  mula=1
  hl=1 
  neks=1
  nd='1'
  gne='neks1.bmp'
  gno='hd1.bmp'
  do while.t.
     on key label F10 do simp
     clear
     kbrgw=spac(9)
     nbrgw=spac(28)
     ukecilw=0
     hbeliw=0
     jasaw=0
     totbw=0
     jur1=0
     ??sys(2002,1)
     @0,0 say gno bitm
     @0,7.2 say'he01.bmp'bitm
     @0,14.3 say'he02.bmp'bitm
     @0,21.4 say'he03.bmp'bitm
     @0,28.6 say'he04.bmp'bitm
     @0,35.7 say'he05.bmp'bitm
     @0,42.9 say'he06.bmp'bitm
     @0,50.0 say'he07.bmp'bitm
     @0,57.2 say'he08.bmp'bitm
     @0,64.3 say'he09.bmp'bitm
     @0,71.4 say'he10.bmp'bitm
     @0,78.6 say'he11.bmp'bitm
     @0,85.7 say'he12.bmp'bitm
     @0,92.9 say'he13.bmp'bitm
     @0,100  say'he14.bmp'bitm
     @0,107.2 say'he15.bmp'bitm
     @0,114.3 say'he16.bmp'bitm
     @0,121.4 say'he17.bmp'bitm
     @0,128.6 say'he18.bmp'bitm
     @0,135.7 say'he19.bmp'bitm
     @41,0 say'menlog.bmp'bitm
     @41,78.6 say'nisor.bmp'bitm
     @39.7,127 say gne bitm
     tot1=0
     do notal           
     @0.5,14 GET kangw vali ckcus() PICTURE '!!!!!' size 0.9,7 font 'Book Antiqua',14
     @0.5,23 get nangw pict'@!' FONT'Book Antiqua',14 size 0.9,38 disa
     @0.5,80 say nbeliw colo rgb(255,234,58,54,52,42) FONT'Book Antiqua',14 styl'b'
     @0.5,105 say tbeliw colo rgb(255,234,58,54,52,42)FONT'Book Antiqua',14 styl'b'
     @0.5,128.4 GET jtem spinner 1,0,200 font'Book Antiqua',12 size 0.9,5 defa 0
     @6.0,4 GET kbn1 vali cbc1() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
     @6.0,25 GET kbg1 vali kbc1() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
     @6.0,37 GET nbg1 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
     @6.0,74 GET jmp1 PICT'@Jz 999,999.99' vali ckjm1() font'book antiqua',14 size 0.95,10
     @6.0,87 get trf1 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @6.0,104 GET dqr1 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @6.0,110.5 GET dsc1 vali ckjm1() PICTURE '@Jz 999,999.99' font'Book antiqua',14 size 0.95,10
     @6.0,124 GET sto1 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @7.5,4 GET kbn2 vali cbc2() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
     @7.5,25 GET kbg2 vali kbc2() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
     @7.5,37 GET nbg2 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
     @7.5,74 GET jmp2 PICT'@Jz 999,999.99' vali ckjm2() font'book antiqua',14 size 0.9,10
     @7.5,87 get trf2 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @7.5,104 GET dqr2 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @7.5,110.5 GET dsc2 vali ckjm2() PICTURE '@Jz 999,999.99' font'Book antiqua',14 size 0.9,10
     @7.5,124 GET sto2 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @9.0,4 GET kbn3 vali cbc3() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
     @9.0,25 GET kbg3 vali kbc3() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
     @9.0,37 GET nbg3 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
     @9.0,74 GET jmp3 PICT'@Jz 999,999.99' vali ckjm3() font'Book Antiqua',14 size 0.95,10
     @9.0,87 get trf3 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @9.0,104 GET dqr3 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @9.0,110.5 GET dsc3 vali ckjm3() PICTURE '@Jz 999,999.99' font 'Book Antiqua',14  size 0.95,10
     @9.0,124 GET sto3 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @10.5,4 GET kbn4 vali cbc4() picture '!!!!!!!!!!!!!'  font 'Book Antiqua',14 size 0.9,17
     @10.5,25 GET kbg4 vali kbc4() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
     @10.5,37 GET nbg4 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
     @10.5,74 GET jmp4 PICT'@Jz 999,999.99' vali ckjm4() font'Book Antiqua',14 size 0.9,10
     @10.5,87 get trf4 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @10.5,104 GET dqr4 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @10.5,110.5 GET dsc4 vali ckjm4() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.9,10
     @10.5,124 GET sto4 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @12.0,4 GET kbn5 vali cbc5() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
     @12.0,25 GET kbg5 vali kbc5() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
     @12.0,37 GET nbg5 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
     @12.0,74 GET jmp5 PICT'@Jz 999,999.99' vali ckjm5() font'Book Antiqua',14 size 0.95,10
     @12.0,87 get trf5 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @12.0,104 GET dqr5 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @12.0,110.5 GET dsc5 vali ckjm5() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.95,10
     @12.0,124 GET sto5 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @13.5,4 GET kbn6 vali cbc6() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
     @13.5,25 GET kbg6 vali kbc6() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
     @13.5,37 GET nbg6 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
     @13.5,74 GET jmp6 PICT'@Jz 999,999.99' vali ckjm6() font'Book Antiqua',14 size 0.9,10
     @13.5,87 get trf6 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @13.5,104 GET dqr6 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @13.5,110.5 GET dsc6 vali ckjm6() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.9,10
     @13.5,124 GET sto6 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @15.0,4 GET kbn7 vali cbc7() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
     @15.0,25 GET kbg7 vali kbc7() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
     @15.0,37 GET nbg7 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
     @15.0,74 GET jmp7 PICT'@Jz 999,999.99' vali ckjm7() font'Book Antiqua',14 size 0.95,10
     @15.0,87 get trf7 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @15.0,104 GET dqr7 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @15.0,110.5 GET dsc7 vali ckjm7() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
     @15.0,124 GET sto7 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @16.5,4 GET kbn8 vali cbc8() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
     @16.5,25 GET kbg8 vali kbc8() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
     @16.5,37 GET nbg8 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
     @16.5,74 GET jmp8 PICT'@Jz 999,999.99' vali ckjm8() font'Book Antiqua',14 size 0.9,10
     @16.5,87 get trf8 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @16.5,104 GET dqr8 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @16.5,110.5 GET dsc8 vali ckjm8() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
     @16.5,124 GET sto8 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @18.0,4 GET kbn9 vali cbc9() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
     @18.0,25 GET kbg9 vali kbc9() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
     @18.0,37 GET nbg9 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
     @18.0,74 GET jmp9 PICT'@Jz 999,999.99' vali ckjm9() font'Book Antiqua',14 size 0.95,10
     @18.0,87 get trf9 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @18.0,104 GET dqr9 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @18.0,110.5 GET dsc9 vali ckjm9() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.95,10
     @18.0,124 GET sto9 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @19.5,4 GET kbn10 vali cbc10() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
     @19.5,25 GET kbg10 vali kbc10() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
     @19.5,37 GET nbg10 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
     @19.5,74 GET jmp10 PICT'@Jz 999,999.99' vali ckjm10() font'Book Antiqua',14 size 0.9,10
     @19.5,87 get trf10 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @19.5,104 GET dqr10 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @19.5,110.5 GET dsc10 vali ckjm10() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
     @19.5,124 GET sto10 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @21.0,4 GET kbn11 vali cbc11() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
     @21.0,25 GET kbg11 vali kbc11() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
     @21.0,37 GET nbg11 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
     @21.0,74 GET jmp11 PICT'@Jz 999,999.99' vali ckjm11() font'Book Antiqua',14 size 0.95,10
     @21.0,87 get trf11 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @21.0,104 GET dqr11 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @21.0,110.5 GET dsc11 vali ckjm11() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
     @21.0,124 GET sto11 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @22.5,4 GET kbn12 vali cbc12() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
     @22.5,25 GET kbg12 vali kbc12() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
     @22.5,37 GET nbg12 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
     @22.5,74 GET jmp12 PICT'@Jz 999,999.99' vali ckjm12() font'Book Antiqua',14 size 0.9,10
     @22.5,87 get trf12 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @22.5,104 GET dqr12 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @22.5,110.5 GET dsc12 vali ckjm12() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
     @22.5,124 GET sto12 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @24.0,4 GET kbn13 vali cbc13() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
     @24.0,25 GET kbg13 vali kbc13() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
     @24.0,37 GET nbg13 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
     @24.0,74 GET jmp13 PICT'@Jz 999,999.99' vali ckjm13() font'Book Antiqua',14 size 0.95,10
     @24.0,87 get trf13 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @24.0,104 GET dqr13 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @24.0,110.5 GET dsc13 vali ckjm13() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
     @24.0,124 GET sto13 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @25.5,4 GET kbn14 vali cbc14() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
     @25.5,25 GET kbg14 vali kbc14() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
     @25.5,37 GET nbg14 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
     @25.5,74 GET jmp14 PICT'@Jz 999,999.99' vali ckjm14() font'Book Antiqua',14 size 0.9,10
     @25.5,87 get trf14 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @25.5,104 GET dqr14 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @25.5,110.5 GET dsc14 vali ckjm14() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
     @25.5,124 GET sto14 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @27.0,4 GET kbn15 vali cbc15() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
     @27.0,25 GET kbg15 vali kbc15() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
     @27.0,37 GET nbg15 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
     @27.0,74 GET jmp15 PICT'@Jz 999,999.99' vali ckjm15() font'Book Antiqua',14 size 0.95,10
     @27.0,87 get trf15 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @27.0,104 GET dqr15 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @27.0,110.5 GET dsc15 vali ckjm15() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
     @27.0,124 GET sto15 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @28.5,4 GET kbn16 vali cbc16() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
     @28.5,25 GET kbg16 vali kbc16() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
     @28.5,37 GET nbg16 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
     @28.5,74 GET jmp16 PICT'@Jz 999,999.99' vali ckjm16() font'Book Antiqua',14 size 0.9,10
     @28.5,87 get trf16 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @28.5,104 GET dqr16 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @28.5,110.5 GET dsc16 vali ckjm16() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
     @28.5,124 GET sto16 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @30.0,4 GET kbn17 vali cbc17() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
     @30.0,25 GET kbg17 vali kbc17() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
     @30.0,37 GET nbg17 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
     @30.0,74 GET jmp17 PICT'@Jz 999,999.99' vali ckjm17() font'Book Antiqua',14 size 0.95,10
     @30.0,87 get trf17 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @30.0,104 GET dqr17 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @30.0,110.5 GET dsc17 vali ckjm17() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
     @30.0,124 GET sto17 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @31.5,4 GET kbn18 vali cbc18() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
     @31.5,25 GET kbg18 vali kbc18() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
     @31.5,37 GET nbg18 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
     @31.5,74 GET jmp18 PICT'@Jz 999,999.99' vali ckjm18() font'Book Antiqua',14 size 0.9,10
     @31.5,87 get trf18 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @31.5,104 GET dqr18 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @31.5,110.5 GET dsc18 vali ckjm18() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
     @31.5,124 GET sto18 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @33.0,4 GET kbn19 vali cbc19() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
     @33.0,25 GET kbg19 vali kbc19() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
     @33.0,37 GET nbg19 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
     @33.0,74 GET jmp19 PICT'@Jz 999,999.99' vali ckjm19() font'Book Antiqua',14 size 0.95,10
     @33.0,87 get trf19 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
     @33.0,104 GET dqr19 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
     @33.0,110.5 GET dsc19 vali ckjm19() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
     @33.0,124 GET sto19 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
     @39.8,127.1 get neks PICTURE '@*IHT ;' font 'Arial',9 size 2.6,8,3.4
     @35,0 get jur1 PICTURE '@*IHT ;;' font 'Arial',9 size 5,16,2 default 0 
     read cycl
     if read()=12.or.jur1=3
        if simp
           exit
        endi
        teesc=.t.
        exit
     endif
     if jur1=2
       acti wind konf
       @0,0 say 'free.bmp'bitm
       @0,30 say 'free1.bmp'bitm
       @7.6,24 get hpz PICTURE '@*HT OK' font'Arial' size 1.8,12,1 default 0
       read
       deac wind konf
     endif
     do case
     case neks=1
        if hl>1
           do saveki
           hl=hl-1
           do slmula
           do uraiki
           nd=str(hl,1)   
           gne='neks'+nd+'.bmp'
           gno='hd'+nd+'.bmp'
        endif
     case neks=2
        if hl<5
           do saveki
           hl=hl+1
           do slmula
           do uraiki
           nd=str(hl,1)   
           gne='neks'+nd+'.bmp'
           gno='hd'+nd+'.bmp'
        endif
     endcase
     if jur1=1
       boyor=tot1
       @39.6,103 get boyor pict'@z 99,999,999' font'foxprint',14
       read
       sele 2
       set orde to 1
       seek nbeliw
       if found()
          go bott
          no=val(righ(njual,6))+1
          nomor=str(no)
          pjnomor=len(ltrim(nomor))
          nbeliw=left('J000000',len('J000000')-pjnomor)+ltrim(nomor)
       endif
       tot1=0
       mlo=.f.
       for mi=1 to 95
         mmr=0
         if left(ki(mi),28)<>spac(28)
           mlo=.t.
           lem=left(ki(mi),28)
           brc=subs(ki(mi),7,13)
           ukecilw=val(left(ji(mi),9))
           rqd=val(left(di(mi),1))
           jasaw=val(righ(di(mi),7))
           hbeliw=val(righ(ki(mi),10))
           jose=0
           do case
           case rqd=0
                totbw=hbeliw*ukecilw
           case rqd=1
                totbw=hbeliw*ukecilw
           case rqd=2
                jose=jasaw/100 
                totbw=hbeliw*ukecilw
                totbw=totbw-(totbw*jose)
           case rqd=3
                totbw=(ukecilw-jasaw)*hbeliw
           case rqd=4
                totbw=(hbeliw-jasaw)*ukecilw
           endcase
           tot1=tot1+totbw
           barang=lem
           tdw=serd(rqd)
           kbrgw=spac(9)
           sele 1
           set orde to 2
           seek barang
           if found()
              kbrgw=kbrg
           endif
           sele 1
           set orde to 1
           seek kbrgw
           if found()
              repl ukecil with ukecil-ukecilw
           endif
           mmr=mmr+1
           sele 2
           set orde to 1
           appe blan
           REPL NJUAL WITH Nbeliw,TJUAL WITH Tbeliw,;
                Kbrg WITH Kbrgw,ukecil WITH Ukecilw, op with iif(jtem=0,'T','K'),;
                HJUAL WITH Hbeliw,TOTB WITH TOTBW,SPG WITH SPGW, kang with kangw,;
                DS WITH jasaw,KS WITH KSR,TD WITH tdw,period with wayah, ke with jtem
         endif       
       next
       susuke=0
       if boyor-tot1>-1.and.boyor-tot1<0
          susuke=0
       else   
          susuke=boyor-tot1
       endif
       @41,107 say susuke pict'@z 99,999,999' font'Book Antiqua',14 styl'b' colo rgb(255,255,255,40,54,40)
       if mlo
          sele 6
          bukw=righ(nbeliw,6)
          seek bukw
          if !found()
             if jtem=0
               appe blan
               repl bukti with bukw, kang with kangw, no_perk with '4101', perkiraan with 'Penjualan Barang',;
                    uraian with nangw, kredit with totbw, ttrans with tbeliw
               appe blan
               repl bukti with bukw, kang with kangw, no_perk with '1111', perkiraan with 'Kas',;
                    uraian with nangw, debet with totbw, ttrans with tbeliw
             else       
               appe blan
               repl bukti with bukw, kang with kangw, no_perk with '4101', perkiraan with 'Penjualan Barang',;
                    uraian with nangw, kredit with totbw, ttrans with tbeliw
               appe blan
               repl bukti with bukw, kang with kangw, no_perk with '1131', perkiraan with 'Piutang Barang pada anggota',;
                    uraian with nangw, debet with totbw, ttrans with tbeliw
             endi       
          endif
          sele 2
          set orde to 1
          acti wind jadi
          @0,0 say'prnt.bmp'bitm
          @0,25.4 say'prnt1.bmp'bitm
          @0,50.8 say'prnt2.bmp'bitm
          @0.2,27 get jek PICTURE '@*IHT ;' font 'Arial',9 size 5.7,24,0 default 0 
           read
          deac wind jadi
          if jek=1
             do prjual             
          endif
       endif   
       exit
     endif  
  enddo
  on key label F10
  if teesc
     exit
  endif
enddo
clos data
set readb off
deac wind jual
rele ki
rele di
rele ji
rele serd
do emn
retu
*
proc simp
     if simp
       boyor=0
       @39.6,103 get boyor pict'@z 99,999,999' font'foxprint',14
       read
       sele 2
       set orde to 1
       seek nbeliw
       if found()
          go bott
          no=val(righ(njual,6))+1
          nomor=str(no)
          pjnomor=len(ltrim(nomor))
          nbeliw=left('J000000',len('J000000')-pjnomor)+ltrim(nomor)
       endif
       tot1=0
       mlo=.f.
       for mi=1 to 95
         mmr=0
         if left(ki(mi),28)<>spac(28)
           mlo=.t.
           lem=left(ki(mi),28)
           brc=subs(ki(mi),7,13)
           ukecilw=val(left(ji(mi),9))
           rqd=val(left(di(mi),1))
           jasaw=val(righ(di(mi),7))
           hbeliw=val(righ(ki(mi),10))
           jose=0
           do case
           case rqd=0
                totbw=hbeliw*ukecilw
           case rqd=1
                totbw=hbeliw*ukecilw
           case rqd=2
                jose=jasaw/100 
                totbw=hbeliw*ukecilw
                totbw=totbw-(totbw*jose)
           case rqd=3
                totbw=(ukecilw-jasaw)*hbeliw
           case rqd=4
                totbw=(hbeliw-jasaw)*ukecilw
           endcase
           tot1=tot1+totbw
           barang=lem
           tdw=serd(rqd)
           kbrgw=spac(9)
           sele 1
           set orde to 2
           seek barang
           if found()
              kbrgw=kbrg
           endif
           sele 1
           set orde to 1
           seek kbrgw
           if found()
              repl ukecil with ukecil-ukecilw
           endif
           mmr=mmr+1
           sele 2
           set orde to 1
           appe blan
           REPL NJUAL WITH Nbeliw,TJUAL WITH Tbeliw,;
                Kbrg WITH Kbrgw,ukecil WITH Ukecilw,;
                HJUAL WITH Hbeliw,TOTB WITH TOTBW,SPG WITH SPGW,;
                DS WITH jasaw,KS WITH KSR,TD WITH tdw,period with wayah
         endif       
       next
       @41,107 say boyor-tot1 pict'@z 99,999,999' font'Book Antiqua',14 styl'b' colo rgb(255,255,255,40,54,40)
       if mlo
          acti wind jadi
          @0,0 say'prnt.bmp'bitm
          @0,25.4 say'prnt1.bmp'bitm
          @0,50.8 say'prnt2.bmp'bitm
          @0.2,27 get jek PICTURE '@*IHT ;' font 'Arial',9 size 5.7,24,0 default 0 
           read
          deac wind jadi
          if jek=1
             do prjual             
          endif
       endif   
  tbeliw=date()
  nbeliw=spac(7)
  membara=spac(1)
  brkl=spac(1)
  her=1
  store.f. to ono,moleh,teesc
  store 1 to mel1,mel2,mel3,mel4,mel5,mel6,mel7,mel8,mel9,mel10,mel11,mel12,mel13,mel14,mel15,mel16,mel17,mel18,mel19
  store 0 to sto1,sto2,sto3,sto4,sto5,sto6,sto7,sto8,sto9,sto10,sto11,sto12,sto13,sto14,sto15,sto16,sto17,sto18,sto19
  store 0 to dsc1,dsc2,dsc3,dsc4,dsc5,dsc6,dsc7,dsc8,dsc9,dsc10,dsc11,dsc12,dsc13,dsc14,dsc15,dsc16,dsc17,dsc18,dsc19
  store 0 to trf1,trf2,trf3,trf4,trf5,trf6,trf7,trf8,trf9,trf10,trf11,trf12,trf13,trf14,trf15,trf16,trf17,trf18,trf19
  store 1 to dqr1,dqr2,dqr3,dqr4,dqr5,dqr6,dqr7,dqr8,dqr9,dqr10,dqr11,dqr12,dqr13,dqr14,dqr15,dqr16,dqr17,dqr18,dqr19
  store 1 to jmp1,jmp2,jmp3,jmp4,jmp5,jmp6,jmp7,jmp8,jmp9,jmp10,jmp11,jmp12,jmp13,jmp14,jmp15,jmp16,jmp17,jmp18,jmp19
  store spac(13) to kbn1,kbn2,kbn3,kbn4,kbn5,kbn6,kbn7,kbn8,kbn9,kbn10,kbn11,kbn12,kbn13,kbn14,kbn15,kbn16,kbn17,kbn18,kbn19
  store spac(9) to kbg1,kbg2,kbg3,kbg4,kbg5,kbg6,kbg7,kbg8,kbg9,kbg10,kbg11,kbg12,kbg13,kbg14,kbg15,kbg16,kbg17,kbg18,kbg19
  store spac(28) to nbg1,nbg2,nbg3,nbg4,nbg5,nbg6,nbg7,nbg8,nbg9,nbg10,nbg11,nbg12,nbg13,nbg14,nbg15,nbg16,nbg17,nbg18,nbg19
  ndokw=spac(30)
  alam=spac(30)
  arema=spac(15)
  kgb=spac(9)
  bares=1
  phju=1
  store 0 to apem,pema,bayarw,utangw,nudok,tot1,jtempo
  clear
  ??sys(2002,1)
  for ti=1 to 95
    ki(ti)=spac(28)+ spac(13)+spac(10)
  next
  for ti=1 to 95
    di(ti)='1'+'    .  '
  next
  for ti=1 to 95
    ji(ti)='     1.00'
  next
  sele 2
  set orde to 1
  if bof()
      no=1
      nrsp=1
  else
      GO BOTT
      no=val(righ(njual,6))+1
  endif    
  nomor=str(no)
  pjnomor=len(ltrim(nomor))
  nbeliw=left('J000000',len('J000000')-pjnomor)+ltrim(nomor)
  tot1=0
  mula=1
  hl=1 
  neks=1
  nd='1'
  gne='nex1.bmp'
  gno='hd1.bmp'
     clear
     kbrgw=spac(9)
     nbrgw=spac(28)
     ukecilw=0
     hbeliw=0
     jasaw=0
     totbw=0
     jur1=0
     ??sys(2002,1)
     @0,0 say gno bitm
     @0,7.2 say'he01.bmp'bitm
     @0,14.3 say'he02.bmp'bitm
     @0,21.4 say'he03.bmp'bitm
     @0,28.6 say'he04.bmp'bitm
     @0,35.7 say'he05.bmp'bitm
     @0,42.9 say'he06.bmp'bitm
     @0,50.0 say'he07.bmp'bitm
     @0,57.2 say'he08.bmp'bitm
     @0,64.3 say'he09.bmp'bitm
     @0,71.4 say'he10.bmp'bitm
     @0,78.6 say'he11.bmp'bitm
     @0,85.7 say'he12.bmp'bitm
     @0,92.9 say'he13.bmp'bitm
     @0,100  say'he14.bmp'bitm
     @0,107.2 say'he15.bmp'bitm
     @0,114.3 say'he16.bmp'bitm
     @0,121.4 say'he17.bmp'bitm
     @0,128.6 say'he18.bmp'bitm
     @0,135.7 say'he19.bmp'bitm
     @41,0 say'menlog.bmp'bitm
     @41,78.6 say'nisor.bmp'bitm
     @39.7,127 say gne bitm
     tot1=0
     do notal           
     @0.5,14 GET kangw vali ckcus() PICTURE '!!!!!' size 0.9,7 font 'Book Antiqua',14
     @0.5,23 get nangw pict'@!' FONT'Book Antiqua',14 size 0.9,38 disa
     @0.5,80 say nbeliw colo rgb(0,0,0,166,205,167)FONT'Book Antiqua',14 styl'b'
     @0.5,105 say tbeliw colo rgb(0,0,0,166,205,167)FONT'Book Antiqua',14 styl'b'
     READ
  SHOW GETS
     endif  
retu
*
proc edjual
do dmn
set dele on
simp=.f.
dime ki(95)
dime di(95)
dime ji(95)
dime serd(4)
dime oq(95)
serd(1)=' '
serd(2)='D'
serd(3)='Q'
serd(4)='R'
CLOS DATA
SELE 1 
USE STOK INDE STOK1,STOK2,stok6
SELE 2
USE JUAL INDE JUAL9,jualg,jualj
sele 3
use greet
sele 4
use nota
sele 5
use cus inde cus1,cus2
sele 6
use trans inde trans5
DEFI WIND jual;
FROM 0,(wcols()-168)/2 to 42,((wcols()-168)/2)+168 system title'Edit Penjualan' font'foxprint',9;
colo rgb(0,0,0,115,110,88)
DEFI WIND jadi in wind jual FROM 12,15 to 20,70 system titl'Print' colo rgb(0,0,0,40,54,40) font'arial',9 
defi wind konf in wind jual from 10,28.5 to 21.5,72 syst font'Arial',9 colo rgb(255,255,255,0,0,0) titl'Konfirmasi'
acti wind jual
kdokw=spac(5)
do while.t.
  her=2
  kangw=spac(5)
  nangw=spac(28)
  tbeliw=date()
  nbeliw=spac(7)
  membara=spac(1)
  brkl=spac(1)
  store.f. to ono,moleh,teesc
  store 1 to mel1,mel2,mel3,mel4,mel5,mel6,mel7,mel8,mel9,mel10,mel11,mel12,mel13,mel14,mel15,mel16,mel17,mel18,mel19
  store 0 to sto1,sto2,sto3,sto4,sto5,sto6,sto7,sto8,sto9,sto10,sto11,sto12,sto13,sto14,sto15,sto16,sto17,sto18,sto19
  store 0 to dsc1,dsc2,dsc3,dsc4,dsc5,dsc6,dsc7,dsc8,dsc9,dsc10,dsc11,dsc12,dsc13,dsc14,dsc15,dsc16,dsc17,dsc18,dsc19
  store 0 to trf1,trf2,trf3,trf4,trf5,trf6,trf7,trf8,trf9,trf10,trf11,trf12,trf13,trf14,trf15,trf16,trf17,trf18,trf19
  store 1 to dqr1,dqr2,dqr3,dqr4,dqr5,dqr6,dqr7,dqr8,dqr9,dqr10,dqr11,dqr12,dqr13,dqr14,dqr15,dqr16,dqr17,dqr18,dqr19
  store 1 to jmp1,jmp2,jmp3,jmp4,jmp5,jmp6,jmp7,jmp8,jmp9,jmp10,jmp11,jmp12,jmp13,jmp14,jmp15,jmp16,jmp17,jmp18,jmp19
  store spac(13) to kbn1,kbn2,kbn3,kbn4,kbn5,kbn6,kbn7,kbn8,kbn9,kbn10,kbn11,kbn12,kbn13,kbn14,kbn15,kbn16,kbn17,kbn18,kbn19
  store spac(9) to kbg1,kbg2,kbg3,kbg4,kbg5,kbg6,kbg7,kbg8,kbg9,kbg10,kbg11,kbg12,kbg13,kbg14,kbg15,kbg16,kbg17,kbg18,kbg19
  store spac(28) to nbg1,nbg2,nbg3,nbg4,nbg5,nbg6,nbg7,nbg8,nbg9,nbg10,nbg11,nbg12,nbg13,nbg14,nbg15,nbg16,nbg17,nbg18,nbg19
  ndokw=spac(30)
  alam=spac(30)
  arema=spac(15)
  bares=1
  phju=1
  penyu=2
  ksr=SPAC(3)
  spgw=SPAC(3)
  store 0 to apem,pema,bayarw,utangw,nudok,tot1,jtempo,jtem
  clear
  ??sys(2002,1)
  for ti=1 to 95
    ki(ti)=spac(28)+ spac(13)+spac(10)
  next
  for ti=1 to 95
    di(ti)='1'+'    .  '
  next
  for ti=1 to 95
    ji(ti)='     1.00'
  next
  kgb=spac(9)
  nsama=spac(7)
  tot1=0
  mula=1
  hl=1 
  neks=1
  nd='1'
  gne='neks1.bmp'
  gno='hd1.bmp'
  do while.t.
     clear
     kbrgw=spac(9)
     nbrgw=spac(28)
     ukecilw=0
     hbeliw=0
     jasaw=0
     totbw=0
     jur1=0
     ??sys(2002,1)
     @0,0 say gno bitm
     @0,7.2 say'he01.bmp'bitm
     @0,14.3 say'he02.bmp'bitm
     @0,21.4 say'he03.bmp'bitm
     @0,28.6 say'he04.bmp'bitm
     @0,35.7 say'he05.bmp'bitm
     @0,42.9 say'he06.bmp'bitm
     @0,50.0 say'he07.bmp'bitm
     @0,57.2 say'he08.bmp'bitm
     @0,64.3 say'he09.bmp'bitm
     @0,71.4 say'he10.bmp'bitm
     @0,78.6 say'he11.bmp'bitm
     @0,85.7 say'he12.bmp'bitm
     @0,92.9 say'he13.bmp'bitm
     @0,100  say'he14.bmp'bitm
     @0,107.2 say'he15.bmp'bitm
     @0,114.3 say'he16.bmp'bitm
     @0,121.4 say'he17.bmp'bitm
     @0,128.6 say'he18.bmp'bitm
     @0,135.7 say'he19.bmp'bitm
     @41,0 say'menlog.bmp'bitm
     @41,78.6 say'nisor.bmp'bitm
     @39.7,127 say gne bitm
     tot1=0
     do notal           
     IF ASMO<>'SUPERVISOR1'
        @0.5,14 GET kangw vali ckcus() PICTURE '!!!!!' size 0.9,7 font 'Book Antiqua',14
        @0.5,23 get nangw pict'@!' FONT'Book Antiqua',14 size 0.9,38 disa
        @0.5,80 get nbeliw pict'!!!!!!!' vali cajual() colo rgb(0,0,0,166,205,167)FONT'Book Antiqua',14 size 0.97,9
        @0.5,104 get tbeliw colo rgb(0,0,0,166,205,167)FONT'Book Antiqua',14 size 0.9,13.5
        @0.5,128.4 GET jtem spinner 1,0,200 font'Book Antiqua',12 size 0.9,5 defa 0
        @6.0,4 GET kbn1 vali cbc1() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @6.0,25 GET kbg1 vali kbc1() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @6.0,37 GET nbg1 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @6.0,74 GET jmp1 PICT'@Jz 999,999.99' vali ckjm1() font'book antiqua',14 size 0.95,10 disa
        @6.0,87 get trf1 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @6.0,104 GET dqr1 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @6.0,110.5 GET dsc1 vali ckjm1() PICTURE '@Jz 999,999.99' font'Book antiqua',14 size 0.95,10
        @6.0,124 GET sto1 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @7.5,4 GET kbn2 vali cbc2() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @7.5,25 GET kbg2 vali kbc2() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @7.5,37 GET nbg2 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @7.5,74 GET jmp2 PICT'@Jz 999,999.99' vali ckjm2() font'book antiqua',14 size 0.9,10 disa
        @7.5,87 get trf2 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @7.5,104 GET dqr2 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @7.5,110.5 GET dsc2 vali ckjm2() PICTURE '@Jz 999,999.99' font'Book antiqua',14 size 0.9,10
        @7.5,124 GET sto2 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @9.0,4 GET kbn3 vali cbc3() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @9.0,25 GET kbg3 vali kbc3() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @9.0,37 GET nbg3 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @9.0,74 GET jmp3 PICT'@Jz 999,999.99' vali ckjm3() font'Book Antiqua',14 size 0.95,10 disa
        @9.0,87 get trf3 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @9.0,104 GET dqr3 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @9.0,110.5 GET dsc3 vali ckjm3() PICTURE '@Jz 999,999.99' font 'Book Antiqua',14  size 0.95,10
        @9.0,124 GET sto3 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @10.5,4 GET kbn4 vali cbc4() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @10.5,25 GET kbg4 vali kbc4() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @10.5,37 GET nbg4 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @10.5,74 GET jmp4 PICT'@Jz 999,999.99' vali ckjm4() font'Book Antiqua',14 size 0.9,10 disa
        @10.5,87 get trf4 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @10.5,104 GET dqr4 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @10.5,110.5 GET dsc4 vali ckjm4() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.9,10
        @10.5,124 GET sto4 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @12.0,4 GET kbn5 vali cbc5() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @12.0,25 GET kbg5 vali kbc5() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @12.0,37 GET nbg5 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @12.0,74 GET jmp5 PICT'@Jz 999,999.99' vali ckjm5() font'Book Antiqua',14 size 0.95,10 disa
        @12.0,87 get trf5 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @12.0,104 GET dqr5 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @12.0,110.5 GET dsc5 vali ckjm5() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.95,10
        @12.0,124 GET sto5 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @13.5,4 GET kbn6 vali cbc6() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @13.5,25 GET kbg6 vali kbc6() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @13.5,37 GET nbg6 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @13.5,74 GET jmp6 PICT'@Jz 999,999.99' vali ckjm6() font'Book Antiqua',14 size 0.9,10 disa
        @13.5,87 get trf6 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @13.5,104 GET dqr6 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @13.5,110.5 GET dsc6 vali ckjm6() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.9,10
        @13.5,124 GET sto6 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @15.0,4 GET kbn7 vali cbc7() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @15.0,25 GET kbg7 vali kbc7() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @15.0,37 GET nbg7 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @15.0,74 GET jmp7 PICT'@Jz 999,999.99' vali ckjm7() font'Book Antiqua',14 size 0.95,10 disa
        @15.0,87 get trf7 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @15.0,104 GET dqr7 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @15.0,110.5 GET dsc7 vali ckjm7() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @15.0,124 GET sto7 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @16.5,4 GET kbn8 vali cbc8() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @16.5,25 GET kbg8 vali kbc8() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @16.5,37 GET nbg8 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @16.5,74 GET jmp8 PICT'@Jz 999,999.99' vali ckjm8() font'Book Antiqua',14 size 0.9,10 disa
        @16.5,87 get trf8 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @16.5,104 GET dqr8 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @16.5,110.5 GET dsc8 vali ckjm8() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @16.5,124 GET sto8 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @18.0,4 GET kbn9 vali cbc9() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @18.0,25 GET kbg9 vali kbc9() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @18.0,37 GET nbg9 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @18.0,74 GET jmp9 PICT'@Jz 999,999.99' vali ckjm9() font'Book Antiqua',14 size 0.95,10 disa
        @18.0,87 get trf9 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @18.0,104 GET dqr9 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @18.0,110.5 GET dsc9 vali ckjm9() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.95,10
        @18.0,124 GET sto9 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @19.5,4 GET kbn10 vali cbc10() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @19.5,25 GET kbg10 vali kbc10() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @19.5,37 GET nbg10 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @19.5,74 GET jmp10 PICT'@Jz 999,999.99' vali ckjm10() font'Book Antiqua',14 size 0.9,10 disa
        @19.5,87 get trf10 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @19.5,104 GET dqr10 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @19.5,110.5 GET dsc10 vali ckjm10() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @19.5,124 GET sto10 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @21.0,4 GET kbn11 vali cbc11() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @21.0,25 GET kbg11 vali kbc11() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @21.0,37 GET nbg11 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @21.0,74 GET jmp11 PICT'@Jz 999,999.99' vali ckjm11() font'Book Antiqua',14 size 0.95,10 disa
        @21.0,87 get trf11 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @21.0,104 GET dqr11 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @21.0,110.5 GET dsc11 vali ckjm11() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @21.0,124 GET sto11 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @22.5,4 GET kbn12 vali cbc12() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @22.5,25 GET kbg12 vali kbc12() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @22.5,37 GET nbg12 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @22.5,74 GET jmp12 PICT'@Jz 999,999.99' vali ckjm12() font'Book Antiqua',14 size 0.9,10 disa
        @22.5,87 get trf12 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @22.5,104 GET dqr12 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @22.5,110.5 GET dsc12 vali ckjm12() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @22.5,124 GET sto12 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @24.0,4 GET kbn13 vali cbc13() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @24.0,25 GET kbg13 vali kbc13() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @24.0,37 GET nbg13 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @24.0,74 GET jmp13 PICT'@Jz 999,999.99' vali ckjm13() font'Book Antiqua',14 size 0.95,10 disa
        @24.0,87 get trf13 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @24.0,104 GET dqr13 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @24.0,110.5 GET dsc13 vali ckjm13() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @24.0,124 GET sto13 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @25.5,4 GET kbn14 vali cbc14() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @25.5,25 GET kbg14 vali kbc14() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @25.5,37 GET nbg14 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @25.5,74 GET jmp14 PICT'@Jz 999,999.99' vali ckjm14() font'Book Antiqua',14 size 0.9,10 disa
        @25.5,87 get trf14 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @25.5,104 GET dqr14 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @25.5,110.5 GET dsc14 vali ckjm14() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @25.5,124 GET sto14 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @27.0,4 GET kbn15 vali cbc15() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @27.0,25 GET kbg15 vali kbc15() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @27.0,37 GET nbg15 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @27.0,74 GET jmp15 PICT'@Jz 999,999.99' vali ckjm15() font'Book Antiqua',14 size 0.95,10 disa
        @27.0,87 get trf15 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @27.0,104 GET dqr15 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @27.0,110.5 GET dsc15 vali ckjm15() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @27.0,124 GET sto15 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @28.5,4 GET kbn16 vali cbc16() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @28.5,25 GET kbg16 vali kbc16() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @28.5,37 GET nbg16 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @28.5,74 GET jmp16 PICT'@Jz 999,999.99' vali ckjm16() font'Book Antiqua',14 size 0.9,10 disa
        @28.5,87 get trf16 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @28.5,104 GET dqr16 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @28.5,110.5 GET dsc16 vali ckjm16() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @28.5,124 GET sto16 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @30.0,4 GET kbn17 vali cbc17() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @30.0,25 GET kbg17 vali kbc17() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @30.0,37 GET nbg17 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @30.0,74 GET jmp17 PICT'@Jz 999,999.99' vali ckjm17() font'Book Antiqua',14 size 0.95,10 disa
        @30.0,87 get trf17 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @30.0,104 GET dqr17 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @30.0,110.5 GET dsc17 vali ckjm17() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @30.0,124 GET sto17 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @31.5,4 GET kbn18 vali cbc18() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @31.5,25 GET kbg18 vali kbc18() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @31.5,37 GET nbg18 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @31.5,74 GET jmp18 PICT'@Jz 999,999.99' vali ckjm18() font'Book Antiqua',14 size 0.9,10 disa
        @31.5,87 get trf18 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @31.5,104 GET dqr18 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @31.5,110.5 GET dsc18 vali ckjm18() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @31.5,124 GET sto18 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @33.0,4 GET kbn19 vali cbc19() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @33.0,25 GET kbg19 vali kbc19() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @33.0,37 GET nbg19 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @33.0,74 GET jmp19 PICT'@Jz 999,999.99' vali ckjm19() font'Book Antiqua',14 size 0.95,10 disa
        @33.0,87 get trf19 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @33.0,104 GET dqr19 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @33.0,110.5 GET dsc19 vali ckjm19() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @33.0,124 GET sto19 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @39.8,127.1 get neks PICTURE '@*IHT ;' font 'Arial',9 size 2.6,8,3.4
        @35,0 get jur1 PICTURE '@*IHT ;;' font 'Arial',9 size 5,16,2 default 0 
     ELSE
        @0.5,14 GET kangw vali ckcus() PICTURE '!!!!!' size 0.9,7 font 'Book Antiqua',14
        @0.5,23 get nangw pict'@!' FONT'Book Antiqua',14 size 0.9,38 disa
        @0.5,80 get nbeliw pict'!!!!!!!' vali cajual() colo rgb(0,0,0,166,205,167)FONT'Book Antiqua',14 size 0.97,9
        @0.5,104 get tbeliw colo rgb(0,0,0,166,205,167)FONT'Book Antiqua',14 size 0.9,13.5
        @0.5,128.4 GET jtem spinner 1,0,200 font'Book Antiqua',12 size 0.9,5 defa 0
        @6.0,4 GET kbn1 vali cbc1() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @6.0,25 GET kbg1 vali kbc1() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @6.0,37 GET nbg1 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @6.0,74 GET jmp1 PICT'@Jz 999,999.99' vali ckjm1() font'book antiqua',14 size 0.95,10
        @6.0,87 get trf1 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @6.0,104 GET dqr1 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @6.0,110.5 GET dsc1 vali ckjm1() PICTURE '@Jz 999,999.99' font'Book antiqua',14 size 0.95,10
        @6.0,124 GET sto1 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @7.5,4 GET kbn2 vali cbc2() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @7.5,25 GET kbg2 vali kbc2() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @7.5,37 GET nbg2 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @7.5,74 GET jmp2 PICT'@Jz 999,999.99' vali ckjm2() font'book antiqua',14 size 0.9,10
        @7.5,87 get trf2 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @7.5,104 GET dqr2 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @7.5,110.5 GET dsc2 vali ckjm2() PICTURE '@Jz 999,999.99' font'Book antiqua',14 size 0.9,10
        @7.5,124 GET sto2 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @9.0,4 GET kbn3 vali cbc3() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @9.0,25 GET kbg3 vali kbc3() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @9.0,37 GET nbg3 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @9.0,74 GET jmp3 PICT'@Jz 999,999.99' vali ckjm3() font'Book Antiqua',14 size 0.95,10
        @9.0,87 get trf3 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @9.0,104 GET dqr3 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @9.0,110.5 GET dsc3 vali ckjm3() PICTURE '@Jz 999,999.99' font 'Book Antiqua',14  size 0.95,10
        @9.0,124 GET sto3 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @10.5,4 GET kbn4 vali cbc4() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @10.5,25 GET kbg4 vali kbc4() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @10.5,37 GET nbg4 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @10.5,74 GET jmp4 PICT'@Jz 999,999.99' vali ckjm4() font'Book Antiqua',14 size 0.9,10
        @10.5,87 get trf4 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @10.5,104 GET dqr4 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @10.5,110.5 GET dsc4 vali ckjm4() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.9,10
        @10.5,124 GET sto4 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @12.0,4 GET kbn5 vali cbc5() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @12.0,25 GET kbg5 vali kbc5() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @12.0,37 GET nbg5 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @12.0,74 GET jmp5 PICT'@Jz 999,999.99' vali ckjm5() font'Book Antiqua',14 size 0.95,10
        @12.0,87 get trf5 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @12.0,104 GET dqr5 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @12.0,110.5 GET dsc5 vali ckjm5() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.95,10
        @12.0,124 GET sto5 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @13.5,4 GET kbn6 vali cbc6() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @13.5,25 GET kbg6 vali kbc6() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @13.5,37 GET nbg6 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @13.5,74 GET jmp6 PICT'@Jz 999,999.99' vali ckjm6() font'Book Antiqua',14 size 0.9,10
        @13.5,87 get trf6 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @13.5,104 GET dqr6 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @13.5,110.5 GET dsc6 vali ckjm6() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.9,10
        @13.5,124 GET sto6 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @15.0,4 GET kbn7 vali cbc7() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @15.0,25 GET kbg7 vali kbc7() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @15.0,37 GET nbg7 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @15.0,74 GET jmp7 PICT'@Jz 999,999.99' vali ckjm7() font'Book Antiqua',14 size 0.95,10
        @15.0,87 get trf7 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @15.0,104 GET dqr7 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @15.0,110.5 GET dsc7 vali ckjm7() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @15.0,124 GET sto7 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @16.5,4 GET kbn8 vali cbc8() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @16.5,25 GET kbg8 vali kbc8() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @16.5,37 GET nbg8 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @16.5,74 GET jmp8 PICT'@Jz 999,999.99' vali ckjm8() font'Book Antiqua',14 size 0.9,10
        @16.5,87 get trf8 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @16.5,104 GET dqr8 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @16.5,110.5 GET dsc8 vali ckjm8() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @16.5,124 GET sto8 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @18.0,4 GET kbn9 vali cbc9() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @18.0,25 GET kbg9 vali kbc9() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @18.0,37 GET nbg9 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @18.0,74 GET jmp9 PICT'@Jz 999,999.99' vali ckjm9() font'Book Antiqua',14 size 0.95,10
        @18.0,87 get trf9 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @18.0,104 GET dqr9 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @18.0,110.5 GET dsc9 vali ckjm9() PICTURE '@Jz 999,999.99' font'Book Antiqua',14  size 0.95,10
        @18.0,124 GET sto9 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @19.5,4 GET kbn10 vali cbc10() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @19.5,25 GET kbg10 vali kbc10() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @19.5,37 GET nbg10 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @19.5,74 GET jmp10 PICT'@Jz 999,999.99' vali ckjm10() font'Book Antiqua',14 size 0.9,10
        @19.5,87 get trf10 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @19.5,104 GET dqr10 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @19.5,110.5 GET dsc10 vali ckjm10() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @19.5,124 GET sto10 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @21.0,4 GET kbn11 vali cbc11() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @21.0,25 GET kbg11 vali kbc11() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @21.0,37 GET nbg11 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @21.0,74 GET jmp11 PICT'@Jz 999,999.99' vali ckjm11() font'Book Antiqua',14 size 0.95,10
        @21.0,87 get trf11 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @21.0,104 GET dqr11 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @21.0,110.5 GET dsc11 vali ckjm11() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @21.0,124 GET sto11 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @22.5,4 GET kbn12 vali cbc12() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @22.5,25 GET kbg12 vali kbc12() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @22.5,37 GET nbg12 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @22.5,74 GET jmp12 PICT'@Jz 999,999.99' vali ckjm12() font'Book Antiqua',14 size 0.9,10
        @22.5,87 get trf12 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @22.5,104 GET dqr12 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @22.5,110.5 GET dsc12 vali ckjm12() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @22.5,124 GET sto12 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @24.0,4 GET kbn13 vali cbc13() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @24.0,25 GET kbg13 vali kbc13() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @24.0,37 GET nbg13 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @24.0,74 GET jmp13 PICT'@Jz 999,999.99' vali ckjm13() font'Book Antiqua',14 size 0.95,10
        @24.0,87 get trf13 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @24.0,104 GET dqr13 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @24.0,110.5 GET dsc13 vali ckjm13() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @24.0,124 GET sto13 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @25.5,4 GET kbn14 vali cbc14() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @25.5,25 GET kbg14 vali kbc14() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @25.5,37 GET nbg14 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @25.5,74 GET jmp14 PICT'@Jz 999,999.99' vali ckjm14() font'Book Antiqua',14 size 0.9,10
        @25.5,87 get trf14 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @25.5,104 GET dqr14 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @25.5,110.5 GET dsc14 vali ckjm14() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @25.5,124 GET sto14 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @27.0,4 GET kbn15 vali cbc15() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @27.0,25 GET kbg15 vali kbc15() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @27.0,37 GET nbg15 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @27.0,74 GET jmp15 PICT'@Jz 999,999.99' vali ckjm15() font'Book Antiqua',14 size 0.95,10
        @27.0,87 get trf15 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @27.0,104 GET dqr15 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @27.0,110.5 GET dsc15 vali ckjm15() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @27.0,124 GET sto15 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @28.5,4 GET kbn16 vali cbc16() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @28.5,25 GET kbg16 vali kbc16() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @28.5,37 GET nbg16 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @28.5,74 GET jmp16 PICT'@Jz 999,999.99' vali ckjm16() font'Book Antiqua',14 size 0.9,10
        @28.5,87 get trf16 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @28.5,104 GET dqr16 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @28.5,110.5 GET dsc16 vali ckjm16() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @28.5,124 GET sto16 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @30.0,4 GET kbn17 vali cbc17() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @30.0,25 GET kbg17 vali kbc17() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @30.0,37 GET nbg17 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @30.0,74 GET jmp17 PICT'@Jz 999,999.99' vali ckjm17() font'Book Antiqua',14 size 0.95,10
        @30.0,87 get trf17 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @30.0,104 GET dqr17 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @30.0,110.5 GET dsc17 vali ckjm17() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @30.0,124 GET sto17 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @31.5,4 GET kbn18 vali cbc18() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.9,17
        @31.5,25 GET kbg18 vali kbc18() picture '@!' font 'Book Antiqua',14 size 0.9,9.5
        @31.5,37 GET nbg18 PICTURE '@!' font 'Book Antiqua',12 size 1.05,35.4 disa
        @31.5,74 GET jmp18 PICT'@Jz 999,999.99' vali ckjm18() font'Book Antiqua',14 size 0.9,10
        @31.5,87 get trf18 size 0.9,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @31.5,104 GET dqr18 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @31.5,110.5 GET dsc18 vali ckjm18() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.9,10
        @31.5,124 GET sto18 size 0.9,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @33.0,4 GET kbn19 vali cbc19() picture '!!!!!!!!!!!!!' font 'Book Antiqua',14 size 0.95,17
        @33.0,25 GET kbg19 vali kbc19() picture '@!' font 'Book Antiqua',14 size 0.95,9.5
        @33.0,37 GET nbg19 PICTURE '@!' font 'Book Antiqua',12 size 1.1,35.4 disa
        @33.0,74 GET jmp19 PICT'@Jz 999,999.99' vali ckjm19() font'Book Antiqua',14 size 0.95,10
        @33.0,87 get trf19 size 0.95,12 PICTURE '@z 999,999,999' font'Book Antiqua',14 style'b'
        @33.0,104 GET dqr19 PICTURE '@^' from serd size 1,7 font 'Times New Roman'
        @33.0,110.5 GET dsc19 vali ckjm19() PICTURE '@Jz 999,999.99' font'Book Antiqua',14 size 0.95,10
        @33.0,124 GET sto19 size 0.95,14 PICTURE '@z 9,999,999,999' font'Book Antiqua',14 styl'b' disa
        @39.8,127.1 get neks PICTURE '@*IHT ;' font 'Arial',9 size 2.6,8,3.4
        @35,0 get jur1 PICTURE '@*IHT ;;' font 'Arial',9 size 5,16,2 default 0 
     ENDIF
     read
     if read()=12.or.jur1=3
        teesc=.t.
        exit
     endif
     do case
     case neks=1
        if hl>1
           do saveki
           hl=hl-1
           do slmula
           do uraiki
           nd=str(hl,1)   
           gne='neks'+nd+'.bmp'
           gno='hd'+nd+'.bmp'
        endif
     case neks=2
        if hl<5
           do saveki
           hl=hl+1
           do slmula
           do uraiki
           nd=str(hl,1)   
           gne='neks'+nd+'.bmp'
           gno='hd'+nd+'.bmp'
        endif
     endcase
     if jur1=1
       boyor=tot1
       @39.6,103 get boyor pict'@z 99,999,999' font'foxprint',14
       read
       etq=0
       sele 6
       bukw=righ(nbeliw,6)
       seek bukw
       if found()
          do while bukti=bukw.and.!eof()
             dele
             skip
          enddo
       endif
       sele 2
       set orde to 1
       seek nbeliw
       norek=recno()
       go norek
       do whil njual=nbeliw.and.!eof()
          kodew=kbrg
          kurang=ukecil
          etq=etq+1
          oq(etq)=left(kodew,6)+str(kurang,9,2)+td+str(ds,6,2)
          sele 1
          set orde to 1
          seek left(kodew,6)
          if found()
             repl ukecil with ukecil+kurang
          endif   
          sele 2
          set orde to 1
          dele
          skip
       enddo
       tot1=0
       mlo=.f.
       for mi=1 to 95
         mmr=0
         if left(ki(mi),28)<>spac(28)
           mlo=.t.
           lem=left(ki(mi),28)
           brc=subs(ki(mi),7,13)
           ukecilw=val(left(ji(mi),9))
           rqd=val(left(di(mi),1))
           jasaw=val(righ(di(mi),7))
           hbeliw=val(righ(ki(mi),10))
           ton=spac(1)
           jose=0
           do case
           case rqd=0
                totbw=hbeliw*ukecilw
           case rqd=1
                totbw=hbeliw*ukecilw
           case rqd=2
                jose=jasaw/100 
                totbw=hbeliw*ukecilw
                totbw=totbw-(totbw*jose)
           case rqd=3
                totbw=(ukecilw-jasaw)*hbeliw
           case rqd=4
                totbw=(hbeliw-jasaw)*ukecilw
           endcase
           tot1=tot1+totbw
           barang=lem
           tdw=serd(rqd)
           kbrgw=spac(9)
           sele 1
           set orde to 2
           seek barang
           if found()
              kbrgw=kbrg
           endif
           CARI=ASCAN(oq,left(Kbrgw,6))
           IF CARI !=0
              if left(kbrgw,6)+str(ukecilw,9,2)+tdw+str(jasaw,6,2)#oq(cari)
                 ton='E'
              endif
           endif
           sele 1
           set orde to 1
           seek kbrgw
           if found()
              repl ukecil with ukecil-ukecilw
           endif
           mmr=mmr+1
           sele 2
           set orde to 1
           appe blan
           REPL NJUAL WITH Nbeliw,TJUAL WITH Tbeliw,;
                Kbrg WITH Kbrgw,ukecil WITH Ukecilw,;
                HJUAL WITH Hbeliw,TOTB WITH TOTBW,SPG WITH SPGW,;
                DS WITH jasaw,KS WITH KSR,TD WITH tdw,period with wayah,;
                EDIT WITH ton, TEDIT WITH DATE(), oleh with asmo,;
                op with iif(jtem=0,'T','K'), kang with kangw, ke with jtem
         endif       
       next
       susuke=0
       if boyor-tot1>-1.and.boyor-tot1<0
          susuke=0
       else   
          susuke=boyor-tot1
       endif
       @41,107 say susuke pict'@z 99,999,999' font'Book Antiqua',14 styl'b' colo rgb(255,255,255,40,54,40)
       if mlo
          sele 6
          bukw=righ(nbeliw,6)
          seek bukw
          if !found()
             if jtem=0
               appe blan
               repl bukti with bukw, kang with kangw, no_perk with '4101', perkiraan with 'Penjualan Barang',;
                    uraian with nangw, kredit with totbw, ttrans with tbeliw
               appe blan
               repl bukti with bukw, kang with kangw, no_perk with '1111', perkiraan with 'Kas',;
                    uraian with nangw, debet with totbw, ttrans with tbeliw
             else       
               appe blan
               repl bukti with bukw, kang with kangw, no_perk with '4101', perkiraan with 'Penjualan Barang',;
                    uraian with nangw, kredit with totbw, ttrans with tbeliw
               appe blan
               repl bukti with bukw, kang with kangw, no_perk with '1131', perkiraan with 'Piutang Barang pada anggota',;
                    uraian with nangw, debet with totbw, ttrans with tbeliw
             endi       
          endif
          sele 2
          set orde to 1
          acti wind jadi
          @0,0 say'prnt.bmp'bitm
          @0,25.4 say'prnt1.bmp'bitm
          @0,50.8 say'prnt2.bmp'bitm
          @0.2,27 get jek PICTURE '@*IHT ;' font 'Arial',9 size 5.7,24,0 default 0 
           read
          deac wind jadi
          if jek=1
             do prjual             
          endif
       endif   
       exit
     endif  
     if jur1=2
       acti wind konf
       @0,0 say 'confirm.bmp'bitm
       @0,30 say 'confirm1.bmp'bitm
       @7.2,24 get hpz PICTURE '@*HT Ya;Tidak' font'Arial' size 1.8,12,1 default 0
       read
       deac wind konf
       if hpz=1
          sele 6
          bukw=righ(nbeliw,6)
          seek bukw
          if found()
             do while bukti=bukw.and.!eof()
                dele
                skip
             enddo
          endif
          sele 2
          set orde to 1
          seek nbeliw
          norek=recno()
          go norek
          do whil njual=nbeliw.and.!eof()
             kodew=kbrg
             kurang=ukecil
             sele 1
             set orde to 1
             seek left(kodew,6)
             if found()
                repl ukecil with ukecil+kurang
             endif   
             sele 2
             set orde to 1
             dele
             skip
          enddo
       endif
       exit
     endif
  enddo
  if teesc
     exit
  endif
enddo
clos data
set readb off
deac wind jual
rele ki
rele di
rele ji
rele serd
rele oq
do emn
retu
*
proc cajual
if nsama=nbeliw
  nsama=nsama
else  
  nsama=nbeliw
  tbeliw=date()
  membara=spac(1)
  kangw=spac(5)
  nangw=spac(28)
  store.f. to ono,moleh,teesc
  store 1 to mel1,mel2,mel3,mel4,mel5,mel6,mel7,mel8,mel9,mel10,mel11,mel12,mel13,mel14,mel15,mel16,mel17,mel18,mel19,mel20
  store 0 to sto1,sto2,sto3,sto4,sto5,sto6,sto7,sto8,sto9,sto10,sto11,sto12,sto13,sto14,sto15,sto16,sto17,sto18,sto19,sto20
  store 0 to dsc1,dsc2,dsc3,dsc4,dsc5,dsc6,dsc7,dsc8,dsc9,dsc10,dsc11,dsc12,dsc13,dsc14,dsc15,dsc16,dsc17,dsc18,dsc19,dsc20
  store 0 to trf1,trf2,trf3,trf4,trf5,trf6,trf7,trf8,trf9,trf10,trf11,trf12,trf13,trf14,trf15,trf16,trf17,trf18,trf19,trf20
  store 1 to dqr1,dqr2,dqr3,dqr4,dqr5,dqr6,dqr7,dqr8,dqr9,dqr10,dqr11,dqr12,dqr13,dqr14,dqr15,dqr16,dqr17,dqr18,dqr19,dqr20
  store 1 to jmp1,jmp2,jmp3,jmp4,jmp5,jmp6,jmp7,jmp8,jmp9,jmp10,jmp11,jmp12,jmp13,jmp14,jmp15,jmp16,jmp17,jmp18,jmp19,jmp20
  store spac(13) to kbn1,kbn2,kbn3,kbn4,kbn5,kbn6,kbn7,kbn8,kbn9,kbn10,kbn11,kbn12,kbn13,kbn14,kbn15,kbn16,kbn17,kbn18,kbn19,kbn20
  store spac(9) to kbg1,kbg2,kbg3,kbg4,kbg5,kbg6,kbg7,kbg8,kbg9,kbg10,kbg11,kbg12,kbg13,kbg14,kbg15,kbg16,kbg17,kbg18,kbg19,kbg20
  store spac(28) to nbg1,nbg2,nbg3,nbg4,nbg5,nbg6,nbg7,nbg8,nbg9,nbg10,nbg11,nbg12,nbg13,nbg14,nbg15,nbg16,nbg17,nbg18,nbg19,nbg20
  ndokw=spac(30)
  alam=spac(30)
  arema=spac(15)
  bares=1
  phju=1
  ksr=SPAC(3)
  spgw=SPAC(3)
  store 0 to apem,pema,bayarw,utangw,nudok,tot1,jtempo,jtem,mol
  for ti=1 to 95
    ki(ti)=spac(28)+ spac(13)+spac(10)
  next
  for ti=1 to 95
    di(ti)='1'+'    .  '
  next
  for ti=1 to 95
    ji(ti)='     1.00'
  next
  sele 2
  set orde to 1
  seek nbeliw
  if found()
     i=0
     tbeliw=tjual
     spgw=spg
     ksr=ks
     kbrgw=spac(9)
     kangw=kang
     jtem=ke
     sele 5
     set orde to 1
     seek kangw
     if found()
        nangw=nang
     endif
     sele 2
     set orde to 1
     do while njual=nbeliw.and.!eof()
        i=i+1
        kbrgw=kbrg
        trf=hjual
        jmp=ukecil
        dqr=ascan(serd,td)
        dsc=ds
        nbrgw=spac(28)
        mil=0
        kbn=spac(13)
        sele 1
        set orde to 1
        seek kbrgw
        if found()
           nbrgw=nbrg
           kbn=left(barcode,13)
        endif
        ki(i)=nbrgw+ kbn + kbrgw + str(trf,10)
        di(i)=str(dqr,1) + str(dsc,7,2)
        ji(i)=str(jmp,9,2)
        sele 2
        set orde to 1
        skip
     enddo
     do uraiki
  endif
endif  
show gets
retu
*
