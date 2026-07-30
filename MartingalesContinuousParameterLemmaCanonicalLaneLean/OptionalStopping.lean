import canonicalLaneMathlib.AdmissibleClass

/-!
# Optional Stopping Package
-/

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure OptionalStoppingPackage {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    {M : ContinuousMartingalePackage Ω} where
  stoppingTime : MeasureTheory.StoppingTime M.filtration
  boundedCondition : Prop
  stoppedProcess : ℕ → Ω → ℝ
  optionalStoppingTheorem : Prop

structure OptionalStoppingEvidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    {M : ContinuousMartingalePackage Ω} (O : OptionalStoppingPackage M) where
  boundedConditionClosed : O.boundedCondition
  stoppedProcessClosed : O.stoppedProcess = (λ n ω => M.process (O.stoppingTime ω ∧ n) ω)
  optionalStoppingTheoremClosed : O.optionalStoppingTheorem

def OptionalStoppingClosed {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    {M : ContinuousMartingalePackage Ω} (O : OptionalStoppingPackage M) : Prop :=
  O.boundedCondition ∧ O.optionalStoppingTheorem

theorem optional_stopping_closed_from_evidence
    {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    {M : ContinuousMartingalePackage Ω} (O : OptionalStoppingPackage M)
    (E : OptionalStoppingEvidence O) : OptionalStoppingClosed O := by
  exact And.intro E.boundedConditionClosed E.optionalStoppingTheoremClosed

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse