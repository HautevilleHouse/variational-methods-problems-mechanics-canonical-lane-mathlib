import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalMethodsProblemsMechanicsCanonicalLaneLean.VariationalFormulation

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure VariationalInequalityPackage {V : VariationalFormulationPackage}
    (F : VariationalFormulationEvidence V) where
  convexSet : Type u
  operator : Type v
  inequalityFormulation : Prop
  solutionExistence : Prop
  solutionUniqueness : Prop

structure VariationalInequalityEvidence {V : VariationalFormulationPackage}
    {F : VariationalFormulationEvidence V} (I : VariationalInequalityPackage F) where
  inequalityFormulationClosed : I.inequalityFormulation
  solutionExistenceClosed : I.solutionExistence
  solutionUniquenessClosed : I.solutionUniqueness

def VariationalInequalityClosed {V : VariationalFormulationPackage}
    {F : VariationalFormulationEvidence V} (I : VariationalInequalityPackage F) : Prop :=
  I.inequalityFormulation ∧ I.solutionExistence ∧ I.solutionUniqueness ∧ VariationalFormulationClosed V

theorem variational_inequality_closed_from_evidence
    {V : VariationalFormulationPackage} {F : VariationalFormulationEvidence V}
    (I : VariationalInequalityPackage F) (E : VariationalInequalityEvidence I) :
    VariationalInequalityClosed I := by
  have hV := variational_formulation_closed_from_evidence V F
  exact And.intro E.inequalityFormulationClosed
    (And.intro E.solutionExistenceClosed
      (And.intro E.solutionUniquenessClosed hV))

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse