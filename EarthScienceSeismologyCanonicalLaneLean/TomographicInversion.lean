import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure TomographicInversionPackage where
  travelTimeData : Type
  velocityModel : Type
  regularization : Prop
  resolutionAnalysis : Prop
  uniquenessUnderConstraints : Prop

structure TomographicInversionEvidence (T : TomographicInversionPackage) where
  regularizationClosed : T.regularization
  resolutionAnalysisClosed : T.resolutionAnalysis
  uniquenessUnderConstraintsClosed : T.uniquenessUnderConstraints

def TomographicInversionClosed (T : TomographicInversionPackage) : Prop :=
  T.regularization ∧ T.resolutionAnalysis ∧ T.uniquenessUnderConstraints

theorem tomographic_inversion_closed_from_evidence (T : TomographicInversionPackage)
    (E : TomographicInversionEvidence T) : TomographicInversionClosed T := by
  exact And.intro E.regularizationClosed
    (And.intro E.resolutionAnalysisClosed E.uniquenessUnderConstraintsClosed)

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse