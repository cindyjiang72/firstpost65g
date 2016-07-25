//
//  Fetcher.swift
//  Lecture10
//
//  Created by JiangYuan on 7/25/16.
//  Copyright © 2016 JiangYuan. All rights reserved.
//

import Foundation

class Fetcher: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate {
    
    func session() -> NSURLSession {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 15.0
        return NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
    }
    
    //MARK: USURLSessionDelegate
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {

    }

    func URLSession(session: NSURLSession, task: NSURLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {

    }
    
    typealias RequestCompletionHandler = (data: NSData?, message: String?) -> Void
    
    func request(url:NSURL, completion: RequestCompletionHandler){
        _ = session().dataTaskWithURL(url) {
            (data: NSData?, response:NSURLResponse?, error: NSError?) in
            let message = self.parseResponse(response, error: error)
            completion(data: data, message: message)
        }
    }
    
    
    typealias JSONRequestCompletionHandler = (json:NSObject?, message: String?) -> Void
    
    func requestJSON(url: NSURL, completion: (json:NSObject?, message: String?) -> Void) {
        request(url) { (data, message) in
            var json: NSObject?
            if let data = data {
                json = try? NGJSONSerialization.JSONObjectWithData(data, options: NGJSONReadingOptions.AllowFragments)! as! NSObject
            }
            completion(json: json, message: message)
        
        }
    }
    
    
    func parseResponse(response: NSURLResponse?, error: NSError?) -> String? {
        if let statusCode = (response as? NSHTTPURLResponse)?.statusCode {
            if statusCode == 200 {
                return nil
            }
            else {
                return "HTTP Error \(statusCode): \(NSHTTPURLResponse.localizedStringForStatusCode(statusCode))"
            }
        }
        else {
            if let netErr = error {
                    return "Network Error: \(netErr.localizedDescription)"
            }
            else {
                return "OS Error: network error was empty"
            }
        }
        
    
    }


}

extension Fetcher {


    func URLSession(session: NSURLSession, didBecomeInvalidWithError error: NSError?) {
        NSLog("\(#function): Session became invalid: \(error?.localizedDescription)")
    }

    func URLSessionDidFinishEventsForBackgroundURLSession(session: NSURLSession) {

    }
    
    func URLSession(session: NSURLSession, didReceiveChallenge challenge: NSURLAuthenticationChallenge, completionHandler: (NSURLSessionAuthChallengeDisposition, NSURLCredential?) -> Void) {
        
    }
    
}