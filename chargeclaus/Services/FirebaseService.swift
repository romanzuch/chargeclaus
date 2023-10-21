//
//  APIService.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 20.10.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseService {
    static let main: FirebaseService = FirebaseService()
    static private let db = Firestore.firestore()
    
    // MARK: - Collections
    private let stations: CollectionReference = db.collection("locations")
    private let connections: CollectionReference = db.collection("connections")
    private let providers: CollectionReference = db.collection("providers")
    
    func getLocations(handler: @escaping ((Result<[Location], Error>) -> Void)) {
        stations.getDocuments { (querySnapshot, error) in
            guard let query = querySnapshot else {
                if let error = error { debugPrint("ERROR >>> \(error)") }
                handler(.failure(ChargeclausError.firestoreError))
                return
            }
            let newLocations: [Location] = query.documents.compactMap { document in
                do {
                    let location: Location = try document.data(as: Location.self)
                    // Setting the provider
                    if let providerRef = location.providerRef {
                        print(providerRef.path)
                        FirebaseService.db.document(providerRef.path).getDocument { (querySnapshot, error) in
                            guard let query = querySnapshot else {
                                if let error = error { print(error.localizedDescription) }
                                handler(.failure(ChargeclausError.decodingError))
                                return
                            }
                            do {
                                location.provider = try query.data(as: Provider.self)
                            } catch {
                                print("ERROR provider >>> \(error.localizedDescription)")
                                handler(.failure(ChargeclausError.decodingError))
                            }
                        }
                    }
                    // Setting the connections
                    if let connectionsRef = location.connectionsRef {
                        var newConnections: [Connection] = []
                        for ref in connectionsRef {
                            print(ref.path)
                            FirebaseService.db.document(ref.path).getDocument { (querySnapshot, error) in
                                guard let query = querySnapshot else {
                                    if let error = error { print(error.localizedDescription) }
                                    handler(.failure(ChargeclausError.decodingError))
                                    return
                                }
                                do {
                                    let newConnection: Connection = try query.data(as: Connection.self)
                                    newConnections.append(newConnection)
                                } catch {
                                    print("ERROR connections >>> \(error.localizedDescription)")
                                }
                            }
                        }
                        location.connections = newConnections
                    }
                    return location
                } catch {
                    print(error)
                    return nil
                }
            }
            handler(.success(newLocations))
        }
    }
}
