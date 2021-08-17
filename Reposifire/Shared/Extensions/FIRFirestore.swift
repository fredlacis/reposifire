//
//  FIRFirestore.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 02/07/21.
//

import Foundation
import Firebase

extension Firestore {
    
    func collection(_ collectionName: FirebaseColletions) -> CollectionReference {
        return self.collection(collectionName.rawValue)
    }
    
}
