import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure ConstraintJacobianPackage where
  constraintMatrix : Matrix (Fin n) (Fin m) ℝ
  nullSpaceBasis : List (Vector ℝ m)
  rankCondition : Prop
  integrabilityCondition : Prop

structure ConstraintJacobianEvidence (J : ConstraintJacobianPackage) where
  matrixNonZero : J.constraintMatrix ≠ 0
  nullSpaceBasisNonEmpty : J.nullSpaceBasis ≠ []
  rankConditionClosed : J.rankCondition
  integrabilityConditionClosed : J.integrabilityCondition

def ConstraintJacobianClosed (J : ConstraintJacobianPackage) : Prop :=
  J.constraintMatrix ≠ 0 ∧ J.nullSpaceBasis ≠ [] ∧ J.rankCondition ∧ J.integrabilityCondition

theorem constraint_jacobian_closed_from_evidence (J : ConstraintJacobianPackage) (E : ConstraintJacobianEvidence J) :
    ConstraintJacobianClosed J := by
  exact And.intro E.matrixNonZero (And.intro E.nullSpaceBasisNonEmpty (And.intro E.rankConditionClosed E.integrabilityConditionClosed))

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse