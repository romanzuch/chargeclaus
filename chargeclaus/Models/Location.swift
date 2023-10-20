//
//  Location.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 15.10.23.
//

import Foundation
import SwiftData
import FirebaseFirestoreSwift

@Model
final class Location: Codable {
    let id: UUID = UUID()
    var address: Address
    var provider: Provider
    var connections: [Connection]
    var status: Status
    
    enum CodingKeys: CodingKey {
        case address, provider, connections, status
    }
    
    init(address: Address, provider: Provider, connections: [Connection], status: Status) {
        self.address = address
        self.provider = provider
        self.connections = connections
        self.status = status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(Address.self, forKey: .address)
        self.provider = try container.decode(Provider.self, forKey: .provider)
        self.connections = try container.decode([Connection].self, forKey: .connections)
        self.status = try container.decode(Status.self, forKey: .status)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

@Model
final class Address: Codable {
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
    
    init(from decoder: Decoder) throws {
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
    
}

@Model
final class Provider: Codable {
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.address = try container.decode(Address.self, forKey: .address)
        self.communication = try container.decode(Communication.self, forKey: .communication)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

@Model
final class Communication: Codable {
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
        let _web = try container.decode(String.self, forKey: .web)
        self.web = URL(string: _web)!
        self.phone = try container.decode(String.self, forKey: .phone)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

@Model
final class Connection: Codable {
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
    
    init(from decoder: Decoder) throws {
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
    case typeTwo = "Type-2"
    case ccs = "CCS"
    case unknown = "UNKNOWN"
}
