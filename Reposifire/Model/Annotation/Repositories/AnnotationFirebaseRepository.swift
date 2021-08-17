//
//  AnnotationFirebaseRepository.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 01/07/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct AnnotationFirebaseRepository: AnnotationRepository {
    
    let collection = Firestore.firestore().collection(.annotations)
 
    func get(id: String, then completitionHandler: @escaping (DomainAnnotation?, Error?) -> Void) {
        collection.document(id).getDocument(completion: { querySnapshot, error in
                if let error = error {
                    // Error on fetch data
                    completitionHandler(nil, error)
                    return
                } else {
                    // Data fetched
                    if let querySnapshot = querySnapshot,
                       let fetchedAnnotation = try? querySnapshot.data(as: DomainAnnotation.self, with: querySnapshot.documentID) {
                        // Document successfuly parsed
                        completitionHandler(fetchedAnnotation, nil)
                        return
                    }
                    
                    // Could not parse document
                    completitionHandler(nil, RepositoryError.unableToParse)
                    return
                }
            })
    }
    
    func list(then completitionHandler: @escaping ([DomainAnnotation]?, Error?) -> Void) {
        collection.getDocuments(completion: { querySnapshot, error in
            if let error = error {
                // Error on fetch data
                completitionHandler(nil, error)
                return
            } else {
                // Data fetched
                guard let querySnapshot = querySnapshot else {
                    // Error empty documents
                    completitionHandler(nil, RepositoryError.noData)
                    return
                }
                
                let fetchedAnnotations = querySnapshot.documents.compactMap { queryDocumentSnapshot -> DomainAnnotation? in
                    return try? queryDocumentSnapshot.data(as: DomainAnnotation.self, with: queryDocumentSnapshot.documentID)
                }
                
                // Documents successfuly parsed
                completitionHandler(fetchedAnnotations, nil)
                return
            }
        })
    }
    
    func add(_ item: DomainAnnotation, then completitionHandler: @escaping (Error?) -> Void) {
        do {
            let _ = try collection.addDocument(from: item, completion: { error in
                if let error = error {
                    completitionHandler(error)
                    return
                } else {
                    completitionHandler(nil)
                    return
                }
            })
        } catch {
            completitionHandler(error)
            return
        }
    }
    
    func delete(_ item: DomainAnnotation, then completitionHandler: @escaping (Error?) -> Void) {
        if let documentId = item.id {
            collection.document(documentId).delete(completion: { error in
                if let error = error {
                    completitionHandler(error)
                    return
                } else {
                    completitionHandler(nil)
                    return
                }
            })
        } else {
            completitionHandler(RepositoryError.incompleteItem)
            return
        }
    }
    
}
