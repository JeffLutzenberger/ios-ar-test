import CoreLocation
import ArcGIS
import HDAugmentedReality

class Waypoint: ARAnnotation {
    static let DefaultIconName : String = "Location"
    
    let name: String
    var elevation : Double = 0
    var location2D = CLLocationCoordinate2D()
    
    init(name: String, location2D: CLLocationCoordinate2D, elevation: Double) {
        self.name = name
        self.location2D = location2D
        self.elevation = elevation
        super.init(identifier: nil,
                   title: name,
                   location: CLLocation(latitude: location2D.latitude,
                                        longitude: location2D.longitude))!
    }
    
    init (name: String, latitude: Double, longitude: Double, elevation: Double) {
        self.name = name
        location2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.elevation = elevation
        super.init(identifier: nil,
                   title: name,
                   location: CLLocation(latitude: location2D.latitude,
                                        longitude: location2D.longitude))!
    }
    
    func toAGSPoint() -> AGSPoint {
        let p = AGSPoint(clLocationCoordinate2D: location2D)
        
        return (AGSGeometryEngine.projectGeometry(
            p, to: AGSSpatialReference.webMercator()) as? AGSPoint)!
    }
}
