

import Foundation
struct Users : Codable {
	let id : Int?
	let firstName : String?
	let lastName : String?
	let maidenName : String?
	let age : Int?
	let gender : String?
	let email : String?
	let phone : String?
	let username : String?
	let password : String?
	let birthDate : String?
	let image : String?
	let bloodGroup : String?
	let height : Int?
	let weight : Double?
	let eyeColor : String?
	let hair : Hair?
	let domain : String?
	let ip : String?
	let address : Address?
	let macAddress : String?
	let university : String?
	let bank : Bank?
	let company : Company?
	let ein : String?
	let ssn : String?
	let userAgent : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case firstName = "firstName"
		case lastName = "lastName"
		case maidenName = "maidenName"
		case age = "age"
		case gender = "gender"
		case email = "email"
		case phone = "phone"
		case username = "username"
		case password = "password"
		case birthDate = "birthDate"
		case image = "image"
		case bloodGroup = "bloodGroup"
		case height = "height"
		case weight = "weight"
		case eyeColor = "eyeColor"
		case hair = "hair"
		case domain = "domain"
		case ip = "ip"
		case address = "address"
		case macAddress = "macAddress"
		case university = "university"
		case bank = "bank"
		case company = "company"
		case ein = "ein"
		case ssn = "ssn"
		case userAgent = "userAgent"
	}



}
