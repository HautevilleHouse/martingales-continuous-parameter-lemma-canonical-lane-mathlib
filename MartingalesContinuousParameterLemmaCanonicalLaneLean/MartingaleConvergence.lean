import canonicalLaneMathlib.MartingaleConvergence

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure MartingaleConvergencePackage (M : MartingaleAdmittedObject) where
  almostSureConvergence : Prop
  L1Convergence : Prop
  uniformIntegrability : Prop
  upcrossingInequality : Prop
  almostSureConvergenceClosed : almostSureConvergence
  L1ConvergenceClosed : L1Convergence
  uniformIntegrabilityClosed : uniformIntegrability
  upcrossingInequalityClosed : upcrossingInequality

structure MartingaleConvergenceEvidence {M : MartingaleAdmittedObject} (C : MartingaleConvergencePackage M) where
  almostSureConvergenceClosed : C.almostSureConvergence
  L1ConvergenceClosed : C.L1Convergence
  uniformIntegrabilityClosed : C.uniformIntegrability
  upcrossingInequalityClosed : C.upcrossingInequality

def MartingaleConvergenceClosed {M : MartingaleAdmittedObject} (C : MartingaleConvergencePackage M) : Prop :=
  C.almostSureConvergence ∧ C.L1Convergence ∧ C.uniformIntegrability ∧ C.upcrossingInequality

theorem martingale_convergence_closed_from_evidence {M : MartingaleAdmittedObject} (C : MartingaleConvergencePackage M) (E : MartingaleConvergenceEvidence C) :
    MartingaleConvergenceClosed C := by
  exact And.intro E.almostSureConvergenceClosed (And.intro E.L1ConvergenceClosed (And.intro E.uniformIntegrabilityClosed E.upcrossingInequalityClosed))

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse