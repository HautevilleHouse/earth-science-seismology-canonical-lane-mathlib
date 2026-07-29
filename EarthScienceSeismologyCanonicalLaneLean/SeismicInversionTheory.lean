import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure SeismicInversionTheoryPackage where
  forwardModel : Type
  inverseAlgorithm : Type
  regularization : Prop
  convergenceAnalysis : Prop
  computationalEfficiency : Prop

structure SeismicInversionTheoryEvidence (I : SeismicInversionTheoryPackage) where
  regularizationClosed : I.regularization
  convergenceAnalysisClosed : I.convergenceAnalysis
  computationalEfficiencyClosed : I.computationalEfficiency

def SeismicInversionTheoryClosed (I : SeismicInversionTheoryPackage) : Prop :=
  I.regularization ∧ I.convergenceAnalysis ∧ I.computationalEfficiency

theorem seismic_inversion_theory_closed_from_evidence
    (I : SeismicInversionTheoryPackage) (E : SeismicInversionTheoryEvidence I) :
    SeismicInversionTheoryClosed I := by
  exact And.intro E.regularizationClosed
    (And.intro E.convergenceAnalysisClosed E.computationalEfficiencyClosed)

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse