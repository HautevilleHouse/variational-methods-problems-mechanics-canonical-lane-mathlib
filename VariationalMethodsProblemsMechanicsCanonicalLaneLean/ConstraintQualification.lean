import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalMethodsProblemsMechanicsCanonicalLaneLean.VariationalFormulation

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure ConstraintQualificationPackage {V : VariationalFormulationPackage}
    (F : VariationalFormulationEvidence V) where
  equalityConstraints : Type u
  inequalityConstraints : Type v
  lagrangeMultiplierRule : Prop
  constraintQualificationCondition : Prop
  firstOrderOptimalityConditions : Prop

structure ConstraintQualificationEvidence {V : VariationalFormulationPackage}
    {F : VariationalFormulationEvidence V} (C : ConstraintQualificationPackage F) where
  lagrangeMultiplierRuleClosed : C.lagrangeMultiplierRule
  constraintQualificationConditionClosed : C.constraintQualificationCondition
  firstOrderOptimalityConditionsClosed : C.firstOrderOptimalityConditions

def ConstraintQualificationClosed {V : VariationalFormulationPackage}
    {F : VariationalFormulationEvidence V} (C : ConstraintQualificationPackage F) : Prop :=
  C.lagrangeMultiplierRule ∧ C.constraintQualificationCondition ∧
  C.firstOrderOptimalityConditions ∧ VariationalFormulationClosed V

theorem constraint_qualification_closed_from_evidence
    {V : VariationalFormulationPackage} {F : VariationalFormulationEvidence V}
    (C : ConstraintQualificationPackage F) (E : ConstraintQualificationEvidence C) :
    ConstraintQualificationClosed C := by
  have hV := variational_formulation_closed_from_evidence V F
  exact And.intro E.lagrangeMultiplierRuleClosed
    (And.intro E.constraintQualificationConditionClosed
      (And.intro E.firstOrderOptimalityConditionsClosed hV))

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse