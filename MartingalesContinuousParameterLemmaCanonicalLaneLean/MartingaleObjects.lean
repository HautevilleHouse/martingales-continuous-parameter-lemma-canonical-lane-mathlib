import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure MartingaleSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MartingaleAdmittedObject where
  space : MartingaleSpace
  filtration : Prop
  adaptedProcess : Prop
  continuousParameter : Prop
  martingaleProperty : Prop
  conclusion : martingaleProperty

structure MartingaleEndgameState where
  object : MartingaleAdmittedObject

def MartingaleWitnessClosed (O : MartingaleAdmittedObject) : Prop :=
  O.martingaleProperty

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse