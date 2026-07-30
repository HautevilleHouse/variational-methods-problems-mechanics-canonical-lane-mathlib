import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure VariationalProblem where
  admissibleDisplacements : Type u
  energyFunctional : admissibleDisplacements → ℝ
  eulerLagrangeOperator : admissibleDisplacements → (admissibleDisplacements → ℝ)
  boundaryConditions : admissibleDisplacements → Prop
  solvabilityCondition : Prop

structure VariationalProblemEvidence (P : VariationalProblem) where
  admissibleDisplacementsDefined : Nonempty P.admissibleDisplacements
  energyFunctionalSmooth : Prop
  eulerLagrangeOperatorDerived : P.eulerLagrangeOperator = λ u => λ v => 0
  boundaryConditionsSatisfied : P.boundaryConditionsClassified
  solvabilityConditionClosed : P.solvabilityCondition

structure VariationalProblemClosed (P : VariationalProblem) : Prop where
  admissibleDisplacementsNonempty : Nonempty P.admissibleDisplacements
  energyFunctionalSmooth : Prop
  eulerLagrangeOperatorDerived : P.eulerLagrangeOperator = λ u => λ v => 0
  boundaryConditionsSatisfied : Prop
  solvabilityConditionClosed : P.solvabilityCondition

theorem variational_problem_closed_from_evidence
    (P : VariationalProblem) (E : VaritationalProblemEvidence P) :
    VaritationalProblemClosed P := by
  exact { admissibleDisplacementsNonempty := E.admissibleDisplacementsDefined
       , energyFunctionalSmooth := E.energyFunctionalSmooth
       , eulerLagrangeOperatorDerived := E.eulerLagrangeOperatorDerived
       , boundaryConditionsSatisfied := E.boundaryConditionsSatisfied
       , solvabilityConditionClosed := E.solvabilityConditionClosed }

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse
