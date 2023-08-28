//
//  ComicsWebService.swift
//  marvelMovies
//
//  Created by Franco Marquez on 28/08/23.
//

import Foundation
import Alamofire

class ComicsWebService{
    
    static let shared = ComicsWebService()
    
    private let publicKey = Bundle.main.object(forInfoDictionaryKey: "PKEY") as? String
    private let md5Key = Bundle.main.object(forInfoDictionaryKey: "MD5HASH") as? String
    
    func getComics(completion: @escaping (AFDataResponse<Data>) -> ()){
        
        AF.request("https://gateway.marvel.com:443/v1/public/comics?ts=1&apikey=\(publicKey ?? "")&hash=\(md5Key ?? "")").responseData{ (response: AFDataResponse<Data>) in
            
            completion(response)
            
        }
    }
    
    func getComicById(comicId: Int, completion: @escaping (AFDataResponse<Data>) -> ()){
        
        AF.request("https://gateway.marvel.com:443/v1/public/comics/\(comicId)?ts=1&apikey=\(publicKey ?? "")&hash=\(md5Key ?? "")").responseData{ (response: AFDataResponse<Data>) in
            
            completion(response)
            
        }
        
    }
}
