import canonicalLaneMathlib.StoppingTime

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure StoppingTimePackage (M : MartingaleAdmittedObject) where
  stoppingTimeFamily : Type u
  optionalSampling : Prop
  continuityProperty : Prop
  samplingPreservesMartingale : Prop
  optionalSamplingClosed : optionalSampling
  continuityPropertyClosed : continuityProperty
  samplingPreservesMartingaleClosed : samplingPreservesMartingale

structure StoppingTimeEvidence {M : MartingaleAdmittedObject} (S : StoppingTimePackage M) where
  optionalSamplingClosed : S.optionalSampling
  continuityPropertyClosed : S.continuityProperty
  samplingPreservesMartingaleClosed : S.samplingPreservesMartingale

def StoppingTimeClosed {M : MartingaleAdmittedObject} (S : StoppingTimePackage M) : Prop :=
  S.optionalSampling ∧ S.continuityProperty ∧ S.samplingPreservesMartingale

theorem stopping_time_closed_from_evidence {M : MartingaleAdmittedObject} (S : StoppingTimePackage M) (E : StoppingTimeEvidence S) :
    StoppingTimeClosed S := by
  exact And.intro E.optionalSamplingClosed (And.intro E.continuityPropertyClosed E.samplingPreservesMartingaleClosed)

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse