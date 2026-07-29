import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure LagrangeEquationsPackage where
  generalizedCoordinates : Prop
  kineticEnergyExpression : Prop
  potentialEnergyExpression : Prop
  lagrangianDerivation : Prop
  equationsOfMotion : Prop

structure LagrangeEquationsEvidence (L : LagrangeEquationsPackage) where
  generalizedCoordinatesClosed : L.generalizedCoordinates
  kineticEnergyExpressionClosed : L.kineticEnergyExpression
  potentialEnergyExpressionClosed : L.potentialEnergyExpression
  lagrangianDerivationClosed : L.lagrangianDerivation
  equationsOfMotionClosed : L.equationsOfMotion

def LagrangeEquationsClosed (L : LagrangeEquationsPackage) : Prop :=
  L.generalizedCoordinates ∧ L.kineticEnergyExpression ∧
  L.potentialEnergyExpression ∧ L.lagrangianDerivation ∧ L.equationsOfMotion

theorem lagrange_equations_closed_from_evidence (L : LagrangeEquationsPackage)
    (E : LagrangeEquationsEvidence L) : LagrangeEquationsClosed L := by
  exact And.intro E.generalizedCoordinatesClosed
    (And.intro E.kineticEnergyExpressionClosed
      (And.intro E.potentialEnergyExpressionClosed
        (And.intro E.lagrangianDerivationClosed E.equationsOfMotionClosed)))

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse