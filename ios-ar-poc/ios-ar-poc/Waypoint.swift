import CoreLocation
import ArcGIS

struct Waypoint {
    static let DefaultIconName : String = "Location"
    
    var name = ""
    var elevation : Double = 0
    var location = CLLocationCoordinate2D()
    
    init(location: CLLocationCoordinate2D, elevation: Double) {
        self.location = location
        self.elevation = elevation
    }
    
    init (latitude: Double, longitude: Double, elevation: Double) {
        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.elevation = elevation
    }
    
    func toAGSPoint() -> AGSPoint {
        let p = AGSPoint(clLocationCoordinate2D: location)
        
        return (AGSGeometryEngine.projectGeometry(
            p, to: AGSSpatialReference.webMercator()) as? AGSPoint)!
    }
}

