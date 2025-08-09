clos data
use INS
go top
do while !eof()
   ccc=str(a)
   ccc=alltrim(ccc)
   do case
   case len(ccc)=1
      kangw='00'+ccc
   case len(ccc)=2
      kangw='0'+ccc
   case len(ccc)=3
      kangw=ccc
   endcas
   repl kins with kangw
   skip
enddo   