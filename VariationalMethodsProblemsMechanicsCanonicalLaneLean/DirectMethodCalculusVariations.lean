import VariationalMethodsProblemsMechanicsCanonicalLaneLean.AdmissibleClass
import VariationalMethodsProblemsMechanicsCanonicalLaneLean.EulerLagrangeEquations

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure DirectMethodPackage (A : AdmissibleClass) (EL : EulerLagrangePackage A) where
  coercivity : Prop
  lowerSemicontinuity : Prop
  compactness : Prop
  minimizerExistence : Prop
  spaceComplete : Prop
  functionalBoundedBelow : Prop

structure DirectMethodEvidence (A : AdmissibleClass) (EL : EulerLagrangePackage A) (DM : DirectMethodPackage A EL) where
  coercivityClosed : DM.coercivity
  lowerSemicontinuityClosed : DM.lowerSemicontinuity
  compactnessClosed : DM.compactness
  minimizerExistenceClosed : DM.minimizerExistence

def DirectMethodClosed (A : AdmissibleClass) (EL : EulerLagrangePackage A) (DM : DirectMethodPackage A EL) : Prop :=
  DM.coercivity ∧ DM.lowerSemicontinuity ∧ DM.compactness ∧ DM.minimizerExistence ∧ DM.spaceComplete ∧ DM.functionalBoundedBelow

theorem direct_method_closed_from_evidence (A : AdmissibleClass) (EL : EulerLagrangePackage A) (DM : DirectMethodPackage A EL) (Ev : DirectMethodEvidence A EL DM) :
    DirectMethodClosed A EL DM := by
  exact And.intro Ev.coercivityClosed (And.intro Ev.lowerSemicontinuityClosed (And.intro Ev.compactnessClosed Ev.minimizerExistenceClosed))

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse
