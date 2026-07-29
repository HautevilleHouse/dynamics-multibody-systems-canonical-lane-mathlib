import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure ForwardDynamicsPackage where
  massMatrix : Matrix (Fin n) (Fin n) ℝ
  coriolisVector : Vector ℝ n
  gravityVector : Vector ℝ n
  appliedForces : Vector ℝ n
  accelerationSolution : Vector ℝ n
  existenceUniqueness : Prop

structure ForwardDynamicsEvidence (F : ForwardDynamicsPackage) where
  massMatrixInvertible : F.massMatrix.det ≠ 0
  coriolisDefined : F.coriolisVector ≠ 0
  gravityDefined : F.gravityVector ≠ 0
  appliedDefined : F.appliedForces ≠ 0
  accelerationSolutionClosed : F.accelerationSolution = (F.massMatrix)⁻¹ • (F.appliedForces - F.coriolisVector - F.gravityVector)
  existenceUniquenessClosed : F.existenceUniqueness

def ForwardDynamicsClosed (F : ForwardDynamicsPackage) : Prop :=
  F.massMatrix.det ≠ 0 ∧ F.coriolisVector ≠ 0 ∧ F.gravityVector ≠ 0 ∧ F.appliedForces ≠ 0 ∧
  F.accelerationSolution = (F.massMatrix)⁻¹ • (F.appliedForces - F.coriolisVector - F.gravityVector) ∧ F.existenceUniqueness

theorem forward_dynamics_closed_from_evidence (F : ForwardDynamicsPackage) (E : ForwardDynamicsEvidence F) :
    ForwardDynamicsClosed F := by
  exact And.intro E.massMatrixInvertible (And.intro E.coriolisDefined (And.intro E.gravityDefined (And.intro E.appliedDefined (And.intro E.accelerationSolutionClosed E.existenceUniquenessClosed))))

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse