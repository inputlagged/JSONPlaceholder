//
//  PostTableViewCell.swift
//  JSONPlaceholder
//
//  Created by Pavel Epaneshnikov on 26/5/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    
    func configure(_ post: Post) {
        self.postTitleLabel.text = post.title
        self.postBodyLabel.text = post.body
    }
}
