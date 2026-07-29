import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure EnergyFunctions where
  kinetic : Configuration → ℝ
  potential : Configuration → ℝ
  total : Configuration → ℝ :=
    λ c => kinetic c + potential c

structure Momentum where
  linear : ℝ³
  angular : ℝ³

def kineticEnergy (bodies : List RigidBody) (config : Configuration) : ℝ :=
  bodies.foldl (λ acc b =>
    let v := b.linearVelocity
    let ω := b.angularVelocity
    acc + 0.5 * b.mass * (v · v) + 0.5 * (b.inertia • ω) · ω) 0

def potentialEnergy (bodies : List RigidBody) (gravity : ℝ³) : ℝ :=
  bodies.foldl (λ acc b => acc + b.mass * (gravity · b.position)) 0

theorem energyConservation (f : MultibodySystem) (isolated : Prop) (h : isolated) :
  (λ t => (kineticEnergy f.bodies (f.config t)) + (potentialEnergy f.bodies (gravityVector f))) = const ℝ := by
  sorry

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse