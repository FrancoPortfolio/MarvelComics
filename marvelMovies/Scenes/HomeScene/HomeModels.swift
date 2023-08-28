//
//  HomeModels.swift
//  marvelMovies
//
//  Created by Franco Marquez on 23/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the StartApps CleanSwift Xcode Templates. V2.0
//  By Gabriel Lanata (http://StartApps.pe) with credit to http://clean-swift.com
//

import Foundation

enum HomeScene {
    
    enum initialLoad {
        
        struct Request {
        }
        struct Response {
            let characterResponse: ResponseCharacters
        }
        struct ViewModel {
            struct HeroProfileInitialDataLoad{
                
                let heros: [HeroProfileData]
                
                struct HeroProfileData{
                    let name: String
                    let photoURL: String
                    let heroId: Int
                }
            }
        }
        
    }
    
    enum AlertError {
        
        struct Response {
            let error: Error
        }
        struct ViewModel {
            let message: String
        }
        
    }

}
