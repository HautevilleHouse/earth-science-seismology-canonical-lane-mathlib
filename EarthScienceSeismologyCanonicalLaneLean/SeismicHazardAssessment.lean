import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure SeismicHazardAssessmentPackage where
  hazardCurve : Type
  groundMotionModel : Type
  siteEffects : Prop
  recurrenceModel : Prop
  probabilisticFramework : Prop

structure SeismicHazardAssessmentEvidence (H : SeismicHazardAssessmentPackage) where
  siteEffectsClosed : H.siteEffects
  recurrenceModelClosed : H.recurrenceModel
  probabilisticFrameworkClosed : H.probabilisticFramework

def SeismicHazardAssessmentClosed (H : SeismicHazardAssessmentPackage) : Prop :=
  H.siteEffects ∧ H.recurrenceModel ∧ H.probabilisticFramework

theorem seismic_hazard_assessment_closed_from_evidence
    (H : SeismicHazardAssessmentPackage) (E : SeismicHazardAssessmentEvidence H) :
    SeismicHazardAssessmentClosed H := by
  exact And.intro E.siteEffectsClosed
    (And.intro E.recurrenceModelClosed E.probabilisticFrameworkClosed)

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse