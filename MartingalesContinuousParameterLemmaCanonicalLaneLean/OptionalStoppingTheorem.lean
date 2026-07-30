import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesContinuousParameterLemmaCanonicalLaneLean.MartingaleAdmissibleClass

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure OptionalStoppingPackage where
  process : MartingaleAdmittedObject
  stoppingTimes : Type
  stoppedProcessIsMartingale : Prop
  optionalStoppingIdentity : Prop

structure OptionalStoppingEvidence (P : OptionalStoppingPackage) where
  stoppedProcessIsMartingaleClosed : P.stoppedProcessIsMartingale
  optionalStoppingIdentityClosed : P.optionalStoppingIdentity

def OptionalStoppingClosed (P : OptionalStoppingPackage) : Prop :=
  P.stoppedProcessIsMartingale ∧ P.optionalStoppingIdentity

theorem optional_stopping_closed_from_evidence (P : OptionalStoppingPackage) (E : OptionalStoppingEvidence P) :
    OptionalStoppingClosed P := by
  exact And.intro E.stoppedProcessIsMartingaleClosed E.optionalStoppingIdentityClosed

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse
