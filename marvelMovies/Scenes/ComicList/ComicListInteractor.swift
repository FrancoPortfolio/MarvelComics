//
//  ComicListInteractor.swift
//  marvelMovies
//
//  Created by Franco Marquez on 28/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the StartApps CleanSwift Xcode Templates. V2.0
//  By Gabriel Lanata (http://StartApps.pe) with credit to http://clean-swift.com
//

import Foundation

class ComicListInteractor {

    var presenter: ComicListPresenter?

    // MARK: - Object variables

    // var loadAction: loadAction!

    // MARK: - Business logic

    func doInitialComicListDataLoad(request: ComicListScene.InitialComicListDataLoad.Request) {
        // NOTE: Pass the result to the Presenter
        
        ComicsWebService.shared.getComics { response in
            
            switch response.result{
                
            case .success(let data):
                
                do {
                    
                    let finalData = try JSONDecoder().decode(ComicsResponse.self, from: data)
                    self.presenter?.presentInitialComicListDataLoad(response: ComicListScene.InitialComicListDataLoad.Response(comicsResponse: finalData))
                    
                } catch {
                    print(error)
                    self.presenter?.presentAlertError(response: ComicListScene.AlertError.Response(error: error))
                }
                
            case .failure(let error):
                
                self.presenter?.presentAlertError(response: ComicListScene.AlertError.Response(error: error))
                
            }
            
        }
        
    }

}
