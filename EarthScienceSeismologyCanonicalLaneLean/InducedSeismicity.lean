import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure InducedSeismicityPackage where
  porePressureDiffusion : Prop
  stressPerturbation : Prop
  triggeringMechanism : Prop
  statisticalCorrelation : Prop
  operationalControls : Prop

structure InducedSeismicityEvidence (I : InducedSeismicityPackage) where
  porePressureDiffusionClosed : I.porePressureDiffusion
  stressPerturbationClosed : I.stressPerturbation
  triggeringMechanismClosed : I.triggeringMechanism
  statisticalCorrelationClosed : I.statisticalCorrelation
  operationalControlsClosed : I.operationalControls

def InducedSeismicityClosed (I : InducedSeismicityPackage) : Prop :=
  I.porePressureDiffusion ∧ I.stressPerturbation ∧ I.triggeringMechanism ∧ I.statisticalCorrelation ∧ I.operationalControls

theorem induced_seismicity_closed_from_evidence (I : InducedSeismicityPackage) (E : InducedSeismicityEvidence I) :
    InducedSeismicityClosed I := by
  exact And.intro E.porePressureDiffusionClosed
    (And.intro E.stressPerturbationClosed
      (And.intro E.triggeringMechanismClosed
        (And.intro E.statisticalCorrelationClosed E.operationalControlsClosed)))

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse
