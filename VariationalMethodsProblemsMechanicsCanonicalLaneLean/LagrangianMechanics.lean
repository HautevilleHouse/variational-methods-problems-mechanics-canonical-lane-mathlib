import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsMechanicsCanonicalLaneLean

structure LagrangianSystem where
  configurationManifold : Type u
  tangentBundle : Type v
  lagrangian : tangentBundle → ℝ
  eulerLagrangeFlow : Prop

structure LagrangianEvidence (L : LagrangianSystem) where
  configurationManifoldClosed : Nonempty L.configurationManifold
  tangentBundleClosed : Nonempty L.tangentBundle
  lagrangianClosed : True
  eulerLagrangeFlowClosed : L.eulerLagrangeFlow

def LagrangianClosed (L : LagrangianSystem) : Prop :=
  Nonempty L.configurationManifold ∧ Nonempty L.tangentBundle ∧ True ∧ L.eulerLagrangeFlow

theorem lagrangian_closed_from_evidence (L : LagrangianSystem) (E : LagrangianEvidence L) : LagrangianClosed L := by
  exact And.intro E.configurationManifoldClosed (And.intro E.tangentBundleClosed (And.intro E.lagrangianClosed E.eulerLagrangeFlowClosed))

end VariationalMethodsMechanicsCanonicalLaneLean
end HautevilleHouse