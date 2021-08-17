//
//  AppContainer.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 02/07/21.
//

import Foundation

// MARK: - Factory Protocols
protocol SceneFactory {
    
    func makeMainSceneViewController() -> MainSceneViewController
    
}


// MARK: - AppContainer
class AppContainer {
    
    private lazy var networkManager = NetworkManager()

}

extension AppContainer: SceneFactory {
    
    func makeMainSceneViewController() -> MainSceneViewController {
        let mainSceneAnnotationInteractor = MainSceneAnnotationInteractor(networkManager: networkManager)
        return MainSceneViewController(interactor: mainSceneAnnotationInteractor)
    }
    
}
