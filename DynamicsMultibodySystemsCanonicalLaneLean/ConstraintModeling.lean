import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

inductive JointType
  | revolute
  | prismatic
  | spherical
  | fixed

structure Joint where
  name : String
  jointType : JointType
  parent : Body
  child : Body
  constraintEquations : List (Configuration → ℝ)

structure ConstraintSystem where
  joints : List Joint
  holonomic : List (Configuration → ℝ)
  nonholonomic : List (Configuration × ℝ³ → ℝ)

def holonomicVelocityConstraint (c : Configuration) (J : Joint) : ℝ :=
  J.constraintEquations.map (λ f => f c) |>.foldr (· + ·) 0

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse