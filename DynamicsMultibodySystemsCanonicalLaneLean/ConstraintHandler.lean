import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure ConstraintHandlerPackage where
  holonomicConstraints : List (Vector ℝ numBodies → ℝ)
  nonholonomicConstraints : List (Vector ℝ numBodies → ℝ)
  constraintJacobian : Matrix ℝ numBodies numConstraints
  constraintForces : Vector ℝ numConstraints
  constraintSatisfied : Prop
  constraintForceDerived : Prop
  numBodies : Nat
  numConstraints : Nat

structure ConstraintHandlerEvidence (C : ConstraintHandlerPackage) where
  constraintSatisfiedClosed : C.constraintSatisfied
  constraintForceDerivedClosed : C.constraintForceDerived

def ConstraintHandlerClosed (C : ConstraintHandlerPackage) : Prop :=
  C.constraintSatisfied ∧ C.constraintForceDerived

theorem constraint_handler_closed_from_evidence
    (C : ConstraintHandlerPackage) (E : ConstraintHandlerEvidence C) :
    ConstraintHandlerClosed C := by
  exact And.intro E.constraintSatisfiedClosed E.constraintForceDerivedClosed

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse