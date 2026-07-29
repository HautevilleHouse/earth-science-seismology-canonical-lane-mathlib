import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure SeismicInterferometryPackage where
  ambientNoiseSource : Type
  crossCorrelation : Prop
  greenFunctionRetrieval : Prop
  dispersionCurve : Prop
  surfaceWaveTomography : Prop

structure SeismicInterferometryEvidence (I : SeismicInterferometryPackage) where
  crossCorrelationClosed : I.crossCorrelation
  greenFunctionRetrievalClosed : I.greenFunctionRetrieval
  dispersionCurveClosed : I.dispersionCurve
  surfaceWaveTomographyClosed : I.surfaceWaveTomography

def SeismicInterferometryClosed (I : SeismicInterferometryPackage) : Prop :=
  I.crossCorrelation ∧ I.greenFunctionRetrieval ∧ I.dispersionCurve ∧ I.surfaceWaveTomography

theorem seismic_interferometry_closed_from_evidence
    (I : SeismicInterferometryPackage) (E : SeismicInterferometryEvidence I) :
    SeismicInterferometryClosed I := by
  exact And.intro E.crossCorrelationClosed
    (And.intro E.greenFunctionRetrievalClosed
      (And.intro E.dispersionCurveClosed E.surfaceWaveTomographyClosed))

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse
