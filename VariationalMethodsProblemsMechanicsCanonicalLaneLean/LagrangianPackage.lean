import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalMethodsProblemsMechanicsCanonicalLaneLean.AdmissibleClass

/-!
# Lagrangian Package
-/

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure LagrangianPackage where
  configurationSpace : Type u
  lagrangianFunction : Type v
  smoothLagrangian : Prop
  nondegenerate : Prop
  regularityConditions : Prop

structure LagrangianEvidence (L : LagrangianPackage) where
  smoothLagrangianClosed : L.smoothLagrangian
  nondegenerateClosed : L.nondegenerate
  regularityConditionsClosed : L.regularityConditions

def LagrangianClosed (L : LagrangianPackage) : Prop :=
  L.smoothLagrangian ∧ L.nondegenerate ∧ L.regularityConditions

theorem lagrangian_closed_from_evidence
    (L : LagrangianPackage) (Ev : LagrangianEvidence L) : LagrangianClosed L := by
  exact And.intro Ev.smoothLagrangianClosed
    (And.intro Ev.nondegenerateClosed Ev.regularityConditionsClosed)

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse