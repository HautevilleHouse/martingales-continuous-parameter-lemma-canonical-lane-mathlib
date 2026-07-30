import canonicalLaneMathlib.ItoCalculus

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure ItoIntegralPackage (M : MartingaleAdmittedObject) where
  integrandSpace : Type u
  integralDefined : Prop
  isometryProperty : Prop
  martingalePreservation : Prop
  integralDefinedClosed : integralDefined
  isometryPropertyClosed : isometryProperty
  martingalePreservationClosed : martingalePreservation

structure ItoIntegralEvidence {M : MartingaleAdmittedObject} (I : ItoIntegralPackage M) where
  integralDefinedClosed : I.integralDefined
  isometryPropertyClosed : I.isometryProperty
  martingalePreservationClosed : I.martingalePreservation

def ItoIntegralClosed {M : MartingaleAdmittedObject} (I : ItoIntegralPackage M) : Prop :=
  I.integralDefined ∧ I.isometryProperty ∧ I.martingalePreservation

theorem ito_integral_closed_from_evidence {M : MartingaleAdmittedObject} (I : ItoIntegralPackage M) (E : ItoIntegralEvidence I) :
    ItoIntegralClosed I := by
  exact And.intro E.integralDefinedClosed (And.intro E.isometryPropertyClosed E.martingalePreservationClosed)

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse