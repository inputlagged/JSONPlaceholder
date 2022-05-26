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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCellID", for: indexPath) as! PostTableViewCell
        return cell
    }
}

