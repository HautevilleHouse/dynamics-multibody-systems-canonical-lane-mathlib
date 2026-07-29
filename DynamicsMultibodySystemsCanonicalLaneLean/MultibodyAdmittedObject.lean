import HautevilleHouse.DynamicsMultibodySystemsCanonicalLaneLean.NumericalIntegration

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure MultibodyAdmittedObject where
  kinematics : MultibodyKinematics
  equations : EquationsOfMotionPackage kinematics
  stabilization : ConstraintStabilizationPackage equations
  integration : NumericalIntegrationPackage stabilization
  allClosed : MultibodyKinematicsClosed kinematics ∧
             EquationsOfMotionClosed equations ∧
             ConstraintStabilizationClosed stabilization ∧
             NumericalIntegrationClosed integration
  conclusion : Prop

def MultibodyWitnessClosed (O : MultibodyAdmittedObject) : Prop :=
  O.conclusion

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse