//
//  Location.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Location: Codable {
    let id: UUID = UUID()
    var address: Address
    var coordinates: LocationCoordinates
    var provider: Provider?
    var providerRef: DocumentReference?
    var connections: [Connection]?
    var connectionsRef: [DocumentReference]?
    var status: Status
    
    enum CodingKeys: CodingKey {
        case address, coordinates, provider, connections, status
    }
    
    static let example = Location(
        address: Address(
            street: "Dunckerstr. 89",
            streetAdditional: "",
            city: "Berlin",
            postcode: "10437",
            country: "Deutschland",
            state: "Berlin"
        ),
        coordinates: LocationCoordinates(
            lat: 52.54371,
            lng: 13.42171
        ),
        provider: Provider(
            name: "Chargecloud GmbH",
            address: Address(
                street: "Teststr. 1",
                streetAdditional: "",
                city: "Köln",
                postcode: "60738",
                country: "Deutschland",
                state: "NRW"
            ),
            communication: Communication(
                email: "info@chargecloud.de",
                web: URL(string: "https://www.chargecloud.de")!,
                phone: "+4912345678"
            )
        ),
        connections: [
            Connection(
                evse: "DE*CHC*E1*1234*23",
                status: .available, 
                power: 21,
                type: .typeTwo
            )
        ],
        status: .occupied
    )
    
    init(address: Address, coordinates: LocationCoordinates, provider: Provider, connections: [Connection], status: Status) {
        self.address = address
        self.coordinates = coordinates
        self.provider = provider
        self.connections = connections
        self.status = status
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(Address.self, forKey: .address)
        self.coordinates = try container.decode(LocationCoordinates.self, forKey: .coordinates)
        self.providerRef = try container.decode(DocumentReference.self, forKey: .provider)
        self.connectionsRef = try container.decode([DocumentReference].self, forKey: .connections)
        self.status = try container.decode(Status.self, forKey: .status)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

class Address: Codable {
    var street: String
    var streetAdditional: String
    var city: String
    var postcode: String
    var country: String
    var state: String
    
    enum CodingKeys: CodingKey {
        case street, streetAdditional, city, postcode, country, state
    }
    
    init(street: String, streetAdditional: String, city: String, postcode: String, country: String, state: String) {
        self.street = street
        self.streetAdditional = streetAdditional
        self.city = city
        self.postcode = postcode
        self.country = country
        self.state = state
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decode(String.self, forKey: .street)
        self.streetAdditional = try container.decode(String.self, forKey: .streetAdditional)
        self.city = try container.decode(String.self, forKey: .city)
        self.postcode = try container.decode(String.self, forKey: .postcode)
        self.country = try container.decode(String.self, forKey: .country)
        self.state = try container.decode(String.self, forKey: .state)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
    
    func getFullAddress() -> String {
        return "\(self.street), \(self.postcode) \(self.city), \(self.country)"
    }
    
}

class LocationCoordinates: Codable {
    var lat: Float
    var lng: Float
    
    enum CodingKeys: CodingKey {
        case lat, lng
    }
    
    init(lat: Float, lng: Float) {
        self.lat = lat
        self.lng = lng
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lat = try container.decode(Float.self, forKey: .lat)
        self.lng = try container.decode(Float.self, forKey: .lng)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

class Provider: Codable {
    var name: String
    var address: Address
    var communication: Communication
    
    enum CodingKeys: CodingKey {
        case name, address, communication
    }
    
    init(name: String, address: Address, communication: Communication) {
        self.name = name
        self.address = address
        self.communication = communication
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.address = try container.decode(Address.self, forKey: .address)
        self.communication = try container.decode(Communication.self, forKey: .communication)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

class Communication: Codable {
    var email: String
    var web: URL
    var phone: String
    
    enum CodingKeys: CodingKey {
        case email, web, phone
    }
    
    init(email: String, web: URL, phone: String) {
        self.email = email
        self.web = web
        self.phone = phone
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
        let _web = try container.decode(String.self, forKey: .web)
        self.web = URL(string: _web)!
        self.phone = try container.decode(String.self, forKey: .phone)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

class Connection: Codable {
    var evse: String
    var status: Status
    var power: Int
    var type: ConnectionType
    
    enum CodingKeys: CodingKey {
        case evse, status, power, type
    }
    
    init(evse: String, status: Status, power: Int, type: ConnectionType) {
        self.evse = evse
        self.status = status
        self.power = power
        self.type = type
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.evse = try container.decode(String.self, forKey: .evse)
        let _status = try container.decode(String.self, forKey: .status)
        self.status = Status(rawValue: _status) ?? Status.unknown
        self.power = try container.decode(Int.self, forKey: .power)
        let _type = try container.decode(String.self, forKey: .type)
        self.type = ConnectionType(rawValue: _type) ?? ConnectionType.unknown
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

enum Status: String, Codable {
    case available = "AVAILABLE"
    case occupied = "OCCUPIED"
    case unknown = "UNKNOWN"
}

enum ConnectionType: String, Codable {
    case typeTwo = "Type 2"
    case ccs = "CCS"
    case unknown = "UNKNOWN"
}

