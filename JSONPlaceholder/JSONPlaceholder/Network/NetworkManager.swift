//
//  NetworkManager.swift .swift
//  JSONPlaceholder
//
//  Created by Pavel Epaneshnikov on 26/5/22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func getAllPosts(_ complitionHander: @escaping ([Post]) -> Void) {
        let request = AF.request(baseURL + "posts")
        
        request.responseDecodable(of: [Post].self) { response in
            guard let posts = response.value else { return }
            complitionHander(posts)
        }
    }
    
    func getCommentsBy(_ postID: Int, complitionHandler: @escaping ([Comment]) -> Void) {
        let request = AF.request(baseURL + "posts/\(postID)/comments")
        
        request.responseDecodable(of: [Comment].self) { response in
            guard let comments = response.value else { return }
            complitionHandler(comments)
        }
            
    }
}
    
