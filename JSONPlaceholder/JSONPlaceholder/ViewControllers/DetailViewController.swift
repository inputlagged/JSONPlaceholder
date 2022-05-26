//
//  DetailViewController.swift
//  JSONPlaceholder
//
//  Created by Pavel Epaneshnikov on 26/5/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailBodyLabel: UILabel!
    @IBOutlet weak var commentsTableView: UITableView! {
        didSet {
            commentsTableView.delegate = self
            commentsTableView.dataSource = self
            let nib = UINib(nibName: "CommentTableViewCell", bundle: nil)
            commentsTableView.register(nib, forCellReuseIdentifier: "CommentTableViewCellID")
        }
    }
    
    var comments: [Comment] = [] {
        didSet {
            commentsTableView.reloadData()
        }
    }
    
    var networkManager = NetworkManager()
    
    var selectedPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedPost = selectedPost {
            networkManager.getCommentsBy(selectedPost.id) { comments in
                DispatchQueue.main.async {
                    self.comments = comments
                }
            }
            print(selectedPost.title)
            self.detailTitleLabel.text = selectedPost.title
            self.detailBodyLabel.text = selectedPost.body
        }
        
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCellID", for: indexPath) as! CommentTableViewCell
        cell.configure(comments[indexPath.row])
        return cell
    }
}



