//
//  Post.swift
//  JSONPlaceholder
//
//  Created by Pavel Epaneshnikov on 26/5/22.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
