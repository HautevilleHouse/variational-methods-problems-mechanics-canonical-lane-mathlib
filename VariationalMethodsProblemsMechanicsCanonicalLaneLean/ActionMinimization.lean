import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsMechanicsCanonicalLaneLean

structure MinimizationProblem {M : Type u} [MetricSpace M] where
  functional : (ℝ → M) → ℝ
  admissibleSet : Set (ℝ → M)
  lowerBound : ℝ
  minimizerExists : Prop

structure MinimizationEvidence {M : Type u} [MetricSpace M] (P : MinimizationProblem M) where
  functionalClosed : True
  admissibleSetClosed : P.admissibleSet.Nonempty
  lowerBoundClosed : True
  minimizerExistsClosed : P.minimizerExists

def MinimizationClosed {M : Type u} [MetricSpace M] (P : MinimizationProblem M) : Prop :=
  True ∧ P.admissibleSet.Nonempty ∧ True ∧ P.minimizerExists

theorem minimization_closed_from_evidence {M : Type u} [MetricSpace M] (P : MinimizationProblem M) (E : MinimizationEvidence P) : MinimizationClosed P := by
  exact And.intro E.functionalClosed (And.intro E.admissibleSetClosed (And.intro E.lowerBoundClosed E.minimizerExistsClosed))

end VariationalMethodsMechanicsCanonicalLaneLean
end HautevilleHouse