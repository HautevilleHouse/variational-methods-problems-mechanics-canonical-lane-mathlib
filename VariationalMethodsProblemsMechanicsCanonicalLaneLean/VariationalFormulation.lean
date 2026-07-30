import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsMechanicsCanonicalLaneLean

structure VariationalProblem {M : Type u} [MetricSpace M] where
  configurationSpace : M
  actionFunctional : (ℝ → M) → ℝ
  admissiblePaths : Set (ℝ → M)
  eulerLagrangeEquation : (ℝ → M) → Prop

structure VariationalEvidence {M : Type u} [MetricSpace M] (V : VariationalProblem M) where
  configurationSpaceClosed : Nonempty V.configurationSpace
  actionFunctionalClosed : True
  admissiblePathsClosed : V.admissiblePaths.Nonempty
  eulerLagrangeEquationClosed : ∃ γ, V.eulerLagrangeEquation γ

def VariationalClosed {M : Type u} [MetricSpace M] (V : VariationalProblem M) : Prop :=
  Nonempty V.configurationSpace ∧
  True ∧
  V.admissiblePaths.Nonempty ∧
  ∃ γ, V.eulerLagrangeEquation γ

theorem variational_closed_from_evidence {M : Type u} [MetricSpace M] (V : VariationalProblem M) (E : VariationalEvidence V) : VariationalClosed V := by
  exact And.intro E.configurationSpaceClosed (And.intro E.actionFunctionalClosed (And.intro E.admissiblePathsClosed E.eulerLagrangeEquationClosed))

end VariationalMethodsMechanicsCanonicalLaneLean
end HautevilleHouse