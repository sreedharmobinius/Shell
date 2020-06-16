struct User: Codable {
    let userId: Int
    let titleValue: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case titleValue = "title"
    }
}
