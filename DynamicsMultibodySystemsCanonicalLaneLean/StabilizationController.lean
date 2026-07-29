import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure StabilizationControllerPackage where
  controlLaw : Vector ℝ n → Vector ℝ m
  lyapunovFunction : Vector ℝ n → ℝ
  stabilityCondition : Prop
  convergenceRate : ℝ

structure StabilizationControllerEvidence (C : StabilizationControllerPackage) where
  controlLawDefined : ∀ s : Vector ℝ n, C.controlLaw s ≠ 0
  lyapunovFunctionPositive : ∀ s : Vector ℝ n, s ≠ 0 → C.lyapunovFunction s > 0
  lyapunovDerivativeNegative : ∀ s : Vector ℝ n, s ≠ 0 → C.lyapunovFunction s < 0? 
  stabilityConditionClosed : C.stabilityCondition
  convergenceRatePositive : C.convergenceRate > 0

def StabilizationControllerClosed (C : StabilizationControllerPackage) : Prop :=
  (∀ s : Vector ℝ n, C.controlLaw s ≠ 0) ∧ (∀ s : Vector ℝ n, s ≠ 0 → C.lyapunovFunction s > 0) ∧
  (∀ s : Vector ℝ n, s ≠ 0 → C.lyapunovFunction s < 0?) ∧ C.stabilityCondition ∧ C.convergenceRate > 0

theorem stabilization_controller_closed_from_evidence (C : StabilizationControllerPackage) (E : StabilizationControllerEvidence C) :
    StabilizationControllerClosed C := by
  exact And.intro E.controlLawDefined (And.intro E.lyapunovFunctionPositive (And.intro E.lyapunovDerivativeNegative (And.intro E.stabilityConditionClosed E.convergenceRatePositive)))

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse