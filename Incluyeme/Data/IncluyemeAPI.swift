//
//  IncluyemeAPI.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

enum IncluyemeKey: String{
    
    case login = "/login"
    case courses = "/courses"
    case schedule = "/schedule"
    case grades = "/coursesgrades"
    func url() -> String {
        return "https://incluyeme.herokuapp.com/api\(self.rawValue)"
    }

}
enum HTTPMethod: String{
    case post = "POST"
}
class IncluyemeAPI<I:Codable> {
    static func handleError(error: Error) {
        print("Error while requesting Data: \(error.localizedDescription)")
    }
    static func service<T:Decodable>(
        method: HTTPMethod,
        urlString: String,
        headers: [String: String],
        body: Data?,
        responseType: T.Type,
        responseHandler: @escaping ((T) -> (Void)),
        errorHandler: @escaping ((Error) -> (Void)) = handleError,
        key: IncluyemeKey){
        
        guard let endpointUrl = URL(string: urlString) else {
            print("Failed at url")
            return
        }
        
        var request = URLRequest(url: (endpointUrl))
        
        request.httpMethod = method.rawValue
        
        //MARK:- PostBody
        if let body = body{
            request.httpBody = body
        }
        
        //MARK:- PostHeader
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        for (key,val) in headers{
            request.addValue(val, forHTTPHeaderField: key)
        }
        //MARK:- PostCall
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            guard
                let data: Data = data,
                let _: URLResponse = response,
                error == nil else {
                    errorHandler(error!)
                    return
            }
            do {
                let dataResponse = try JSONDecoder().decode(responseType.self, from: data)
                UserDefaults.standard.set(data, forKey: key.rawValue)
                print(dataResponse)
                DispatchQueue.main.async { responseHandler(dataResponse) }
            }catch{
                errorHandler(error)
            }
        }
        task.resume()
    }
    static public func get(_ key: IncluyemeKey,responseHandler: @escaping (Response<I>) -> (Void),errorHandler: @escaping (Error) -> ()){
        self.service(method: .post,
                     urlString: key.url(),
                     headers: [:],
                     body: nil,
                     responseType: Response.self,
                     responseHandler: responseHandler,
                     errorHandler: errorHandler,
                     key: key
        )
    }
}
