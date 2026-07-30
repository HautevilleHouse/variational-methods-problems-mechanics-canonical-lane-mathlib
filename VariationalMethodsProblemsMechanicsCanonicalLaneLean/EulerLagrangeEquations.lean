import VariationalMethodsProblemsMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure EulerLagrangePackage (A : AdmissibleClass) where
  lagrangian : A.object.functional → A.object.space → Prop
  firstVariationZero : Prop
  naturalBoundaryConditions : Prop
  smoothSolutions : Prop

structure EulerLagrangeEvidence (A : AdmissibleClass) (E : EulerLagrangePackage A) where
  firstVariationZeroClosed : E.firstVariationZero
  naturalBoundaryConditionsClosed : E.naturalBoundaryConditions
  smoothSolutionsClosed : E.smoothSolutions

def EulerLagrangeClosed (A : AdmissibleClass) (E : EulerLagrangePackage A) : Prop :=
  E.firstVariationZero ∧ E.naturalBoundaryConditions ∧ E.smoothSolutions

theorem euler_lagrange_closed_from_evidence (A : AdmissibleClass) (E : EulerLagrangePackage A) (Ev : EulerLagrangeEvidence A E) :
    EulerLagrangeClosed A E := by
  exact And.intro Ev.firstVariationZeroClosed (And.intro Ev.naturalBoundaryConditionsClosed Ev.smoothSolutionsClosed)

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse
