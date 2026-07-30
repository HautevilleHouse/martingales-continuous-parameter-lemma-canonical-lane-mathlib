import canonicalLaneMathlib.BridgeLemmas

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MartingaleWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse