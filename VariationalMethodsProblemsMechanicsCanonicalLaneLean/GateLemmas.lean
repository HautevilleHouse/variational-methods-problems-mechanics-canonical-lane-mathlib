import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalMethodsProblemsMechanicsCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.VariationalMethodsProblemsMechanicsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse