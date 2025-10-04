//
//  Manifest+Category.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 22.02.2021.
//

extension Manifest {
    public struct Category: Codable, ExpressibleByStringLiteral, CustomStringConvertible {
        public var value: String
        public var description: String { value }
        
        public init(_ value: String) {
            self.value = value
        }
        
        public init(stringLiteral value: String) {
            self.value = value
        }
        
        @MainActor public static var books: Self = "books"
        @MainActor public static var business: Self = "business"
        @MainActor public static var education: Self = "education"
        @MainActor public static var entertainment: Self = "entertainment"
        @MainActor public static var finance: Self = "finance"
        @MainActor public static var fitness: Self = "fitness"
        @MainActor public static var food: Self = "food"
        @MainActor public static var games: Self = "games"
        @MainActor public static var government: Self = "government"
        @MainActor public static var health: Self = "health"
        @MainActor public static var kids: Self = "kids"
        @MainActor public static var lifestyle: Self = "lifestyle"
        @MainActor public static var magazines: Self = "magazines"
        @MainActor public static var medical: Self = "medical"
        @MainActor public static var music: Self = "music"
        @MainActor public static var navigation: Self = "navigation"
        @MainActor public static var news: Self = "news"
        @MainActor public static var personalization: Self = "personalization"
        @MainActor public static var photo: Self = "photo"
        @MainActor public static var politics: Self = "politics"
        @MainActor public static var productivity: Self = "productivity"
        @MainActor public static var security: Self = "security"
        @MainActor public static var shopping: Self = "shopping"
        @MainActor public static var social: Self = "social"
        @MainActor public static var sports: Self = "sports"
        @MainActor public static var travel: Self = "travel"
        @MainActor public static var utilities: Self = "utilities"
        @MainActor public static var weather: Self = "weather"
    }
}
