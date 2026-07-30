import canonicalLaneMathlib.AdmissibleClass

/-!
# Continuous Martingale Structure Package
-/

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure ContinuousMartingalePackage {Ω : Type u} [MeasureTheory.MeasureSpace Ω] where
  filtration : MeasureTheory.Filtration ℕ Ω
  process : ℕ → Ω → ℝ
  adapted : MeasureTheory.Adapted filtration process
  integrable : ∀ n, MeasureTheory.Integrable (process n)
  martingaleProperty : ∀ n m, n ≤ m → (∀ ω, process n ω = (process m | filtration n) ω)

structure ContinuousMartingaleEvidence {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    (M : ContinuousMartingalePackage Ω) where
  adaptedClosed : M.adapted
  integrableClosed : M.integrable
  martingalePropertyClosed : M.martingaleProperty

def ContinuousMartingaleClosed {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    (M : ContinuousMartingalePackage Ω) : Prop :=
  M.adapted ∧ M.integrable ∧ M.martingaleProperty

theorem continuous_martingale_closed_from_evidence
    {Ω : Type u} [MeasureTheory.MeasureSpace Ω]
    (M : ContinuousMartingalePackage Ω) (E : ContinuousMartingaleEvidence M) :
    ContinuousMartingaleClosed M := by
  exact And.intro E.adaptedClosed (And.intro E.integrableClosed E.martingalePropertyClosed)

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse