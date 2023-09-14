struct Pokemon : Codable {
    let name,
        url: String
}

struct Resultados : Codable {
    let results : [Pokemon]
}

struct ResultadoImage : Codable {
    let sprites : ImagePokemon
}

struct ImagePokemon : Codable {
    
    let frontDefault : String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct Abilities : Codable {
    let abilities : [Ability]
}

struct Ability : Codable {
    let ability : NameAbility
}

struct NameAbility : Codable {
    let name : String
}
