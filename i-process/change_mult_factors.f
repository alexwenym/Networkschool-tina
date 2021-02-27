      program change_mult_factors

c this program prepares new_networksetup.txt file
c it uses the new multiplication factors for selected (n,g) reaction rates from
c the file new_mult_factors.txt

c before running this program prepare the right template_networksetup.txt file
c that will be changed into new_networksetup.txt file

      implicit none

      integer :: values(1:8), k
      integer, parameter :: nsp=10000
      integer, parameter :: nre=100000
      integer I,L, j,niso,check_iso
      integer NGIS,INUMER,NNNZ,NGIR,INUMERR,NNNR
      integer NA(nre),NB(nre),ND(nre),NC(nre)
      CHARACTER*5 ZIS(nsp),SPE1(nre),SPE2(nre),SPE3(nre),SPE4(nre)
      logical considerisotope(nsp)
      logical considerreaction(nre)
      character*5 lab(nre),labb(nre), iso(nre)
      double precision AN(nsp),ZN(nsp),rfac(nre),bind_energy_diff(nre)
      integer inisom(nsp),ilabb(nre)
      double precision t9,rho,V(nre), fac(nre),rfactor
      character (len=6) :: istr

C read template_networksetup.txt
      open( 8,file="template_networksetup.txt")

      read( 8,*)
      read( 8,100)t9,rho
  100 format(25x,2(1x,e10.3))
      read( 8,*)
      read( 8,*)
      read( 8,'(7x,I5,16x,I5)')NGIS,INUMER
      DO 221 I=1,NGIS
         read( 8,9050) NNNZ,ZIS(I),considerisotope(I),AN(I),ZN(I)
     &        ,inisom(I)
 9050 FORMAT(7X,I5,3X,A5,1X,L5,2X,0PF4.0,3X,F4.0,3x,I1)
 221  CONTINUE

      read( 8,*)
      read( 8,*)
      read( 8,*)
      read( 8,*)
      read( 8,'(7x,I5,16x,I5)')NGIR,INUMERR
      DO L=1,NGIR 
         read( 8,9073)NNNR,CONSIDERREACTION(L),NA(L),SPE1(L),
     &        NB(L),SPE2(L),ND(L),SPE3(L),NC(L),SPE4(L),V(L),
     &        lab(L),labb(L),ilabb(L),rfac(L),bind_energy_diff(L)
 9073 FORMAT(2X,I5,1X,L1,1X,I2,2X,A5,4x,I2,2X,A5,2X,2x,1X,I2,2X,
     & A5,4x,I2,2X,A5,3X,E9.3,2x,A5,2x,A5,2x,I2,2x,1ES10.3,2x,1ES10.3)
      END DO

      close( 8)

c read new_mult_factors.txt (fac(j) are the new multiplications factors for selected reaction rates)

      open( 9, file="new_mult_factors.txt")

      j = 0
   10 continue
      j = j+1
      read( 9,110, end=999) iso(j),fac(j)
  110 format(a5,1x,f8.4)

      go to 10
  999 continue
      close( 9)
      niso=j-1

      write(*,130) niso
  130 format(' The new_mult_factors.txt file has ',i6,' isotopes.')
      if(niso.lt.1) STOP 666

c check that template_networksetup.txt contains all isotopes from new_mult_factors.txt
      do j=1,niso
      check_iso=0
      do I=1,NGIS
      if(iso(j).eq.ZIS(I)) check_iso=1
      end do
      if(check_iso.eq.0) then
         write(*,140) iso(j)
  140    format(' template_networksetup.txt does not contain ',a5)
         STOP 666
      end if
      end do

c write out new_networksetup.txt files
      open(14,file="new_networksetup.txt")

      write(14,9020)
      write(14,9010)t9,rho
      write(14,9030)
      write(14,*)NGIS,' =  NGIS', INUMER,' =  ISOMERS'
      do 21 I=1,NGIS
         write(14,9050) I,ZIS(I),considerisotope(I),AN(I),ZN(I)
     &        ,inisom(I)
 21   CONTINUE
 
      WRITE(14,9020)
      WRITE(14,9060)
      WRITE(14,*)NGIR,' =  NGIR',INUMERR,' = + REAZ ISOMERS'
      DO 31 L=1,NGIR

      rfactor=rfac(L)

      do j=1,niso
         if(iso(j).eq.SPE1(L).and."(n,g)".eq.labb(L))
     &      rfactor=fac(j)
      end do

         write(14,9072)L,CONSIDERREACTION(L),NA(L),SPE1(L),
     &        NB(L),SPE2(L),ND(L),SPE3(L),NC(L),SPE4(L),V(L),
     &        lab(L),labb(L),ilabb(L),rfactor,bind_energy_diff(L)
 31   CONTINUE    
 
 9010 FORMAT(8X,'TABLE OF ISOTOPES ',e10.3,1x,e10.3)
 9020 FORMAT(72('*'))
 9030 FORMAT(/,2X,4X,'  NO.',1X,'SYMBOL T/F MASSNR PROTON')
 9060 FORMAT(/,10X,'REACTION NETWORK',35X,'V(i) Nasv(*rho)',/)
 9072 FORMAT(2X,I5,1X,L1,1X,I2,2X,A5,'  + ',I2,2X,A5,2X,'->',1X,I2,2X,
     & A5,'  + ',I2,2X,A5,3X,E9.3,2x,A5,2x,A5,2x,I2,2x,
     & 1ES10.3,2x,1ES10.3)

      close(14)

      STOP "New networksetup_new.txt file created."

      end program change_mult_factors
