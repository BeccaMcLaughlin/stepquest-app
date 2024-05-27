import SwiftUI

enum CharacterType: String, CaseIterable, Decodable {
    case wizard = "wizard"
    case townfolk1 = "townfolk1"
    case townfolk2 = "townfolk2"
    case questgiver = "questgiver"
}
