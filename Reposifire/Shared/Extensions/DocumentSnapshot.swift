//
//  DocumentSnapshot.swift
//  Reposifire
//
//  Created by Frederico Lacis de Carvalho on 02/07/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

extension DocumentSnapshot {
    
    public func data<T: FirebaseCodable>(as type: T.Type, with id: String) throws -> T? {
      
        if var decodedData = try? self.data(as: T.self) {
            decodedData.id = self.documentID
            return decodedData
        }
        return nil
        
    }
    
}
