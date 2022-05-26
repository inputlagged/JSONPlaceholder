//
//  Comment.swift
//  JSONPlaceholder
//
//  Created by Pavel Epaneshnikov on 26/5/22.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
