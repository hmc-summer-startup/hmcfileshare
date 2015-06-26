//
//  FirstViewController.swift
//  HMC Fileshare
//
//  Created by Eyassu Shimelis on 6/25/15.
//  Copyright (c) 2015 HMC Summer Startup. All rights reserved.
// Make this a GMSmapView

import UIKit

class FirstViewController: UIViewController {
    
    @IBAction func changeMapType(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Map Types", message: "Select map type:", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let normalMapTypeAction = UIAlertAction(title: "Normal", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            self.viewMap.mapType = kGMSTypeNormal
        }
        
        let terrainMapTypeAction = UIAlertAction(title: "Terrain", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            self.viewMap.mapType = kGMSTypeTerrain
        }
        
        let hybridMapTypeAction = UIAlertAction(title: "Hybrid", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            self.viewMap.mapType = kGMSTypeHybrid
        }
        
        let cancelAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            
        }
        
        actionSheet.addAction(normalMapTypeAction)
        actionSheet.addAction(terrainMapTypeAction)
        actionSheet.addAction(hybridMapTypeAction)
        actionSheet.addAction(cancelAction)
        
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    @IBOutlet weak var viewMap: GMSMapView!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(34.106, longitude: -117.2, zoom: 8.0)
        viewMap.camera = camera
        
//        var camera = GMSCameraPosition.cameraWithLatitude(34.10566,
//            longitude: -117.70698, zoom: 18)
//        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
//        mapView.myLocationEnabled = true
//        self.view = mapView
//        
//        var marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(34.10566, -117.70698)
//        marker.title = "You are here"
//        // Snippet adds extra text to the map pointer icon.
////        marker.snippet = ""
//        marker.map = mapView
        
    }
}

 
