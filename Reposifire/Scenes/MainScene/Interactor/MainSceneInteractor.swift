//
//  MainSceneInterator.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 02/07/21.
//

import Foundation
import MapKit

protocol MainSceneAnnotationInteractorDelegate {
    
    func annotationsFetched(annotations: [MainSceneAnnotationEntity])
    func errorFetchingAnnotations(error: Error)
    
}

struct MainSceneAnnotationInteractor {
    
    var networkManager: NetworkManager
    
    var delegate: MainSceneAnnotationInteractorDelegate?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchAnnotations() {
        networkManager.annotationRepository?.list(then: { domainAnnotations, error in
            if let error = error {
                delegate?.errorFetchingAnnotations(error: error)
            } else {
                guard let domainAnnotations = domainAnnotations else {
                    delegate?.errorFetchingAnnotations(error: RepositoryError.noData)
                    return
                }
                
                let entityData = domainAnnotations.compactMap { domainAnnotation -> MainSceneAnnotationEntity in
                    let cord = CLLocationCoordinate2D(latitude: domainAnnotation.latitude, longitude: domainAnnotation.longitude)
                    return MainSceneAnnotationEntity(title: domainAnnotation.title,
                                                     subtitle: domainAnnotation.subtitle,
                                                     coordinate: cord)
                }
                
                delegate?.annotationsFetched(annotations: entityData)
                return
            }
        })
    }
    
}

//let fetchedAnnotations = querySnapshot.documents.compactMap { queryDocumentSnapshot -> DomainAnnotation? in
//    return try? queryDocumentSnapshot.data(as: DomainAnnotation.self, with: queryDocumentSnapshot.documentID)
//}
