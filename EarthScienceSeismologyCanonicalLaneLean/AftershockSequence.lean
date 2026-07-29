import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure AftershockSequencePackage where
  mainshockParameters : Type
  aftershockRate : Prop
  omoriLaw : Prop
  spatialDistribution : Prop
  magnitudeDistribution : Prop
  bValue : Prop

structure AftershockSequenceEvidence (A : AftershockSequencePackage) where
  aftershockRateClosed : A.aftershockRate
  omoriLawClosed : A.omoriLaw
  spatialDistributionClosed : A.spatialDistribution
  magnitudeDistributionClosed : A.magnitudeDistribution
  bValueClosed : A.bValue

def AftershockSequenceClosed (A : AftershockSequencePackage) : Prop :=
  A.aftershockRate ∧ A.omoriLaw ∧ A.spatialDistribution ∧ A.magnitudeDistribution ∧ A.bValue

theorem aftershock_sequence_closed_from_evidence
    (A : AftershockSequencePackage) (E : AftershockSequenceEvidence A) :
    AftershockSequenceClosed A := by
  exact And.intro E.aftershockRateClosed
    (And.intro E.omoriLawClosed
      (And.intro E.spatialDistributionClosed
        (And.intro E.magnitudeDistributionClosed E.bValueClosed)))

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse
