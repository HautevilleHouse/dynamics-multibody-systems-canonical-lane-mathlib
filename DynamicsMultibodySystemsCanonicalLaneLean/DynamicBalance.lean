import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure DynamicBalancePackage where
  forceBalanceEquations : Prop
  torqueBalanceEquations : Prop
  equilibriumConditions : Prop
  gravityCompensation : Prop

structure DynamicBalanceEvidence (D : DynamicBalancePackage) where
  forceBalanceEquationsClosed : D.forceBalanceEquations
  torqueBalanceEquationsClosed : D.torqueBalanceEquations
  equilibriumConditionsClosed : D.equilibriumConditions
  gravityCompensationClosed : D.gravityCompensation

def DynamicBalanceClosed (D : DynamicBalancePackage) : Prop :=
  D.forceBalanceEquations ∧ D.torqueBalanceEquations ∧
  D.equilibriumConditions ∧ D.gravityCompensation

theorem dynamic_balance_closed_from_evidence (D : DynamicBalancePackage)
    (E : DynamicBalanceEvidence D) : DynamicBalanceClosed D := by
  exact And.intro E.forceBalanceEquationsClosed
    (And.intro E.torqueBalanceEquationsClosed
      (And.intro E.equilibriumConditionsClosed E.gravityCompensationClosed))

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse