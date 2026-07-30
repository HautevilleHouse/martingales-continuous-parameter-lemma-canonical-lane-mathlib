import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

def gateClosed (A : MartingaleAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MartingaleAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse
