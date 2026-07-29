import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure RigidBodyKinematicsPackage where
  rotationMatrix : Prop
  quaternionRepresentation : Prop
  angularVelocity : Prop
  forwardKinematics : Prop
  velocityPropagation : Prop

structure RigidBodyKinematicsEvidence (R : RigidBodyKinematicsPackage) where
  rotationMatrixClosed : R.rotationMatrix
  quaternionRepresentationClosed : R.quaternionRepresentation
  angularVelocityClosed : R.angularVelocity
  forwardKinematicsClosed : R.forwardKinematics
  velocityPropagationClosed : R.velocityPropagation

def RigidBodyKinematicsClosed (R : RigidBodyKinematicsPackage) : Prop :=
  R.rotationMatrix ∧ R.quaternionRepresentation ∧
  R.angularVelocity ∧ R.forwardKinematics ∧ R.velocityPropagation

theorem rigid_body_kinematics_closed_from_evidence
    (R : RigidBodyKinematicsPackage)
    (E : RigidBodyKinematicsEvidence R) : RigidBodyKinematicsClosed R := by
  exact And.intro E.rotationMatrixClosed
    (And.intro E.quaternionRepresentationClosed
      (And.intro E.angularVelocityClosed
        (And.intro E.forwardKinematicsClosed E.velocityPropagationClosed)))

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse