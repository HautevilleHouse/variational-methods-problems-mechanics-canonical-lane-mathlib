import VariationalMethodsProblemsMechanicsCanonicalLaneLean.VariationalPDE

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure VariationalMethodsFoundation where
  admissibleObject : VariationalAdmittedObject
  eulerLagrange : EulerLagrangePackage admissibleObject
  eulerLagrangeEvidence : EulerLagrangeEvidence eulerLagrange
  noether : NoetherConservationPackage eulerLagrange
  noetherEvidence : NoetherConservationEvidence noether
  pde : VariationalPDEPackage admissibleObject
  pdeEvidence : VariationalPDEEvidence pde

def VariationalMethodsFoundationClosed (F : VariationalMethodsFoundation) : Prop :=
  EulerLagrangeClosed F.eulerLagrange ∧
  NoetherConservationClosed F.noether ∧
  VariationalPDEClosed F.pde

theorem variational_methods_foundation_closed_from_evidence
    (F : VariationalMethodsFoundation) : VariationalMethodsFoundationClosed F := by
  exact And.intro (euler_lagrange_closed_from_evidence F.eulerLagrange F.eulerLagrangeEvidence)
    (And.intro (noether_conservation_closed_from_evidence F.noether F.noetherEvidence)
      (variational_pde_closed_from_evidence F.pde F.pdeEvidence))

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse