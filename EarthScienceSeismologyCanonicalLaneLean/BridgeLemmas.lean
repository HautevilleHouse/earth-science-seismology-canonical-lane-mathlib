import EarthScienceSeismologyCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace EarthScienceSeismologyCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SeismologyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EarthScienceSeismologyCanonicalLaneLean
end HautevilleHouse
