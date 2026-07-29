import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure SeismicWaveAttenuationPackage where
  attenuationModel : Type
  frequencyDependence : Type
  qualityFactor : Prop
  scatteringEffects : Prop
  absorptionEffects : Prop

structure SeismicWaveAttenuationEvidence (A : SeismicWaveAttenuationPackage) where
  qualityFactorClosed : A.qualityFactor
  scatteringEffectsClosed : A.scatteringEffects
  absorptionEffectsClosed : A.absorptionEffects

def SeismicWaveAttenuationClosed (A : SeismicWaveAttenuationPackage) : Prop :=
  A.qualityFactor ∧ A.scatteringEffects ∧ A.absorptionEffects

theorem seismic_wave_attenuation_closed_from_evidence
    (A : SeismicWaveAttenuationPackage) (E : SeismicWaveAttenuationEvidence A) :
    SeismicWaveAttenuationClosed A := by
  exact And.intro E.qualityFactorClosed
    (And.intro E.scatteringEffectsClosed E.absorptionEffectsClosed)

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse