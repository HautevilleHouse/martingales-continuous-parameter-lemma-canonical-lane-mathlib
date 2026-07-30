import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

def ConstrainedMartingaleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_martingale_endgame (A : AdmissibleClass) :
    ConstrainedMartingaleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse