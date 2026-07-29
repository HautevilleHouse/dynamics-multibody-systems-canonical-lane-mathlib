import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure MultibodySystem where
  bodies : List Body
  joints : List Joint
  topology : Graph

def graphAdjacency (s : MultibodySystem) : List (Body × Body) :=
  s.joints.map (λ j => (j.parent, j.child))

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse