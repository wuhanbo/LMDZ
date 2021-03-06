      SUBROUTINE covnat (klevel,ucov, vcov, unat, vnat )
      IMPLICIT NONE

c=======================================================================
c
c   Auteur:  F Hourdin Phu LeVan
c   -------
c
c   Objet:
c   ------
c
c  *********************************************************************
c    calcul des compos. naturelles a partir des comp.covariantes
c  ********************************************************************
c
c=======================================================================

#include "dimensions.h"
#include "paramet.h"
#include "comgeom.h"

      INTEGER klevel
      REAL ucov( ip1jmp1,klevel ),  vcov( ip1jm,klevel )
      REAL unat( ip1jmp1,klevel ), vnat( ip1jm,klevel )
      INTEGER   l,ij


      DO l = 1,klevel
         DO ij = 1, iip1
            unat (ij,l) =0.
         END DO

         DO ij = iip2, ip1jm
            unat( ij,l ) = ucov( ij,l ) / cu(ij)
         ENDDO
         DO ij = ip1jm+1, ip1jmp1  
            unat (ij,l) =0.
         END DO

         DO ij = 1,ip1jm
            vnat( ij,l ) = vcov( ij,l ) / cv(ij)
         ENDDO

      ENDDO
      RETURN
      END
