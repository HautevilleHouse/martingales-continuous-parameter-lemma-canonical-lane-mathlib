import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure MartingaleAdmittedObject where
  carrier : Type
  sigmaAlgebra : MeasurableSpace carrier
  filtration : Filtration carrier
  adapted : Adapted filtration (id : carrier → carrier)
  integrable : Prop
  martingaleProperty : ∀ (s t : ℝ), s ≤ t → conditionalExpectation (id : carrier → ℝ) (filtration.σ s) = (id : carrier → ℝ)

-- AdmissibleClass wrapping the martingale admitted object
structure MartingaleAdmissibleClass where
  object : MartingaleAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse
