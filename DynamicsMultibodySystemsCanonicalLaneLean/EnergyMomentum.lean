import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure EnergyConservation where
  kineticEnergy : Float
  potentialEnergy : Float
  totalEnergy : Float
  conservation : Prop

structure EnergyConservationEvidence (E : EnergyConservation) where
  conservationClosed : E.conservation

def EnergyConservationClosed (E : EnergyConservation) : Prop :=
  E.conservation

theorem energy_conservation_closed_from_evidence (E : EnergyConservation)
    (Ev : EnergyConservationEvidence E) : EnergyConservationClosed E := by
  exact Ev.conservationClosed

structure MomentumConservation where
  linearMomentum : Float
  angularMomentum : Float
  conservation : Prop

structure MomentumConservationEvidence (M : MomentumConservation) where
  conservationClosed : M.conservation

def MomentumConservationClosed (M : MomentumConservation) : Prop :=
  M.conservation

theorem momentum_conservation_closed_from_evidence (M : MomentumConservation)
    (Ev : MomentumConservationEvidence M) : MomentumConservationClosed M := by
  exact Ev.conservationClosed

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse