//
//  FirstViewController.swift
//  HMC Fileshare
//
//  Created by Eyassu Shimelis on 6/25/15.
//  Copyright (c) 2015 HMC Summer Startup. All rights reserved.
// Make this a GMSmapView

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var camera = GMSCameraPosition.cameraWithLatitude(34.10566,
            longitude: -117.70698, zoom: 18)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(34.10566, -117.70698)
        marker.title = "You are here"
        // Snippet adds extra text to the map pointer icon.
//        marker.snippet = ""
        marker.map = mapView
        
    }
}

 
