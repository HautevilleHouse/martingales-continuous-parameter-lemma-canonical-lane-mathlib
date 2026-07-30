import MartingalesContinuousParameterLemmaCanonicalLaneLean.StochasticCalculus

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure ContinuousParameterLemmaPackage (A : AdmissibleClass) where
  filtration : Filtration
  quadraticVariation : Prop
  crossVariation : Prop
  doobMeyerDecomposition : Prop
  itoFormulaApplied : Prop

structure ContinuousParameterLemmaEvidence (A : AdmissibleClass) (P : ContinuousParameterLemmaPackage A) where
  quadraticVariationClosed : P.quadraticVariation
  crossVariationClosed : P.crossVariation
  doobMeyerDecompositionClosed : P.doobMeyerDecomposition
  itoFormulaAppliedClosed : P.itoFormulaApplied

def ContinuousParameterLemmaClosed (A : AdmissibleClass) (P : ContinuousParameterLemmaPackage A) : Prop :=
  P.quadraticVariation ∧ P.crossVariation ∧ P.doobMeyerDecomposition ∧ P.itoFormulaApplied

theorem continuous_parameter_lemma_closed_from_evidence (A : AdmissibleClass)
    (P : ContinuousParameterLemmaPackage A) (E : ContinuousParameterLemmaEvidence A P) :
    ContinuousParameterLemmaClosed A P := by
  exact And.intro E.quadraticVariationClosed
    (And.intro E.crossVariationClosed
      (And.intro E.doobMeyerDecompositionClosed E.itoFormulaAppliedClosed))

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse