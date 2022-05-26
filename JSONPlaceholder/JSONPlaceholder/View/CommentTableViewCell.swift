//
//  CommentTableViewCell.swift
//  JSONPlaceholder
//
//  Created by Pavel Epaneshnikov on 26/5/22.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func configure(_ comment: Comment) {
        self.nameLabel.text = comment.name
        self.emailLabel.text = comment.email
        self.bodyLabel.text = comment.body
    }
}
