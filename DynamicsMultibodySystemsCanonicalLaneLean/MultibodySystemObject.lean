import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure MultibodySystemObject where
  carrier : Type
  topology : TopologicalSpace carrier
  stability : Prop

structure MultibodySystemObjectEvidence (M : MultibodySystemObject) where
  stabilityClosed : M.stability

def MultibodySystemStable (M : MultibodySystemObject) : Prop :=
  M.stability

theorem multibody_system_stable_from_evidence (M : MultibodySystemObject)
    (E : MultibodySystemObjectEvidence M) : MultibodySystemStable M := by
  exact E.stabilityClosed

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse