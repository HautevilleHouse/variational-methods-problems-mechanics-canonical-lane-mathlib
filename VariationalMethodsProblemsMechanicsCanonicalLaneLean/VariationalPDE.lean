import VariationalMethodsProblemsMechanicsCanonicalLaneLean.VariationalMethodsAdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure VariationalPDEPackage (V : VariationalAdmittedObject) where
  pdeSystem : (V.configSpace → ℝ) → Prop
  weakFormulation : (V.configSpace → ℝ) → (V.configSpace → ℝ) → ℝ
  existenceSolution : Prop
  uniquenessSolution : Prop
  regularityGain : Prop

structure VariationalPDEEvidence {V : VariationalAdmittedObject}
    (P : VariationalPDEPackage V) where
  existenceSolutionClosed : P.existenceSolution
  uniquenessSolutionClosed : P.uniquenessSolution
  regularityGainClosed : P.regularityGain

def VariationalPDEClosed {V : VariationalAdmittedObject} (P : VariationalPDEPackage V) : Prop :=
  P.existenceSolution ∧ P.uniquenessSolution ∧ P.regularityGain

theorem variational_pde_closed_from_evidence
    {V : VariationalAdmittedObject} (P : VariationalPDEPackage V)
    (Ev : VariationalPDEEvidence P) : VariationalPDEClosed P := by
  exact And.intro Ev.existenceSolutionClosed (And.intro Ev.uniquenessSolutionClosed Ev.regularityGainClosed)

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse