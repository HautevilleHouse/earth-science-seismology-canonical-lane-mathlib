import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure SeismicWavePropagationPackage where
  waveType : Type
  elastodynamicEquation : Prop
  initialConditions : Prop
  boundaryConditions : Prop
  solutionUniqueness : Prop
  finiteSpeedPropagation : Prop

structure SeismicWavePropagationEvidence (P : SeismicWavePropagationPackage) where
  elastodynamicEquationClosed : P.elastodynamicEquation
  initialConditionsClosed : P.initialConditions
  boundaryConditionsClosed : P.boundaryConditions
  solutionUniquenessClosed : P.solutionUniqueness
  finiteSpeedPropagationClosed : P.finiteSpeedPropagation

def SeismicWavePropagationClosed (P : SeismicWavePropagationPackage) : Prop :=
  P.elastodynamicEquation ∧ P.initialConditions ∧ P.boundaryConditions ∧
  P.solutionUniqueness ∧ P.finiteSpeedPropagation

theorem seismic_wave_propagation_closed_from_evidence (P : SeismicWavePropagationPackage)
    (E : SeismicWavePropagationEvidence P) : SeismicWavePropagationClosed P := by
  exact And.intro E.elastodynamicEquationClosed
    (And.intro E.initialConditionsClosed
      (And.intro E.boundaryConditionsClosed
        (And.intro E.solutionUniquenessClosed
          E.finiteSpeedPropagationClosed)))

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse