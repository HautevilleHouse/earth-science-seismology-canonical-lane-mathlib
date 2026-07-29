import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure EarthStructureTomographyPackage where
  inversionMethod : Type
  travelTimeData : Type
  velocityModel : Prop
  resolutionAnalysis : Prop
  uncertaintyQuantification : Prop

structure EarthStructureTomographyEvidence (T : EarthStructureTomographyPackage) where
  velocityModelClosed : T.velocityModel
  resolutionAnalysisClosed : T.resolutionAnalysis
  uncertaintyQuantificationClosed : T.uncertaintyQuantification

def EarthStructureTomographyClosed (T : EarthStructureTomographyPackage) : Prop :=
  T.velocityModel ∧ T.resolutionAnalysis ∧ T.uncertaintyQuantification

theorem earth_structure_tomography_closed_from_evidence
    (T : EarthStructureTomographyPackage) (E : EarthStructureTomographyEvidence T) :
    EarthStructureTomographyClosed T := by
  exact And.intro E.velocityModelClosed
    (And.intro E.resolutionAnalysisClosed E.uncertaintyQuantificationClosed)

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse