import VariationalMethodsProblemsMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure MountainPassPackage (A : AdmissibleClass) where
  functional : A.object.functional
  satisfiesPalaisSmale : Prop
  hasTwoLocalMinima : Prop
  mountainPassGeometry : Prop
  criticalPointExists : Prop
  linkingStructure : Prop

structure MountainPassEvidence (A : AdmissibleClass) (MP : MountainPassPackage A) where
  satisfiesPalaisSmaleClosed : MP.satisfiesPalaisSmale
  hasTwoLocalMinimaClosed : MP.hasTwoLocalMinima
  mountainPassGeometryClosed : MP.mountainPassGeometry
  criticalPointExistsClosed : MP.criticalPointExists

def MountainPassClosed (A : AdmissibleClass) (MP : MountainPassPackage A) : Prop :=
  MP.satisfiesPalaisSmale ∧ MP.hasTwoLocalMinima ∧ MP.mountainPassGeometry ∧ MP.criticalPointExists ∧ MP.linkingStructure

theorem mountain_pass_closed_from_evidence (A : AdmissibleClass) (MP : MountainPassPackage A) (Ev : MountainPassEvidence A MP) :
    MountainPassClosed A MP := by
  exact And.intro Ev.satisfiesPalaisSmaleClosed (And.intro Ev.hasTwoLocalMinimaClosed (And.intro Ev.mountainPassGeometryClosed Ev.criticalPointExistsClosed))

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse
