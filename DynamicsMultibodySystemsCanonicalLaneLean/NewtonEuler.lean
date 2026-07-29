import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure NewtonEulerEquations where
  massMatrix : Type
  forceVector : Type
  accelerationVector : Type
  equationsClosed : Prop

structure NewtonEulerEvidence (N : NewtonEulerEquations) where
  equationsClosed : N.equationsClosed

def NewtonEulerClosed (N : NewtonEulerEquations) : Prop :=
  N.equationsClosed

theorem newton_euler_closed_from_evidence (N : NewtonEulerEquations)
    (E : NewtonEulerEvidence N) : NewtonEulerClosed N := by
  exact E.equationsClosed

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse