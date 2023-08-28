//
//  ComicDetailViewController.swift
//  marvelMovies
//
//  Created by Franco Marquez on 28/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the StartApps CleanSwift Xcode Templates. V2.0
//  By Gabriel Lanata (http://StartApps.pe) with credit to http://clean-swift.com
//

import UIKit

class ComicDetailViewController: UIViewController {

    var interactor: ComicDetailInteractor!
    var router: ComicDetailRouter!

    // MARK: - Object variables

    // NOTE: Only store objects here if required
    // private var displayedSomethings: [InitialLoadComicDetail]?
    var comicId: Int?

    // MARK: - Inteface objects

    // @IBOutlet private weak var somethingLabel: UILabel!
    private var spinner : UIActivityIndicatorView!
    private var comicNameLabel: UILabel!
    private var comicPhoto: UIImageView!
    private var comicDescription: UILabel!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        doInitialLoadComicDetail()
    }

    func setupView() {
        view.backgroundColor = .white
        // NOTE: Setup the view on load
        // somethingLabel.textColor = UIColor.blue
        makeComicTitle()
        makeComicPhotoView()
        makeComicDescription()
        makeSpinner()
        
        view.addSubview(comicNameLabel)
        view.addSubview(comicPhoto)
        view.addSubview(comicDescription)
        view.addSubview(spinner)
        
        makeLayout()
    }
    
    private func makeComicTitle(){
        let label = UILabel()
        
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "GAAAAAA"
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.comicNameLabel = label
    }
    
    private func makeComicPhotoView(){
        
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.comicPhoto = imageView
    }
    
    private func makeComicDescription(){
        
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.comicDescription = label
    }
    
    func makeSpinner(){
        let spinner = UIActivityIndicatorView()
        
        spinner.hidesWhenStopped = true
        spinner.isHidden = false
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        self.spinner = spinner
    }
    
    private func makeLayout(){
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            comicNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            comicNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            comicNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            comicPhoto.topAnchor.constraint(equalTo: comicNameLabel.bottomAnchor, constant: 20),
            comicPhoto.heightAnchor.constraint(equalToConstant: 200),
            comicPhoto.widthAnchor.constraint(equalToConstant: 200),
            comicPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            comicDescription.topAnchor.constraint(equalTo: comicPhoto.bottomAnchor, constant: 20),
            comicDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            comicDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
    }

    // MARK: - Interaction handling

    // @IBAction func buttonPressed() { ...

    // MARK: - Event handling

    func doInitialLoadComicDetail() {
        // NOTE: Ask the Interactor to do some work
        // NOTE: Start loading animation here
        
        
        
        guard let comicId = self.comicId else {
            print("Error")
            return
        }
        
        spinner.startAnimating()
        
        interactor.doInitialLoadComicDetail(request: ComicDetailScene.InitialLoadComicDetail.Request(comicId: comicId))
    }

    // MARK: - Display logic
    
    func displayInitialLoadComicDetail(viewModel: ComicDetailScene.InitialLoadComicDetail.ViewModel) {
        // NOTE: Stop loading animation here
        // NOTE: Display the result from the Presenter
        // somethingLabel.text = viewModel.name
        
        self.title = viewModel.comicTitle

        comicNameLabel.text = viewModel.comicTitle
        comicNameLabel.isHidden = false
        
        comicPhoto.sd_setImage(with: viewModel.comicPhotoURL)
        comicPhoto.isHidden = false
        
        if viewModel.comicDescription.isEmpty{
            comicDescription.text = "No hay descripción disponible :( == Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vitae dignissim risus. Praesent purus sapien, ullamcorper in condimentum at, efficitur ut neque. Ut laoreet, turpis ac blandit ornare, ligula quam vestibulum augue, sed imperdiet tellus velit vel nunc. Vestibulum et mi placerat, tristique lectus nec, efficitur metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique ultricies quam at tempor. Suspendisse pulvinar commodo turpis, in consectetur erat. Ut lobortis arcu ut consequat hendrerit. Cras vitae turpis in enim ultrices viverra ut nec lorem."
        }else{
            comicDescription.text = viewModel.comicDescription
        }
        comicDescription.isHidden = false
        
        spinner.stopAnimating()
        
        
    }
    
    func displayAlertError(viewModel: ComicDetailScene.AlertError.ViewModel) {
        
        spinner.stopAnimating()
        // NOTE: Stop loading animation here
        let alert = UIAlertController(title: "Error", message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
