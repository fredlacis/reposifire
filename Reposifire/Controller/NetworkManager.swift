//
//  NetworkManager.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 02/07/21.
//

import Foundation

protocol AnnotationNetwork {
    
    func get(id: String, then completitionHandler: @escaping (DomainAnnotation?, Error?) -> Void)
    func list(then completitionHandler: @escaping ([DomainAnnotation]?, Error?) -> Void)
    func add(_ item: DomainAnnotation, then completitionHandler: @escaping (Error?) -> Void)
    func delete(_ item: DomainAnnotation, then completitionHandler: @escaping (Error?) -> Void)
    
}

struct NetworkManager {
    
    var annotationRepository: AnnotationRepository?
    
    init() {
        self.annotationRepository = AnnotationFirabaseRepository()
    }
    
}

extension NetworkManager: AnnotationNetwork {
    
    func get(id: String, then completitionHandler: @escaping (DomainAnnotation?, Error?) -> Void) {
        // Pega do Firebase ou do Cache
    }
    
    func list(then completitionHandler: @escaping ([DomainAnnotation]?, Error?) -> Void) {
        //
    }
    
    func add(_ item: DomainAnnotation, then completitionHandler: @escaping (Error?) -> Void) {
        //
    }
    
    func delete(_ item: DomainAnnotation, then completitionHandler: @escaping (Error?) -> Void) {
        //
    }
    
    
}
