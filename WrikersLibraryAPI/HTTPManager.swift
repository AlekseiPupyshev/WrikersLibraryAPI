//
//  HTTPManager.swift
//  WrikersLibraryAPI
//
//  Created by cmashinho on 06/09/15.
//  Copyright (c) 2015 cmashinho. All rights reserved.
//

import UIKit

class HTTPManager: NSObject {
    
    func postRequest(url: String, parameters: String, token: String) -> (NSData?, NSError?) {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        var postData = parameters.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        
        request.HTTPMethod = "POST"
        request.setValue("\(count(parameters))", forHTTPHeaderField: "Content-Lenght")
        if (token != "") { request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization") }
        request.HTTPBody = postData
        
        var error: NSError?
        var responseData = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: &error)
        
        return (responseData, error)
    }
    
    func getRequest(url: String, parameters: String, token: String) -> (NSData?, NSError?) {
        var request = NSMutableURLRequest()
        
        if parameters == "" {
            request = NSMutableURLRequest(URL: NSURL(string: url)!)
        } else {
            request = NSMutableURLRequest(URL: NSURL(string: url + "?" + parameters)!)
        }
        
        request.HTTPMethod = "GET"
        request.HTTPShouldHandleCookies = true
        request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        
        var error: NSError?
        var responseData = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: &error)
        
        return (responseData, error)
    }
    
    // TODO: - Create PUT Request
}
