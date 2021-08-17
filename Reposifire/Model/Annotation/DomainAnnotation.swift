//
//  DomainAnnotation.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 01/07/21.
//

import Foundation

struct DomainAnnotation: FirebaseCodable {
    var id: String?
    var title: String
    var subtitle: String
    var latitude: Double
    var longitude: Double
}
