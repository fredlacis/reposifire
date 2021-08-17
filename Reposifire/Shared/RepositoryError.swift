//
//  RepositoryError.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 01/07/21.
//

import Foundation

enum RepositoryError: Error {
    case notFound
    case noData
    case cantSave
    case unableToParse
    case incompleteItem
}
