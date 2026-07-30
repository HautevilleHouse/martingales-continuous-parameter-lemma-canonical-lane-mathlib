import Mathlib.Probability.Process

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure Filtration where
  time : Set ℝ
  sigmaAlgebras : ℝ → Type u
  filtrationProperty : Prop

structure AdapatedProcess (Ω : Type u) [inst : MeasureTheory.MeasureSpace Ω] where
  filtration : Filtration
  process : ℝ → Ω → ℝ
  adapted : Prop

structure MartingaleObject (Ω : Type u) [inst : MeasureTheory.MeasureSpace Ω] where
  adaptedProcess : AdapatedProcess Ω
  integrable : Prop
  martingaleProperty : Prop

structure MartingaleAdmittedObject where
  space : Type u
  measureSpace : MeasureTheory.MeasureSpace space
  martingale : MartingaleObject space
  conclusion : martingale.martingaleProperty

def MartingaleWitnessClosed (O : MartingaleAdmittedObject) : Prop :=
  O.conclusion

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse