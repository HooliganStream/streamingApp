//
//  EventCell.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/02.
//

import Foundation
import UIKit

class EventCell: UICollectionViewCell {
    static var reuseIdentifier:String = "EventCell"
    var title:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var subTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var date:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var image:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
   
    
    override init(frame:CGRect){
        super.init(frame:frame)
        addSubViews()
        addConstraints()
    }

    func addSubViews(){
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(subTitle)
        contentView.addSubview(date)
    }
    func addConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 3),
            image.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant: 3),
            image.widthAnchor.constraint(equalToConstant: 120),
            image.bottomAnchor.constraint(equalTo:contentView.bottomAnchor, constant: -3),
            
            title.topAnchor.constraint(equalTo: image.topAnchor),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 3),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -3),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 3),
            subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            subTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -3),
            date.bottomAnchor.constraint(equalTo:contentView.bottomAnchor, constant: -3),
            date.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 3),
            
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
