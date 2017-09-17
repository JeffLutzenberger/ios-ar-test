import UIKit
import ArcGIS

class ViewController: UIViewController {

    @IBOutlet weak var mapView: AGSMapView!
    
    fileprivate let locationManager = CLLocationManager()
    
    let waypoints = [
        Waypoint(latitude: 45.6770, longitude: -111.0429, elevation: 5000)]
    
    var markupsGraphicsOverlay = AGSGraphicsOverlay()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Display a map using the ArcGIS Online imagery basemap service
        mapView.map = AGSMap(
            basemapType: .imageryWithLabelsVector, latitude: 45.6770, longitude: -111.0429,
            levelOfDetail: 17)
        
        mapView.locationDisplay.autoPanMode = .compassNavigation
        mapView.locationDisplay.start()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        
        mapView.graphicsOverlays.add(markupsGraphicsOverlay)
        
        for w in waypoints {
            markupsGraphicsOverlay.graphics.add(WaypointGraphic(atPoint: w.toAGSPoint()))
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //1
        if locations.count > 0 {
            let location = locations.last!
            print("Accuracy: \(location.horizontalAccuracy)")
            
            //2
            if location.horizontalAccuracy < 100 {
                //3
                manager.stopUpdatingLocation()
                //let span = MKCoordinateSpan(latitudeDelta: 0.014, longitudeDelta: 0.014)
                //let region = MKCoordinateRegion(center: location.coordinate, span: span)
                //mapView.region = region
                // More code later...
            }
        }
    }
}
