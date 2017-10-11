//
//  MapViewController.swift
//  SkyCatchTest
//
//  Created by digvijay mallegowda on 10/1/17.
//  Copyright © 2017 InfinityDeveloperZone. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setMap()
        navigationItem.title = "Movie Location"
        setMapLoc()
         activityInd()
    }
    var movieLoc : Movies!
    
    
//implementing custom Mapview
    let mapView : MKMapView = {
       let set = MKMapView()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.mapType = .standard
        set.isZoomEnabled = true
        set.isScrollEnabled = true
        return set
    }()
    
    func setMap()  {
        
            self.view.addSubview(self.mapView)
            self.mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            self.mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            self.mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activity.startAnimating()
    }
    
// activity Animation
    var activity: UIActivityIndicatorView = {
       let set  = UIActivityIndicatorView()
        set.activityIndicatorViewStyle = .gray
        set.hidesWhenStopped = true
        return set
    }()
    
    func activityInd(){
        mapView.addSubview(activity)
        activity.center = self.view.center
   }
    
//   Search Map Location
    
    func setMapLoc(){
        let searchRequest = MKLocalSearchRequest()
        if let loc = movieLoc.locations{
            searchRequest.naturalLanguageQuery = "\(loc),san francisco"
        }else{
            searchRequest.naturalLanguageQuery = "san francisco"
        }
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { (response, err) in
            if response == nil {
                print(err?.localizedDescription ?? "Error in Maps")
            }else{
                DispatchQueue.global().async {
                    let lat  = response?.boundingRegion.center.latitude
                    let lon = response?.boundingRegion.center.longitude
                    let annotation = MKPointAnnotation()
                    annotation.title = self.movieLoc.locations
                    annotation.coordinate = CLLocationCoordinate2DMake(lat!, lon!)
                    
                    let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat!, lon!)
                    let span = MKCoordinateSpanMake(0.1, 0.1)
                    let region = MKCoordinateRegionMake(coordinate, span)
                    DispatchQueue.main.async {
                        self.mapView.addAnnotation(annotation)
                        self.mapView.setRegion(region, animated: true)
                         self.activity.stopAnimating()
                    }
                    
                    
                }

              
                
            }
        }
     
    }

}
