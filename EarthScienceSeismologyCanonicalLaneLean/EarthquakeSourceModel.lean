import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure EarthquakeSourceModelPackage where
  faultGeometry : Prop
  slipDistribution : Prop
  momentTensor : Prop
  sourceTimeFunction : Prop
  magnitudeScaling : Prop

structure EarthquakeSourceModelEvidence (E : EarthquakeSourceModelPackage) where
  faultGeometryClosed : E.faultGeometry
  slipDistributionClosed : E.slipDistribution
  momentTensorClosed : E.momentTensor
  sourceTimeFunctionClosed : E.sourceTimeFunction
  magnitudeScalingClosed : E.magnitudeScaling

def EarthquakeSourceModelClosed (E : EarthquakeSourceModelPackage) : Prop :=
  E.faultGeometry ∧ E.slipDistribution ∧ E.momentTensor ∧ E.sourceTimeFunction ∧ E.magnitudeScaling

theorem earthquake_source_model_closed_from_evidence
    (E : EarthquakeSourceModelPackage) (Ev : EarthquakeSourceModelEvidence E) :
    EarthquakeSourceModelClosed E := by
  exact And.intro Ev.faultGeometryClosed
    (And.intro Ev.slipDistributionClosed
      (And.intro Ev.momentTensorClosed
        (And.intro Ev.sourceTimeFunctionClosed Ev.magnitudeScalingClosed)))

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse
