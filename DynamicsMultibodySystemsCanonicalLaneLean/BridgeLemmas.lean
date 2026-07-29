import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsMultibodySystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MultibodyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse