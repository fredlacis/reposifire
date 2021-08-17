//
//  ViewController.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 01/07/21.
//

import UIKit
import FirebaseAuth

class MainSceneViewController: BaseViewController<MainSceneView> {
    
//    let annotationRepository: AnnotationRepository
    var interactor: MainSceneAnnotationInteractor
    
    init(interactor: MainSceneAnnotationInteractor) {
        
        self.interactor = interactor
        
        super.init(mainView: MainSceneView())
        
        self.interactor.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.fetchAnnotations()
        
        //MARK: - LIST ALL ANNOTATIONS
//        annotationRepository.list(then: { domainAnnotations, error in
//            if let _ = error {
//
//            } else {
//                let _ = domainAnnotations
//            }
//        })

        //MARK: - GET A SINGLE ANNOTATION BY ID
//        annotationRepository.get(id: "wNx9S9ZbwE1dKk6NXiF2", then: { domainAnnotation, error in
//            if let _ = error {
//
//            } else {
//                let _ = domainAnnotation
//            }
//        })
        
        //MARK: - ADD A NEW ANNOTATION
//        annotationRepository.add(DomainAnnotation(documentId: nil, title: "From app 1", subtitle: "subtitle 1", latitude: -22, longitude: -45),
//                                 then: { error in
//            if let _ = error {
//
//            }
//        })
        
        //MARK: - DELETE A SPECIFIC ANNOTATION
//        annotationRepository.get(id: "IeSCKJU8vKmnrZDOl3Im", then: { domainAnnotation, error in
//            if let _ = error {
//                
//            } else if let domainAnnotation = domainAnnotation {
//                self.annotationRepository.delete(domainAnnotation, then: { error in
//                    if let _ = error {
//                        
//                    }
//                })
//            }
//        })
        
    }

}

extension MainSceneViewController: MainSceneAnnotationInteractorDelegate {
    
    func annotationsFetched(annotations: [MainSceneAnnotationEntity]) {
        dump(annotations)
    }
    
    func errorFetchingAnnotations(error: Error) {
        fatalError(error.localizedDescription)
    }
    
    
}
