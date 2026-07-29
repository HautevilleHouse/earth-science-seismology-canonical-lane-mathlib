import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure AttenuationAndDispersionPackage where
  qualityFactor : Prop
  intrinsicAttenuation : Prop
  scatteringLoss : Prop
  dispersionRelation : Prop
  frequencyDependence : Prop

structure AttenuationAndDispersionEvidence (A : AttenuationAndDispersionPackage) where
  qualityFactorClosed : A.qualityFactor
  intrinsicAttenuationClosed : A.intrinsicAttenuation
  scatteringLossClosed : A.scatteringLoss
  dispersionRelationClosed : A.dispersionRelation
  frequencyDependenceClosed : A.frequencyDependence

def AttenuationAndDispersionClosed (A : AttenuationAndDispersionPackage) : Prop :=
  A.qualityFactor ∧ A.intrinsicAttenuation ∧ A.scatteringLoss ∧ A.dispersionRelation ∧ A.frequencyDependence

theorem attenuation_and_dispersion_closed_from_evidence
    (A : AttenuationAndDispersionPackage) (E : AttenuationAndDispersionEvidence A) :
    AttenuationAndDispersionClosed A := by
  exact And.intro E.qualityFactorClosed
    (And.intro E.intrinsicAttenuationClosed
      (And.intro E.scatteringLossClosed
        (And.intro E.dispersionRelationClosed E.frequencyDependenceClosed)))

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse
