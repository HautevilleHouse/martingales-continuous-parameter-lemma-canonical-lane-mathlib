import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesContinuousParameterLemmaCanonicalLaneLean.MartingaleAdmissibleClass

namespace HautevilleHouse
namespace MartingalesContinuousParameterLemmaCanonicalLaneLean

structure DoobInequalityPackage where
  process : MartingaleAdmittedObject
  maxInequality : Prop
  lpInequality : Prop
  maximalFunctionWellDefined : Prop

structure DoobInequalityEvidence (P : DoobInequalityPackage) where
  maxInequalityClosed : P.maxInequality
  lpInequalityClosed : P.lpInequality
  maximalFunctionWellDefinedClosed : P.maximalFunctionWellDefined

def DoobInequalityClosed (P : DoobInequalityPackage) : Prop :=
  P.maxInequality ∧ P.lpInequality ∧ P.maximalFunctionWellDefined

theorem doob_inequality_closed_from_evidence (P : DoobInequalityPackage) (E : DoobInequalityEvidence P) :
    DoobInequalityClosed P := by
  exact And.intro E.maxInequalityClosed (And.intro E.lpInequalityClosed E.maximalFunctionWellDefinedClosed)

end MartingalesContinuousParameterLemmaCanonicalLaneLean
end HautevilleHouse
