import VariationalMethodsProblemsMechanicsCanonicalLaneLean.EulerLagrangePackage

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure NoetherConservationPackage {V : VariationalAdmittedObject}
    (E : EulerLagrangePackage V) where
  symmetryGroup : Type u
  conservedQuantity : (V.configSpace → ℝ) → ℝ
  symmetryAction : Prop
  conservationLaw : Prop
  momentumMap : Prop

structure NoetherConservationEvidence {V : VariationalAdmittedObject}
    {E : EulerLagrangePackage V} (N : NoetherConservationPackage E) where
  symmetryActionClosed : N.symmetryAction
  conservationLawClosed : N.conservationLaw
  momentumMapClosed : N.momentumMap

def NoetherConservationClosed {V : VariationalAdmittedObject}
    {E : EulerLagrangePackage V} (N : NoetherConservationPackage E) : Prop :=
  N.symmetryAction ∧ N.conservationLaw ∧ N.momentumMap

theorem noether_conservation_closed_from_evidence
    {V : VariationalAdmittedObject} {E : EulerLagrangePackage V}
    (N : NoetherConservationPackage E) (Ev : NoetherConservationEvidence N) :
    NoetherConservationClosed N := by
  exact And.intro Ev.symmetryActionClosed (And.intro Ev.conservationLawClosed Ev.momentumMapClosed)

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse