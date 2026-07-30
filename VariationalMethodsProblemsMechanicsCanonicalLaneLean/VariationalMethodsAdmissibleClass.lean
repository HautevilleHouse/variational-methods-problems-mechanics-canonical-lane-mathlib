import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure VariationalAdmittedObject where
  configSpace : Type u
  lagrangian : configSpace → ℝ
  actionFunctional : (ℝ → configSpace) → ℝ
  eulerLagrangeEquations : Prop
  boundaryConditions : Prop

structure AdmissibleClass where
  object : VariationalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse