//
//  Address.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation

struct Address: Codable {
	let street : String?
	let suite : String?
	let city : String?
	let zipcode : String?
	let geo : Geocode?

	init() {
		street = ""
		suite = ""
		city = ""
		zipcode = ""
		geo = Geocode()
	}

	enum CodingKeys: String, CodingKey {
		case street = "street"
		case suite = "suite"
		case city = "city"
		case zipcode = "zipcode"
		case geo = "geo"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		street = try values.decodeIfPresent(String.self, forKey: .street)
		suite = try values.decodeIfPresent(String.self, forKey: .suite)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
		geo = try values.decodeIfPresent(Geocode.self, forKey: .geo)
	}
}
