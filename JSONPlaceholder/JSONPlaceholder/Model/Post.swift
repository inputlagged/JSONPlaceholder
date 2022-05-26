//
//  Post.swift
//  JSONPlaceholder
//
//  Created by Pavel Epaneshnikov on 26/5/22.
//

import Foundation

class Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
