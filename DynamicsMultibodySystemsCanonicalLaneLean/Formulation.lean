import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure Joint where
  jointType : String
  axis : String
  mobility : String
  constraints : Prop

def jointStability (j : Joint) : Prop := j.constraints

structure Link where
  linkType : String
  inertialFrame : String
  mass : Float
  inertiaTensor : Float

def linkStability (l : Link) : Prop := l.mass > 0

theorem joint_stability_preserved (j : Joint) : jointStability j := by
  exact j.constraints

theorem link_stability_preserved (l : Link) : linkStability l := by
  have h : l.mass > 0 := by simpa
  exact h

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse