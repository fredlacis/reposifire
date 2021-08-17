//
//  AnnotationRepository.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 01/07/21.
//

import Foundation

protocol AnnotationRepository {
    
    func get(id: String, then completitionHandler: @escaping (DomainAnnotation?, Error?) -> Void)
    func list(then completitionHandler: @escaping ([DomainAnnotation]?, Error?) -> Void)
    func add(_ item: DomainAnnotation, then completitionHandler: @escaping (Error?) -> Void)
    func delete(_ item: DomainAnnotation, then completitionHandler: @escaping (Error?) -> Void)
    
}
