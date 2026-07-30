import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsMechanicsCanonicalLaneLean

structure NoetherConservationLaw where
  symmetryGroup : Type u
  conservedQuantity : Type v
  symmetryPrinciple : Prop
  conservationStatement : Prop

structure NoetherEvidence (N : NoetherConservationLaw) where
  symmetryGroupClosed : Nonempty N.symmetryGroup
  conservedQuantityClosed : Nonempty N.conservedQuantity
  symmetryPrincipleClosed : N.symmetryPrinciple
  conservationStatementClosed : N.conservationStatement

def NoetherClosed (N : NoetherConservationLaw) : Prop :=
  Nonempty N.symmetryGroup ∧ Nonempty N.conservedQuantity ∧ N.symmetryPrinciple ∧ N.conservationStatement

theorem noether_closed_from_evidence (N : NoetherConservationLaw) (E : NoetherEvidence N) : NoetherClosed N := by
  exact And.intro E.symmetryGroupClosed (And.intro E.conservedQuantityClosed (And.intro E.symmetryPrincipleClosed E.conservationStatementClosed))

end VariationalMethodsMechanicsCanonicalLaneLean
end HautevilleHouse