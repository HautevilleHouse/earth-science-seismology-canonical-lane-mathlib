import canonicalLaneMathlib.AdmissibleClass
import EarthScienceSeismologyCanonicalLaneLean.SeismicSourceMechanism

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure RayTracingPackage {G : SeismologySpace}
    {F : ElasticWaveEquationPackage G} {S : SeismicSourcePackage F} where
  velocityModel : Type u
  rayPaths : Type v
  travelTimes : Prop
  amplitudeDecay : Prop
  phaseIdentification : Prop

structure RayTracingEvidence {G : SeismologySpace}
    {F : ElasticWaveEquationPackage G} {S : SeismicSourcePackage F}
    (R : RayTracingPackage) where
  travelTimesClosed : R.travelTimes
  amplitudeDecayClosed : R.amplitudeDecay
  phaseIdentificationClosed : R.phaseIdentification

def RayTracingClosed {G : SeismologySpace}
    {F : ElasticWaveEquationPackage G} {S : SeismicSourcePackage F}
    (R : RayTracingPackage) : Prop :=
  R.travelTimes ∧ R.amplitudeDecay ∧ R.phaseIdentification

theorem ray_tracing_closed_from_evidence
    {G : SeismologySpace} {F : ElasticWaveEquationPackage G}
    {S : SeismicSourcePackage F} (R : RayTracingPackage)
    (E : RayTracingEvidence R) : RayTracingClosed R := by
  exact And.intro E.travelTimesClosed
    (And.intro E.amplitudeDecayClosed E.phaseIdentificationClosed)

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse