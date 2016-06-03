//
//  openDataReacher.swift
//  Cafea1e
//
//  Created by Antoine GALTIER on 03/06/2016.
//  Copyright © 2016 Teiki. All rights reserved.
//

import Foundation


class OpenDataReacher {
    
    static let base_url = "http://parisdata.opendatasoft.com/api/records/1.0/search/?dataset=liste-des-cafes-a-un-euro&rows=15&facet=arrondissement&refine.arrondissement="

    static func getCafes(delegate : HttpClientDelegate, arrondissement : Int){
        let url = base_url + String(arrondissement)
        HttpClient.request(delegate, url: url)
    }

}