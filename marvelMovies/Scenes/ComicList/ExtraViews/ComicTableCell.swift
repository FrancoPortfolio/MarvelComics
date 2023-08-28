//
//  ComicTableCell.swift
//  marvelMovies
//
//  Created by Franco Marquez on 28/08/23.
//

import UIKit
import Foundation

class ComicTableCell: UITableViewCell{
    
    static let id = "comicListTableCell"
    
    private var comicName: UILabel!
    private var thumbnail: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            thumbnail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            thumbnail.widthAnchor.constraint(equalToConstant: contentView.frame.height * 0.9),
            thumbnail.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.9),
            thumbnail.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            comicName.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor,constant: 40),
            comicName.topAnchor.constraint(equalTo: contentView.topAnchor),
            comicName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            comicName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30)
        ])
        
    }
    
    private func makeHeroName() {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        self.comicName = label
    }
    
    private func makeViews(){
        
        makeHeroName()
        makeHeroImage()
        contentView.addSubview(thumbnail)
        contentView.addSubview(comicName)
    }
    
    private func makeHeroImage(){
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.thumbnail = imageView
    }
    
    func setName(name: String){
        self.comicName.text = name
    }
    
    func setImage(url: URL){
        
        thumbnail.sd_setImage(with: url, placeholderImage: UIImage(named: "MarvelBackground"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("a")
    }
    
}
