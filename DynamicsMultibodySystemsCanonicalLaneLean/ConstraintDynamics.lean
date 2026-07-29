import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure ConstraintDynamicsPackage where
  holonomicConstraints : Prop
  nonholonomicConstraints : Prop
  constraintForces : Prop
  lagrangeMultipliers : Prop
  constrainedEquations : Prop

structure ConstraintDynamicsEvidence (C : ConstraintDynamicsPackage) where
  holonomicConstraintsClosed : C.holonomicConstraints
  nonholonomicConstraintsClosed : C.nonholonomicConstraints
  constraintForcesClosed : C.constraintForces
  lagrangeMultipliersClosed : C.lagrangeMultipliers
  constrainedEquationsClosed : C.constrainedEquations

def ConstraintDynamicsClosed (C : ConstraintDynamicsPackage) : Prop :=
  C.holonomicConstraints ∧ C.nonholonomicConstraints ∧
  C.constraintForces ∧ C.lagrangeMultipliers ∧ C.constrainedEquations

theorem constraint_dynamics_closed_from_evidence (C : ConstraintDynamicsPackage)
    (E : ConstraintDynamicsEvidence C) : ConstraintDynamicsClosed C := by
  exact And.intro E.holonomicConstraintsClosed
    (And.intro E.nonholonomicConstraintsClosed
      (And.intro E.constraintForcesClosed
        (And.intro E.lagrangeMultipliersClosed E.constrainedEquationsClosed)))

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse