import Foundation
import ArcGIS

class WaypointGraphic : AGSGraphic {
    let width : CGFloat = 30
    let height : CGFloat = 40
    
    override init() {
        super.init()
    }
    
    init(atPoint: AGSPoint) {
        let icon : UIImage = #imageLiteral(resourceName: "waypoint")
        
        let pictureMarker = AGSPictureMarkerSymbol(image: icon)
        pictureMarker.height = height
        pictureMarker.width = width
        
        super.init(geometry: atPoint, symbol: pictureMarker, attributes: ["hello" : "world"])
    }
}
