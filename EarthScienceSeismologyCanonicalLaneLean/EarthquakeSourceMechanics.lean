import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure EarthquakeSourceMechanicsPackage where
  faultGeometry : Type
  stressField : Type
  rupturePropagation : Prop
  momentTensor : Prop
  slipDistribution : Prop

structure EarthquakeSourceMechanicsEvidence (S : EarthquakeSourceMechanicsPackage) where
  rupturePropagationClosed : S.rupturePropagation
  momentTensorClosed : S.momentTensor
  slipDistributionClosed : S.slipDistribution

def EarthquakeSourceMechanicsClosed (S : EarthquakeSourceMechanicsPackage) : Prop :=
  S.rupturePropagation ∧ S.momentTensor ∧ S.slipDistribution

theorem earthquake_source_mechanics_closed_from_evidence
    (S : EarthquakeSourceMechanicsPackage) (E : EarthquakeSourceMechanicsEvidence S) :
    EarthquakeSourceMechanicsClosed S := by
  exact And.intro E.rupturePropagationClosed
    (And.intro E.momentTensorClosed E.slipDistributionClosed)

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse