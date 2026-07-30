import canonicalLaneMathlib.AdmissibleClass

/-!
# Doob's Inequality Package
-/

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure DoobInequalityPackage {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    {M : ContinuousMartingalePackage Ω} where
  maximalInequality : Prop
  lpInequality : Prop
  upcrossingInequality : Prop

structure DoobInequalityEvidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    {M : ContinuousMartingalePackage Ω} (D : DoobInequalityPackage M) where
  maximalInequalityClosed : D.maximalInequality
  lpInequalityClosed : D.lpInequality
  upcrossingInequalityClosed : D.upcrossingInequality

def DoobInequalityClosed {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    {M : ContinuousMartingalePackage Ω} (D : DoobInequalityPackage M) : Prop :=
  D.maximalInequality ∧ D.lpInequality ∧ D.upcrossingInequality

theorem doob_inequality_closed_from_evidence
    {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    {M : ContinuousMartingalePackage Ω} (D : DoobInequalityPackage M)
    (E : DoobInequalityEvidence D) : DoobInequalityClosed D := by
  exact And.intro E.maximalInequalityClosed
    (And.intro E.lpInequalityClosed E.upcrossingInequalityClosed)

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse