

import Foundation
struct Address : Codable {
	let address : String?
	let city : String?
	let coordinates : Coordinates?
	let postalCode : String?
	let state : String?

	enum CodingKeys: String, CodingKey {

		case address = "address"
		case city = "city"
		case coordinates = "coordinates"
		case postalCode = "postalCode"
		case state = "state"
	}



}
