import canonicalLaneMathlib.AdmissibleClass
import EarthScienceSeismologyCanonicalLaneLean.TomographicInversion

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure EarlyWarningPackage {G : SeismologySpace}
    {F : ElasticWaveEquationPackage G} {S : SeismicSourcePackage F}
    {R : RayTracingPackage} {I : InversionPackage} where
  realTimeData : Prop
  hypocenterEstimation : Prop
  magnitudeEstimation : Prop
  thresholdAlarm : Prop
  leadTime : Prop

structure EarlyWarningEvidence {G : SeismologySpace}
    {F : ElasticWaveEquationPackage G} {S : SeismicSourcePackage F}
    {R : RayTracingPackage} {I : InversionPackage}
    (W : EarlyWarningPackage) where
  realTimeDataClosed : W.realTimeData
  hypocenterEstimationClosed : W.hypocenterEstimation
  magnitudeEstimationClosed : W.magnitudeEstimation
  thresholdAlarmClosed : W.thresholdAlarm
  leadTimeClosed : W.leadTime

def EarlyWarningClosed {G : SeismologySpace}
    {F : ElasticWaveEquationPackage G} {S : SeismicSourcePackage F}
    {R : RayTracingPackage} {I : InversionPackage}
    (W : EarlyWarningPackage) : Prop :=
  W.realTimeData ∧ W.hypocenterEstimation ∧ W.magnitudeEstimation ∧
  W.thresholdAlarm ∧ W.leadTime

theorem early_warning_closed_from_evidence
    {G : SeismologySpace} {F : ElasticWaveEquationPackage G}
    {S : SeismicSourcePackage F} {R : RayTracingPackage} {I : InversionPackage}
    (W : EarlyWarningPackage) (E : EarlyWarningEvidence W) : EarlyWarningClosed W := by
  exact And.intro E.realTimeDataClosed
    (And.intro E.hypocenterEstimationClosed
      (And.intro E.magnitudeEstimationClosed
        (And.intro E.thresholdAlarmClosed E.leadTimeClosed)))

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse