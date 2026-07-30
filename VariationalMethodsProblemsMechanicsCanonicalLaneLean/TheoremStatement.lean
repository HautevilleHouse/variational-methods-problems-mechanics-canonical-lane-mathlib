import canonicalLaneMathlib.AdmissibleClass
import VariationalMethodsProblemsMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsProblemsMechanicsCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "variational-methods-problems-mechanics-canonical-lane",
    theoremName := "variational-methods-problems-mechanics-canonical-lane",
    theoremObject := "Variational methods in mechanics: existence and regularity via direct method and saddle point theory",
    classicalBoundary := "classical PDE existence and regularity for nonlinear elasticity and plasticity models",
    manifoldConstrainedStatement := "manifold-constrained theorem certificate internalized through baseline gates, source constants, reviewer bridge, manifest hashes, and outside-constant dependency count",
    certificateLane := "manifold_constrained",
    carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
  }

end VariationalMethodsProblemsMechanicsCanonicalLaneLean
end HautevilleHouse