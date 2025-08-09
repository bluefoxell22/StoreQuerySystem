clos data
use stocc
go top
r=spac(1)
do while !eof()
   if r=t
      r=r
      no=no+1
   else
      r=t
      no=1
   endi      
   nomor=str(no)
   pjnomor=len(ltrim(nomor))
   ii=r+'00000'
   nbeliw=left(ii,len(ii)-pjnomor)+ltrim(nomor)
   repl kbrg with nbeliw
   skip
enddo   