import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure MultibodyAdmissibleClass where
  object : GeneralizedCoordinates
  forwardDynamicsValid : ForwardDynamicsClosed (ForwardDynamicsPackage.mk ...)
  stabilizationAchieved : StabilizationControllerClosed (StabilizationControllerPackage.mk ...)
  gateWitness : forwardDynamicsValid ∨ stabilizationAchieved

-- Assume appropriate mk functions are defined elsewhere

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse