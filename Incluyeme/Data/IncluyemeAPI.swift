//
//  IncluyemeAPI.swift
//  Incluyeme
//
//  Created by Developer on 6/3/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

enum IncluyemeURL: String{
    case baseUrl = "localhost:3000/api"
    case login = "http://localhost:3000/api/login"
    case courses = "http://localhost:3000/api/courses"
    case schedule = "http://localhost:3000/api/schedule"
    case grades = "http://localhost:3000/api/coursesgrades"

}
enum HTTPMethod: String{
    case post = "POST"
}
class IncluyemeAPI {
    static func handleError(error: Error) {
        print("Error while requesting Data: \(error.localizedDescription)")
    }
    static func service<T:Decodable>(
        method: HTTPMethod,
        urlString: IncluyemeURL,
        headers: [String: String],
        body: Data?,
        responseType: T.Type,
        responseHandler: @escaping ((T) -> (Void)),
        errorHandler: @escaping ((Error) -> (Void)) = handleError){
        
        guard let endpointUrl = URL(string: urlString.rawValue) else {
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
                print(dataResponse)
                DispatchQueue.main.async { responseHandler(dataResponse) }
            }catch{
                errorHandler(error)
            }
        }
        task.resume()
    }
}
