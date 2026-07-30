import canonicalLaneMathlib.QuadraticVariation

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure QuadraticVariationPackage (M : MartingaleAdmittedObject) where
  variationProcess : Type u
  existsInProbability : Prop
  doobMeyerDecomposition : Prop
  continuityAdapted : Prop
  existsInProbabilityClosed : existsInProbability
  doobMeyerDecompositionClosed : doobMeyerDecomposition
  continuityAdaptedClosed : continuityAdapted

structure QuadraticVariationEvidence {M : MartingaleAdmittedObject} (Q : QuadraticVariationPackage M) where
  existsInProbabilityClosed : Q.existsInProbability
  doobMeyerDecompositionClosed : Q.doobMeyerDecomposition
  continuityAdaptedClosed : Q.continuityAdapted

def QuadraticVariationClosed {M : MartingaleAdmittedObject} (Q : QuadraticVariationPackage M) : Prop :=
  Q.existsInProbability ∧ Q.doobMeyerDecomposition ∧ Q.continuityAdapted

theorem quadratic_variation_closed_from_evidence {M : MartingaleAdmittedObject} (Q : QuadraticVariationPackage M) (E : QuadraticVariationEvidence Q) :
    QuadraticVariationClosed Q := by
  exact And.intro E.existsInProbabilityClosed (And.intro E.doobMeyerDecompositionClosed E.continuityAdaptedClosed)

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse