//
//  InitialScreenViewController.swift
//  marvelMovies
//
//  Created by Franco Marquez on 23/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the StartApps CleanSwift Xcode Templates. V2.0
//  By Gabriel Lanata (http://StartApps.pe) with credit to http://clean-swift.com
//

import UIKit

class InitialScreenViewController: UIViewController {

    var interactor: InitialScreenInteractor!
    var router: InitialScreenRouter!

    // MARK: - Object variables

    // NOTE: Only store objects here if required
    // private var displayedSomethings: [InitialScreen]?

    // MARK: - Inteface objects
    
    var background: UIImageView!
    var nextButton: UIButton!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        InitialScreenConfigurator.configure(viewController: self)
        setupView()
        doInitialScreen()
    }

    func setupView() {
        makeBackground()
        makeButton()
        view.addSubview(background)
        view.addSubview(nextButton)
        
        layoutSetup()
    }
    
    func makeBackground() {
        let imageView = UIImageView()
         
         imageView.image = UIImage(named: "MarvelBackground")
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleToFill
         imageView.clipsToBounds = true
        
        background = imageView
    }
    
    func makeButton(){
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Iniciar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(onNextButtonPressed), for: .touchUpInside)
        
        nextButton = button
    }
    
    // MARK: - Interaction handling

    // @IBAction func buttonPressed() { ...

    @objc private func onNextButtonPressed(){
        print("Button pressed")
        self.router.navigateToHomePage()
    }
    
    // MARK: - Event handling

    func doInitialScreen() {
        // NOTE: Ask the Interactor to do some work
        // NOTE: Start loading animation here
        interactor.doInitialScreen(request: InitialScreenScene.InitialScreen.Request())
    }

    // MARK: - Display logic
    
    func displayInitialScreen(viewModel: InitialScreenScene.InitialScreen.ViewModel) {
        // NOTE: Stop loading animation here
        // NOTE: Display the result from the Presenter
        // somethingLabel.text = viewModel.name
    }
    
    func displayAlertError(viewModel: InitialScreenScene.AlertError.ViewModel) {
        // NOTE: Stop loading animation here
        let alert = UIAlertController(title: "Error", message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func layoutSetup(){
        background.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        background.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        background.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.4).isActive = true
    }
    

}
