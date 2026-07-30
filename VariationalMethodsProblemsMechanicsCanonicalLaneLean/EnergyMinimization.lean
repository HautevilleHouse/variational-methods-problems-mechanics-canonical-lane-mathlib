import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure EnergyMinimizationPackage (P : VariationalProblem) where
  candidateSolution : P.admissibleDisplacements
  secondVariationPositive : Prop
  convexityDomain : Prop
  stressTensorField : Type u

structure EnergyMinimizationEvidence {P : VariationalProblem} (E : EnergyMinimizationPackage P) where
  candidateAdmissible : P.boundaryConditions E.candidateSolution
  secondVariationPositiveClosed : E.secondVariationPositive
  convexityDomainClosed : E.convexityDomain
  stressTensorFieldDefined : Nonempty E.stressTensorField

structure EnergyMinimizationClosed {P : VariationalProblem} (E : EnergyMinimizationPackage P) : Prop := mk_EnergyMinimizationClosed
  (candidateAdmissible : P.boundaryConditions E.candidateSolution)
  (secondVariationPositive : E.secondVariationPositive)
  (convexityDomain : E.convexityDomain)
  (stressTensorFieldNonempty : Nonempty E.stressTensorField)

theorem energy_minimization_closed_from_evidence
    {P : VariationalProblem} (E : EnergyMinimizationPackage P)
    (Ev : EnergyMinimizationEvidence E) : EnergyMinimizationClosed E := by
  exact { candidateAdmissible := Ev.candidateAdmissible
       , secondVariationPositive := Ev.secondVariationPositiveClosed
       , convexityDomain := Ev.convexityDomainClosed
       , stressTensorFieldNonempty := Ev.stressTensorFieldDefined }

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse
