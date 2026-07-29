import HautevilleHouse.DynamicsMultibodySystemsCanonicalLaneLean.EquationsOfMotion

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure ConstraintStabilizationPackage {M : MultibodyKinematics} (E : EquationsOfMotionPackage M) where
  baumgarteParameters : Prop
  constraintDrift : Prop
  stabilizationMethod : String
  driftBounded : Prop
  asymptoticStability : Prop

def ConstraintStabilizationClosed {M : MultibodyKinematics} {E : EquationsOfMotionPackage M} (C : ConstraintStabilizationPackage E) : Prop :=
  C.driftBounded ∧ C.asymptoticStability

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse