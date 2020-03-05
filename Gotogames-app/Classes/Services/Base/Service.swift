//
//  Service.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 04/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import Alamofire
import UIKit

typealias ServiceCompletionHandler = (_ result: Any?, _ success: Bool?, _ error: NSError?) -> Void
typealias SuccessCompletionHandler = ((_ success: Bool?, _ error: NSError?) -> Void)?

class Service: NSObject {
    
    static func baseUrl() -> String {
        if var url = Bundle.main.object(forInfoDictionaryKey: BundleConstants.Service.BaseUrl) as? String {
            url = url.replacingOccurrences(of: "/ /", with: "//")
            return url
        }
        return ""
    }
    
    func getRequest(url: String, headers: HTTPHeaders, parameters: [String: AnyObject]?=nil, parser: ParserJSON?=nil, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping ServiceCompletionHandler) {
        startRequest(method: .get, url: url, headers: headers, parameters: parameters, parser: parser, encoding: encoding, completion: completion)
    }
    
    func postRequest(url: String, headers: HTTPHeaders, parameters: [String: AnyObject]?=nil, parser: ParserJSON?=nil, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping ServiceCompletionHandler) {
        startRequest(method: .post, url: url, headers: headers, parameters: parameters, parser: parser, encoding: encoding, completion: completion)
    }
    
    func putRequest(url: String, headers: HTTPHeaders, parameters: [String: AnyObject]?=nil, body: String?=nil, parser: ParserJSON?=nil, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping ServiceCompletionHandler) {
        startRequest(method: .put, url: url, headers: headers, parameters: parameters, body: body, parser: parser, encoding: encoding, completion: completion)
    }
    
    func deleteRequest(url: String, headers: HTTPHeaders, parameters: [String: AnyObject]?=nil, parser: ParserJSON?=nil, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping ServiceCompletionHandler) {
        startRequest(method: .delete, url: url, headers: headers, parameters: parameters, parser: parser, encoding: encoding, completion: completion)
    }
    
    func initRequest(method: HTTPMethod, url: String, headers: HTTPHeaders, parameters: [String: AnyObject]?=nil, body: String?=nil, encoding: ParameterEncoding = URLEncoding.default) -> DataRequest {
        return Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
    
    func startRequest(method: HTTPMethod, url: String, headers: HTTPHeaders, parameters: [String: AnyObject]?=nil, body: String?=nil, parser: ParserJSON?=nil, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping ServiceCompletionHandler) {
        
        let request = initRequest(method: method, url: url, headers: headers, parameters: parameters, body: body, encoding: encoding)
        request.validate().responseJSON {(response: DataResponse<Any>) in
                print("Request : \(request)")
            
                switch response.result {
                case .success:
                    if parser != nil {
                        let result = parser?.parse(data: response.data)
                        completion(result, true, nil)
                    } else {
                        completion(nil, true, nil)
                    }
                case .failure(let error):
                    print("🛑 Request error : \(error) 🛑")
                    completion(nil, false, error as NSError?)
                }
        }
    }
}
