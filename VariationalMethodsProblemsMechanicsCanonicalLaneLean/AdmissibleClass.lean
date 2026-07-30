import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsMechanicsCanonicalLaneLean

structure VariationalAdmissibleObject where
  problem : VariationalProblem (Type u)
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

structure VariationalAdmissibleClass where
  object : VariationalAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def variationalAdmittedClosure (A : VariationalAdmissibleClass) : Prop :=
  VariationalClosed A.object.problem ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end VariationalMethodsMechanicsCanonicalLaneLean
end HautevilleHouse