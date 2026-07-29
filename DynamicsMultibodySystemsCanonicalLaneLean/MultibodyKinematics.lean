import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure MultibodyKinematicsPackage where
  numBodies : Nat
  jointConfiguration : Type u
  positionVectors : jointConfiguration → Vector ℝ numBodies
  velocityVectors : jointConfiguration → Vector ℝ numBodies
  accelerationVectors : jointConfiguration → Vector ℝ numBodies
  positionSmooth : Prop
  velocityConsistent : Prop
  accelerationConsistent : Prop

structure MultibodyKinematicsEvidence (K : MultibodyKinematicsPackage) where
  positionSmoothClosed : K.positionSmooth
  velocityConsistentClosed : K.velocityConsistent
  accelerationConsistentClosed : K.accelerationConsistent

def MultibodyKinematicsClosed (K : MultibodyKinematicsPackage) : Prop :=
  K.positionSmooth ∧ K.velocityConsistent ∧ K.accelerationConsistent

theorem multibody_kinematics_closed_from_evidence
    (K : MultibodyKinematicsPackage) (E : MultibodyKinematicsEvidence K) :
    MultibodyKinematicsClosed K := by
  exact And.intro E.positionSmoothClosed
    (And.intro E.velocityConsistentClosed E.accelerationConsistentClosed)

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse