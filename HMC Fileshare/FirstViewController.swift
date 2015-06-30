//
//  FirstViewController.swift
//  HMC Fileshare
//
//  Created by Eyassu Shimelis on 6/25/15.
//  Copyright (c) 2015 HMC Summer Startup. All rights reserved.
// Make this a GMSmapView

import UIKit



class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    var didFindMyLocation = false
    
    var userLong: Double! = 0.0
    var userLat:  Double! = 0.0
    
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
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewMap.settings.myLocationButton = true
        
        println(" ")
        println("Initial Location ")
        println("Longitude: \(userLong)")
        println("Latitude: \(userLat)")
        println(" ")
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        viewMap.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.New, context: nil)
        
//        dispatch_once(token)
        
//        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(34.106088672398336, longitude: -117.71047934889793, zoom: 18)
//        viewMap.camera = camera
        
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
    
    class var sharedInstance: FirstViewController{
        struct Static{
            static var instance: FirstViewController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token){
            Static.instance = FirstViewController()
        }
        
        return Static.instance!
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if !didFindMyLocation {
            let myLocation: CLLocation = change[NSKeyValueChangeNewKey] as! CLLocation
            viewMap.camera = GMSCameraPosition.cameraWithTarget(myLocation.coordinate, zoom: 10.0)
            
            // Moved to the viewDidLoad method so that it appears right away.
//            viewMap.settings.myLocationButton = true
            
            didFindMyLocation = true
            
            userLong = myLocation.coordinate.longitude
            userLat = myLocation.coordinate.latitude
            
            println()
            println("Current User Location")
            println("Longitude: \(myLocation.coordinate.longitude)")
            println("Latitude: \(myLocation.coordinate.latitude)")
            println()
        }
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            viewMap.myLocationEnabled = true
        }
    }
}

 
