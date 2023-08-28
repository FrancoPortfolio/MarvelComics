//
//  CharactersWebService.swift
//  marvelMovies
//
//  Created by Franco Marquez on 23/08/23.
//

import Foundation
import Alamofire

class CharactersWebService{
    
    static let shared = CharactersWebService()
    
    private let publicKey = Bundle.main.object(forInfoDictionaryKey: "PKEY") as? String
    private let md5Key = Bundle.main.object(forInfoDictionaryKey: "MD5HASH") as? String
    
    func getCharacters(completion: @escaping (AFDataResponse<Data>) -> ()){
        
        AF.request("https://gateway.marvel.com/v1/public/characters?ts=1&apikey=\(publicKey ?? "")&hash=\(md5Key ?? "")").responseData{ (response: AFDataResponse<Data>) in
            
            completion(response)
            
        }
    }
    
    func getCharacterById(heroId: Int, completion: @escaping (AFDataResponse<Data>) -> ()){
        
        AF.request("https://gateway.marvel.com/v1/public/characters/\(heroId)?ts=1&apikey=\(publicKey ?? "")&hash=\(md5Key ?? "")").responseData{ (response: AFDataResponse<Data>) in
            
            completion(response)
            
        }
        
    }
}
