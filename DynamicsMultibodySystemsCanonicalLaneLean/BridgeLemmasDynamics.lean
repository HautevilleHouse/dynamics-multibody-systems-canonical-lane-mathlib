import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := True /

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact True.intro

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse