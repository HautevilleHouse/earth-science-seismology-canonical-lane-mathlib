import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure StrongGroundMotionPackage where
  peakGroundAcceleration : Prop
  responseSpectrum : Prop
  durationModel : Prop
  siteAmplification : Prop
  hazardCurve : Prop

structure StrongGroundMotionEvidence (S : StrongGroundMotionPackage) where
  peakGroundAccelerationClosed : S.peakGroundAcceleration
  responseSpectrumClosed : S.responseSpectrum
  durationModelClosed : S.durationModel
  siteAmplificationClosed : S.siteAmplification
  hazardCurveClosed : S.hazardCurve

def StrongGroundMotionClosed (S : StrongGroundMotionPackage) : Prop :=
  S.peakGroundAcceleration ∧ S.responseSpectrum ∧ S.durationModel ∧ S.siteAmplification ∧ S.hazardCurve

theorem strong_ground_motion_closed_from_evidence
    (S : StrongGroundMotionPackage) (E : StrongGroundMotionEvidence S) :
    StrongGroundMotionClosed S := by
  exact And.intro E.peakGroundAccelerationClosed
    (And.intro E.responseSpectrumClosed
      (And.intro E.durationModelClosed
        (And.intro E.siteAmplificationClosed E.hazardCurveClosed)))

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse
