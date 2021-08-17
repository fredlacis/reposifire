//
//  FirebaseDecodable.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 02/07/21.
//

import Foundation

public protocol FirebaseCodable: Codable {
    
    var id: String? { get set }
    
}
