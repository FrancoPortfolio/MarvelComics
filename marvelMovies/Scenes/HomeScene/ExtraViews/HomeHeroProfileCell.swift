//
//  HomeHeroProfileCell.swift
//  marvelMovies
//
//  Created by Franco Marquez on 23/08/23.
//

import UIKit
import SDWebImage

class HomeHeroProfileCell: UICollectionViewCell{
    
    static let id = "HomeHeroProfileCell"
    
    private var heroName: UILabel!
    private var profileImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeViews()
    }
    
    private func makeViews(){
        makeHeroName()
        makeProfileImage()
        contentView.addSubview(heroName)
        contentView.addSubview(profileImage)
    }
    
    override func layoutSubviews() {
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 80),
            profileImage.heightAnchor.constraint(equalToConstant: 80),
            profileImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            heroName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 0),
            heroName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            heroName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            heroName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    private func makeHeroName(){
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        self.heroName = label
    }
    
    private func makeProfileImage(){
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.layer.borderWidth = 0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.profileImage = imageView
    }
    
    func setHeroName(name: String){
        heroName.text = name
    }
    
    func setHeroImage(Url: String){
        guard let url = URL(string: Url) else { return }
        
        profileImage.sd_setImage(with: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("a")
    }
    
}


