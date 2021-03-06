      SUBROUTINE laplacien_rotgam ( klevel, rotin, rotout )
c
c     P. Le Van
c
c   ************************************************************
c   ... calcul de  (rotat x nxgrad)_gam  du rotationnel rotin ..
c   ************************************************************
c     klevel et teta  sont des arguments  d'entree pour le s-prog
c      divgra     est  un argument  de sortie pour le s-prog
c
      IMPLICIT NONE
c
#include "dimensions.h"
#include "paramet.h"
#include "comgeom.h"

c
c    .............   variables  en  arguments    ...........
c
      INTEGER klevel
      REAL rotin( ip1jm,klevel ), rotout( ip1jm,klevel )
c
c   ............     variables   locales     ...............
c
      INTEGER l, ij
      REAL ghy(ip1jm,llm), ghx(ip1jmp1,llm)
c   ........................................................
c
      EXTERNAL   nxgrad_gam, rotat_nfil
c

      CALL nxgrad_gam ( klevel, rotin,   ghx ,   ghy  )
      CALL rotat_nfil ( klevel, ghx  ,   ghy , rotout )
c
      DO l = 1, klevel
        DO ij = 1, ip1jm
         rotout(ij,l) = rotout(ij,l) * unsairz_gam(ij)
        ENDDO
      ENDDO

      RETURN
      END
