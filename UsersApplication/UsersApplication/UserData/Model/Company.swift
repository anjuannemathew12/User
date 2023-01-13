
import Foundation
struct Company : Codable {
	let address : Address?
	let department : String?
	let name : String?
	let title : String?

	enum CodingKeys: String, CodingKey {

		case address = "address"
		case department = "department"
		case name = "name"
		case title = "title"
	}



}
