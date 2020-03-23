//
//  DetailsCell.swift
//  GitProject
//
//  Created by anunes on 23/03/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import UIKit

protocol PullRepresentable {
    var title: String? { get }
    var avatar: String? { get }
    var fullName: String? { get }
}

class DetailsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImagem: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!

    var viewModel: PullRepresentable? {
        didSet {
            guard let viewModel = viewModel else {
                titleLabel.text = nil
                fullNameLabel.text = nil
                avatarImagem.image = nil
                return
            }
            titleLabel.text = viewModel.title
            titleLabel.isAccessibilityElement = true
            fullNameLabel.text = viewModel.fullName
            fullNameLabel.isAccessibilityElement = true
            if let avatar = viewModel.avatar {
                avatarImagem.isAccessibilityElement = true
                avatarImagem.loadImage(from: avatar)
            }
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }

}
