import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure FiniteElementConvergencePackage (P : VariationalProblem) where
  conformingDiscretization : Type u
  refinementFamily : Type v
  aPrioriEstimate : Prop
  convergenceRate : Prop
  numericalStability : Prop

structure FiniteElementConvergenceEvidence {P : VariationalProblem}
    (F : FiniteElementConvergencePackage P) where
  discretizationConforming : Nonempty F.conformingDiscretization
  refinementFamilyFiltered : Nonempty F.refinementFamily
  aPrioriEstimateClosed : F.aPrioriEstimate
  convergenceRateClosed : F.convergenceRate
  numericalStabilityClosed : F.numericalStability

structure FiniteElementConvergenceClosed {P : VariationalProblem}
    (F : FiniteElementConvergencePackage P) : Prop := mk_FiniteElementConvergenceClosed
  (discretizationNonempty : Nonempty F.conformingDiscretization)
  (refinementFamilyNonempty : Nonempty F.refinementFamily)
  (aPrioriEstimate : F.aPrioriEstimate)
  (convergenceRate : F.convergenceRate)
  (numericalStability : F.numericalStability)

theorem finite_element_convergence_closed_from_evidence
    {P : VariationalProblem} (F : FiniteElementConvergencePackage P)
    (Ev : FiniteElementConvergenceEvidence F) : FiniteElementConvergenceClosed F := by
  exact { discretizationNonempty := Ev.discretizationConforming
       , refinementFamilyNonempty := Ev.refinementFamilyFiltered
       , aPrioriEstimate := Ev.aPrioriEstimateClosed
       , convergenceRate := Ev.convergenceRateClosed
       , numericalStability := Ev.numericalStabilityClosed }

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse
