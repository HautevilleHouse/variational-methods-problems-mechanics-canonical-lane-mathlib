import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalMethodsProblemsMechanicsCanonicalLaneLean.AdmissibleClass

/-!
# Euler-Lagrange PDE Package
-/

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure EulerLagrangePDEPackage {L : LagrangianPackage} where
  functionalDerivative : Type u
  extremalCondition : Prop
  boundaryTermsVanishing : Prop
  naturalBoundaryConditions : Prop

structure EulerLagrangePDEEvidence {L : LagrangianPackage}
    (E : EulerLagrangePDEPackage L) where
  functionalDerivativeClosed : E.functionalDerivative
  extremalConditionClosed : E.extremalCondition
  boundaryTermsVanishingClosed : E.boundaryTermsVanishing
  naturalBoundaryConditionsClosed : E.naturalBoundaryConditions

def EulerLagrangePDEClosed {L : LagrangianPackage}
    (E : EulerLagrangePDEPackage L) : Prop :=
  E.functionalDerivative ∧ E.extremalCondition ∧ E.boundaryTermsVanishing ∧ E.naturalBoundaryConditions

theorem euler_lagrange_pde_closed_from_evidence
    {L : LagrangianPackage} (E : EulerLagrangePDEPackage L)
    (Ev : EulerLagrangePDEEvidence E) : EulerLagrangePDEClosed E := by
  exact And.intro Ev.functionalDerivativeClosed
    (And.intro Ev.extremalConditionClosed
      (And.intro Ev.boundaryTermsVanishingClosed Ev.naturalBoundaryConditionsClosed))

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse