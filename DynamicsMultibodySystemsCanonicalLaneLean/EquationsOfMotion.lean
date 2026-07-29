import HautevilleHouse.DynamicsMultibodySystemsCanonicalLaneLean.MultibodyKinematics

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure EquationsOfMotionPackage (M : MultibodyKinematics) where
  massMatrix : Type
  forceVector : Type
  constraintJacobian : Type
  generalizedCoordinates : Type
  kineticEnergyExpression : Prop
  lagrangeEquations : Prop
  constraintForces : Prop

def EquationsOfMotionClosed {M : MultibodyKinematics} (E : EquationsOfMotionPackage M) : Prop :=
  E.kineticEnergyExpression ∧ E.lagrangeEquations ∧ E.constraintForces

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse