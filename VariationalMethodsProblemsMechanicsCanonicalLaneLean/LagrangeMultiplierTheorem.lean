import VariationalMethodsProblemsMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure LagrangeMultiplierPackage (A : AdmissibleClass) where
  constraintSet : A.object.space → Prop
  multiplierExists : Prop
  firstOrderCondition : Prop
  regularityAssumption : Prop

structure LagrangeMultiplierEvidence (A : AdmissibleClass) (LM : LagrangeMultiplierPackage A) where
  multiplierExistsClosed : LM.multiplierExists
  firstOrderConditionClosed : LM.firstOrderCondition
  regularityAssumptionClosed : LM.regularityAssumption

def LagrangeMultiplierClosed (A : AdmissibleClass) (LM : LagrangeMultiplierPackage A) : Prop :=
  LM.multiplierExists ∧ LM.firstOrderCondition ∧ LM.regularityAssumption

theorem lagrange_multiplier_closed_from_evidence (A : AdmissibleClass) (LM : LagrangeMultiplierPackage A) (Ev : LagrangeMultiplierEvidence A LM) :
    LagrangeMultiplierClosed A LM := by
  exact And.intro Ev.multiplierExistsClosed (And.intro Ev.firstOrderConditionClosed Ev.regularityAssumptionClosed)

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse
