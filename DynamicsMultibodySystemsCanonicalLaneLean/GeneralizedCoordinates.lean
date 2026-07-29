import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure GeneralizedCoordinates where
  jointAngles : List ℝ
  positionVectors : List (ℝ × ℝ × ℝ)
  velocityVectors : List (ℝ × ℝ × ℝ)
  constraintsSatisfied : Prop

structure GeneralizedCoordinatesEvidence (G : GeneralizedCoordinates) where
  jointAnglesDefined : G.jointAngles ≠ []
  positionVectorsDefined : G.positionVectors ≠ []
  velocityVectorsDefined : G.velocityVectors ≠ []
  constraintsSatisfiedClosed : G.constraintsSatisfied

def GeneralizedCoordinatesClosed (G : GeneralizedCoordinates) : Prop :=
  G.jointAngles ≠ [] ∧ G.positionVectors ≠ [] ∧ G.velocityVectors ≠ [] ∧ G.constraintsSatisfied

theorem generalized_coordinates_closed_from_evidence (G : GeneralizedCoordinates) (E : GeneralizedCoordinatesEvidence G) :
    GeneralizedCoordinatesClosed G := by
  exact And.intro E.jointAnglesDefined (And.intro E.positionVectorsDefined (And.intro E.velocityVectorsDefined E.constraintsSatisfiedClosed))

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse