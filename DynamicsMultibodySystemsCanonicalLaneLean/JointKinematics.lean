import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure JointKinematicsPackage where
  revoluteJointModel : Prop
  prismaticJointModel : Prop
  sphericalJointModel : Prop
  jointConstraints : Prop
  relativeMotionEquations : Prop

structure JointKinematicsEvidence (J : JointKinematicsPackage) where
  revoluteJointModelClosed : J.revoluteJointModel
  prismaticJointModelClosed : J.prismaticJointModel
  sphericalJointModelClosed : J.sphericalJointModel
  jointConstraintsClosed : J.jointConstraints
  relativeMotionEquationsClosed : J.relativeMotionEquations

def JointKinematicsClosed (J : JointKinematicsPackage) : Prop :=
  J.revoluteJointModel ∧ J.prismaticJointModel ∧ J.sphericalJointModel ∧
  J.jointConstraints ∧ J.relativeMotionEquations

theorem joint_kinematics_closed_from_evidence (J : JointKinematicsPackage)
    (E : JointKinematicsEvidence J) : JointKinematicsClosed J := by
  exact And.intro E.revoluteJointModelClosed
    (And.intro E.prismaticJointModelClosed
      (And.intro E.sphericalJointModelClosed
        (And.intro E.jointConstraintsClosed E.relativeMotionEquationsClosed)))

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse