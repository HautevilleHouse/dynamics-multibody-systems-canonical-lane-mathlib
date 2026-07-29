import HautevilleHouse.DynamicsMultibodySystemsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

def ConstrainedMultibodyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_multibody_endgame (A : AdmissibleClass) :
    ConstrainedMultibodyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse