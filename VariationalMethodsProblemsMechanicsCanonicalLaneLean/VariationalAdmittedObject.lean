import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalMethodsProblemsMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure VariationalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure VariationalAdmittedObject where
  space : VariationalSpace
  lagrangian : LagrangianPackage
  boundaryConditions : Prop
  properFunctional : Prop
  minimizerExists : Prop
  conclusion : minimizerExists

structure VariationalEndgameState where
  object : VariationalAdmittedObject

def VariationalWitnessClosed (O : VariationalAdmittedObject) : Prop :=
  O.minimizerExists

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse