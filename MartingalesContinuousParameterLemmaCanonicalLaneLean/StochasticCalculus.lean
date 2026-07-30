import MartingalesContinuousParameterLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure StochasticIntegralPackage where
  integrandSpace : Type u
  integratorProcess : Type v
  integralDefined : Prop
  itoIsometry : Prop
  martingaleRepresentation : Prop

structure StochasticIntegralEvidence (S : StochasticIntegralPackage) where
  integralDefinedClosed : S.integralDefined
  itoIsometryClosed : S.itoIsometry
  martingaleRepresentationClosed : S.martingaleRepresentation

def StochasticIntegralClosed (S : StochasticIntegralPackage) : Prop :=
  S.integralDefined ∧ S.itoIsometry ∧ S.martingaleRepresentation

theorem stochastic_integral_closed_from_evidence (S : StochasticIntegralPackage)
    (E : StochasticIntegralEvidence S) : StochasticIntegralClosed S := by
  exact And.intro E.integralDefinedClosed
    (And.intro E.itoIsometryClosed E.martingaleRepresentationClosed)

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse