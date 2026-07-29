import canonicalLaneMathlib.AdmissibleClass
import EarthScienceSeismologyCanonicalLaneLean.EarthScienceSeismologyDomain

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure ElasticWaveEquationPackage (G : SeismologySpace) where
  timeParameter : Type u
  displacementField : timeParameter -> Type v
  initialConditions : Prop
  waveEquation : Prop
  boundaryConditions : Prop
  uniqueness : Prop

structure ElasticWaveEquationEvidence {G : SeismologySpace}
    (F : ElasticWaveEquationPackage G) where
  initialConditionsClosed : F.initialConditions
  waveEquationClosed : F.waveEquation
  boundaryConditionsClosed : F.boundaryConditions
  uniquenessClosed : F.uniqueness

def ElasticWaveEquationClosed {G : SeismologySpace}
    (F : ElasticWaveEquationPackage G) : Prop :=
  F.initialConditions ∧ F.waveEquation ∧ F.boundaryConditions ∧ F.uniqueness

theorem elastic_wave_equation_closed_from_evidence
    {G : SeismologySpace} (F : ElasticWaveEquationPackage G)
    (E : ElasticWaveEquationEvidence F) : ElasticWaveEquationClosed F := by
  exact And.intro E.initialConditionsClosed
    (And.intro E.waveEquationClosed
      (And.intro E.boundaryConditionsClosed E.uniquenessClosed))

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse