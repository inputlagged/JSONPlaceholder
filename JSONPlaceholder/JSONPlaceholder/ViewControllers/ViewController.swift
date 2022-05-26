//
//  ViewController.swift
//  JSONPlaceholder
//
//  Created by Pavel Epaneshnikov on 26/5/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var postTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
            postTableView.register(nib, forCellReuseIdentifier: "PostTableViewCellID")
            postTableView.delegate = self
            postTableView.dataSource = self
        }
    }
    
    var networkManager = NetworkManager()

    var posts: [Post] = [] {
        didSet {
            postTableView.reloadData()
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.getAllPosts { posts in
            DispatchQueue.main.async {
                self.posts = posts
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        if let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewControllerID") as? DetailViewController {
            detailVC.selectedPost = post
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
       
    }
    

}


// MARK: Delegate, DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCellID", for: indexPath) as! PostTableViewCell
        cell.configure(posts[indexPath.row])
        return cell
    }
}

