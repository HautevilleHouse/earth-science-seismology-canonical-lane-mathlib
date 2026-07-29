import EarthScienceSeismologyCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

structure AdmissibleClass where
  object : SeismologyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SeismologyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse
