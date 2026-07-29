import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SeismologySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SeismologyAdmittedObject where
  space : SeismologySpace
  threeDimensional : Prop
  elasticMedium : Prop
  wavePropagationModel : Type
  waveEquation : Prop
  conclusion : wavePropagationModel

structure SeismologyEndgameState where
  object : SeismologyAdmittedObject

def SeismologyWitnessClosed (O : SeismologyAdmittedObject) : Prop :=
  O.wavePropagationModel

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse