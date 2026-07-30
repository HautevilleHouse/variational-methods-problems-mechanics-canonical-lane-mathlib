import VariationalMethodsProblemsMechanicsCanonicalLaneLean.VariationalMethodsAdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure EulerLagrangePackage (V : VariationalAdmittedObject) where
  functionalDerivative : (V.configSpace → ℝ) → (V.configSpace → ℝ)
  stationarityCondition : V.actionFunctional = 0 → V.eulerLagrangeEquations
  boundaryTermsSatisfied : Prop
  lagrangianRegularity : Prop

structure EulerLagrangeEvidence {V : VariationalAdmittedObject} (E : EulerLagrangePackage V) where
  stationarityConditionClosed : E.stationarityCondition (by trivial)
  boundaryTermsSatisfiedClosed : E.boundaryTermsSatisfied
  lagrangianRegularityClosed : E.lagrangianRegularity

def EulerLagrangeClosed {V : VariationalAdmittedObject} (E : EulerLagrangePackage V) : Prop :=
  E.boundaryTermsSatisfied ∧ E.lagrangianRegularity

theorem euler_lagrange_closed_from_evidence
    {V : VariationalAdmittedObject} (E : EulerLagrangePackage V)
    (Ev : EulerLagrangeEvidence E) : EulerLagrangeClosed E := by
  exact And.intro Ev.boundaryTermsSatisfiedClosed Ev.lagrangianRegularityClosed

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse