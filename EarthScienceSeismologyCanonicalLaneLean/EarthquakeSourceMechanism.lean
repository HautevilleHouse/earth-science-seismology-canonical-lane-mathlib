import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure EarthquakeSourceMechanismPackage where
  faultGeometry : Type
  slipDistribution : Type
  momentTensor : Type
  rupturePropagation : Prop
  radiationPattern : Prop

structure EarthquakeSourceMechanismEvidence (S : EarthquakeSourceMechanismPackage) where
  rupturePropagationClosed : S.rupturePropagation
  radiationPatternClosed : S.radiationPattern

def EarthquakeSourceMechanismClosed (S : EarthquakeSourceMechanismPackage) : Prop :=
  S.rupturePropagation ∧ S.radiationPattern

theorem earthquake_source_mechanism_closed_from_evidence (S : EarthquakeSourceMechanismPackage)
    (E : EarthquakeSourceMechanismEvidence S) : EarthquakeSourceMechanismClosed S := by
  exact And.intro E.rupturePropagationClosed E.radiationPatternClosed

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse