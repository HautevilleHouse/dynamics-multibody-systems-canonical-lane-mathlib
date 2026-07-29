import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsCanonicalLaneLean

structure TimeSteppingScheme where
  dt : ℝ
  updateRule : Configuration → Configuration

structure IntegratorState where
  currentTime : ℝ
  currentConfig : Configuration
  previousConfigs : List Configuration

def explicitEulerStep (f : Configuration → Configuration) (x : Configuration) (h : ℝ) : Configuration :=
  x + h • (f x - x)

def rungeKutta4 (f : Configuration → Configuration) (x : Configuration) (h : ℝ) : Configuration :=
  let k1 := f x
  let k2 := f (x + (h/2) • (k1 - x))
  let k3 := f (x + (h/2) • (k2 - x))
  let k4 := f (x + h • (k3 - x))
  x + (h/6) • (k1 + 2•k2 + 2•k3 + k4 - 6•x)

end DynamicsMultibodySystemsCanonicalLaneLean
end HautevilleHouse