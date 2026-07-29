import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure SeismicTomographyPackage where
  travelTimeData : Prop
  rayTracing : Prop
  inversionAlgorithm : Prop
  velocityModel : Prop
  resolutionEstimates : Prop

structure SeismicTomographyEvidence (T : SeismicTomographyPackage) where
  travelTimeDataClosed : T.travelTimeData
  rayTracingClosed : T.rayTracing
  inversionAlgorithmClosed : T.inversionAlgorithm
  velocityModelClosed : T.velocityModel
  resolutionEstimatesClosed : T.resolutionEstimates

def SeismicTomographyClosed (T : SeismicTomographyPackage) : Prop :=
  T.travelTimeData ∧ T.rayTracing ∧ T.inversionAlgorithm ∧ T.velocityModel ∧ T.resolutionEstimates

theorem seismic_tomography_closed_from_evidence
    (T : SeismicTomographyPackage) (E : SeismicTomographyEvidence T) :
    SeismicTomographyClosed T := by
  exact And.intro E.travelTimeDataClosed
    (And.intro E.rayTracingClosed
      (And.intro E.inversionAlgorithmClosed
        (And.intro E.velocityModelClosed E.resolutionEstimatesClosed)))

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse
