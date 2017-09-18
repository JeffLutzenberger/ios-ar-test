//
//  WaypointViewController.swift
//  ios-ar-poc
//
//  Created by Matthew Mathias on 9/18/17.
//  Copyright © 2017 Jeff Lutzenberger. All rights reserved.
//

import UIKit
import HDAugmentedReality

class WaypointViewController: UIViewController {
    
    let waypoints = [
        Waypoint(name: "Bozeman", latitude: 45.6770, longitude: -111.0429, elevation: 5000)]
    private var arViewController: ARViewController!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showARController(self)
    }

    func showARController(_ sender: Any) {
        arViewController = ARViewController()
        arViewController.dataSource = self
        
        // FIXME: These do not work from the tutorial
//        arViewController.maxVisibleAnnotations = 30
//        arViewController.headingSmoothingFactor = 0.05
        
        arViewController.setAnnotations(waypoints) // needs an [ARAnnotation]
        present(arViewController, animated: true, completion: nil)
    }

}

// MARK: - ARDataSource

extension WaypointViewController: ARDataSource {
    
    func ar(_ arViewController: ARViewController, viewForAnnotation: ARAnnotation) -> ARAnnotationView {
        let annotationView = AnnotationView()
        annotationView.annotation = viewForAnnotation
        annotationView.delegate = self
        annotationView.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        return annotationView
    }
    
}

// MARK: - AnnotationViewDelegate

extension WaypointViewController: AnnotationViewDelegate {
    
    func didTouch(annotationView: AnnotationView) {
        print("Tapped view for POI: \(String(describing: annotationView.titleLabel?.text))")
    }
    
}
