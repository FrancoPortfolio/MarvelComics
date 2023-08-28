//
//  HomeHeroTableCell.swift
//  marvelMovies
//
//  Created by Franco Marquez on 25/08/23.
//

import UIKit

class HomeHeroTableCell: UITableViewCell{
    
    static let id = "homeHeroTableCell"
    
    private var heroName: UILabel!
    private var profileImage: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            profileImage.widthAnchor.constraint(equalToConstant: contentView.frame.height * 0.9),
            profileImage.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.9),
            profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            heroName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor,constant: 40),
            heroName.topAnchor.constraint(equalTo: contentView.topAnchor),
            heroName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            heroName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    private func makeHeroName() {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        self.heroName = label
    }
    
    private func makeViews(){
        
        makeHeroName()
        makeHeroImage()
        contentView.addSubview(profileImage)
        contentView.addSubview(heroName)
    }
    
    private func makeHeroImage(){
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.profileImage = imageView
    }
    
    func setName(name: String){
        self.heroName.text = name
    }
    
    func setImage(urlString: String){
        
        guard let url = URL(string: urlString) else { return }
        
        profileImage.sd_setImage(with: url, placeholderImage: UIImage(named: "MarvelBackground"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("a")
    }
    
}
