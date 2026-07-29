import canonicalLaneMathlib.AdmissibleClass
import EarthScienceSeismologyCanonicalLaneLean.ElasticWaveEquationPDE

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure SeismicSourcePackage {G : SeismologySpace}
    (F : ElasticWaveEquationPackage G) where
  momentTensor : Type u
  sourceTimeFunction : Type v
  focalMechanism : Prop
  momentMagnitude : Prop
  radiationPattern : Prop

structure SeismicSourceEvidence {G : SeismologySpace}
    {F : ElasticWaveEquationPackage G} (S : SeismicSourcePackage F) where
  focalMechanismClosed : S.focalMechanism
  momentMagnitudeClosed : S.momentMagnitude
  radiationPatternClosed : S.radiationPattern

def SeismicSourceClosed {G : SeismologySpace}
    {F : ElasticWaveEquationPackage G} (S : SeismicSourcePackage F) : Prop :=
  S.focalMechanism ∧ S.momentMagnitude ∧ S.radiationPattern

theorem seismic_source_closed_from_evidence
    {G : SeismologySpace} {F : ElasticWaveEquationPackage G}
    (S : SeismicSourcePackage F) (E : SeismicSourceEvidence S) :
    SeismicSourceClosed S := by
  exact And.intro E.focalMechanismClosed
    (And.intro E.momentMagnitudeClosed E.radiationPatternClosed)

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse