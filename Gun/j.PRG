CLOS DATA
use nonagt
n=189
go top
do while !eof()
   nomor=str(n)
   pjnomor=len(ltrim(nomor))
   nbeliw=left('J000000',len('J000000')-pjnomor)+ltrim(nomor)
   repl njual with nbeliw
   n=n+1
   skip
enddo   
