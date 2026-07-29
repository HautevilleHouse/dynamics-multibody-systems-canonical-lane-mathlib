import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure NewtonEulerEquationsPackage where
  bodyMass : Vector ℝ numBodies
  inertiaMatrix : Matrix ℝ numBodies numBodies
  appliedForces : Vector ℝ numBodies
  appliedTorques : Vector ℝ numBodies
  linearAccelerations : Vector ℝ numBodies
  angularAccelerations : Vector ℝ numBodies
  newtonEulerLaws : Prop
  forceBalance : Prop
  torqueBalance : Prop
  numBodies : Nat

structure NewtonEulerEquationsEvidence (N : NewtonEulerEquationsPackage) where
  newtonEulerLawsClosed : N.newtonEulerLaws
  forceBalanceClosed : N.forceBalance
  torqueBalanceClosed : N.torqueBalance

def NewtonEulerEquationsClosed (N : NewtonEulerEquationsPackage) : Prop :=
  N.newtonEulerLaws ∧ N.forceBalance ∧ N.torqueBalance

theorem newton_euler_equations_closed_from_evidence
    (N : NewtonEulerEquationsPackage) (E : NewtonEulerEquationsEvidence N) :
    NewtonEulerEquationsClosed N := by
  exact And.intro E.newtonEulerLawsClosed
    (And.intro E.forceBalanceClosed E.torqueBalanceClosed)

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse