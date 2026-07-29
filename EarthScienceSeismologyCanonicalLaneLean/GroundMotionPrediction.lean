import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure GroundMotionPredictionPackage where
  sourceSpectrum : Type
  pathEffects : Type
  siteResponse : Type
  attenuationRelation : Prop
  variabilityQuantified : Prop

structure GroundMotionPredictionEvidence (G : GroundMotionPredictionPackage) where
  attenuationRelationClosed : G.attenuationRelation
  variabilityQuantifiedClosed : G.variabilityQuantified

def GroundMotionPredictionClosed (G : GroundMotionPredictionPackage) : Prop :=
  G.attenuationRelation ∧ G.variabilityQuantified

theorem ground_motion_prediction_closed_from_evidence (G : GroundMotionPredictionPackage)
    (E : GroundMotionPredictionEvidence G) : GroundMotionPredictionClosed G := by
  exact And.intro E.attenuationRelationClosed E.variabilityQuantifiedClosed

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse