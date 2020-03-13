//
//  GitHomeCell.swift
//  Git
//
//  Created by anunes on 02/03/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import UIKit

protocol GitCellRepresentable {
    var title: String?{get set}
    var description: String?{get set}
    var likes: String?{get set}
    var shared: String?{get set}
    var avatar: String?{get set}
    var userName: String?{get set}
    var surName: String?{get set}
}

class GitHomeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var sharedLabel: UILabel!
    @IBOutlet weak var avatarImagem: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var surNameLabel: UILabel!

    static let identifier = "GitHomeCellID"
    static let nibName = "GitHomeCell"


    var viewModel: GitCellRepresentable? {
        didSet{
            guard let viewModel = viewModel else {
                titleLabel.text = nil
                descriptionLabel.text = nil
                likesLabel.text = nil
                sharedLabel.text = nil
                avatarImagem.image = nil
                userNameLabel.text = nil
                surNameLabel.text = nil
                return
            }
            titleLabel.text = viewModel.title
            descriptionLabel.text = viewModel.description
            likesLabel.text = viewModel.likes
            sharedLabel.text = viewModel.shared
            userNameLabel.text = viewModel.userName
            surNameLabel.text = viewModel.surName

            likesLabel.isAccessibilityElement = true
            likesLabel.accessibilityLabel = "Star"

            sharedLabel.isAccessibilityElement = true
            sharedLabel.accessibilityLabel = "Shared"

            if let avatar = viewModel.avatar{
                avatarImagem.isAccessibilityElement = true
                avatarImagem.accessibilityLabel = "Avatar imagem"
                avatarImagem.loadImage(from: avatar)
            }
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }
    
}
