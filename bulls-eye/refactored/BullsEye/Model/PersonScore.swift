struct PersonScore: Codable {
  let name: String?
  let score: Int?

  private enum CodingKeys: String, CodingKey {
    case name
    case score
  }
}
