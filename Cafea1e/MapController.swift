//
//  ViewController.swift
//  Cafea1e
//
//  Created by Antoine GALTIER on 03/06/2016.
//  Copyright © 2016 Teiki. All rights reserved.
//

import UIKit

class MapController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    private var mapModel = MapModel?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapModel = MapModel(mapView: mapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

