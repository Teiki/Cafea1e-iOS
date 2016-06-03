//
//  HttpClient.swift
//  Café à 1€
//
//  Created by Antoine GALTIER on 03/06/2016.
//  Copyright © 2016 Teiki. All rights reserved.
//

import Foundation

protocol HttpClientDelegate {
    func onDataGet(data : NSData)
}

class HttpClient {
    
    static func request(delegate : HttpClientDelegate, url : String){
        let requestURL: NSURL = NSURL(string: url)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                delegate.onDataGet(data!)
            } else {
                //error
            }
        }
        
        task.resume()
    }
    
}