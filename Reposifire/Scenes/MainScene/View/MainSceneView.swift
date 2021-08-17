//
//  MainSceneView.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 01/07/21.
//

import UIKit

class MainSceneView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemRed
    }

}
