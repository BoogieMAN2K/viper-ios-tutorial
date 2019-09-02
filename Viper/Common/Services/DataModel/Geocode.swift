//
//  Geocode.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation

struct Geocode: Codable {
	let lat : Double?
	let lng : Double?

	init() {
		lat = 0
		lng = 0
	}

	enum CodingKeys: String, CodingKey {
		case lat = "lat"
		case lng = "lng"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		let latString = try values.decode(String.self, forKey: .lat)
		let lngString = try values.decode(String.self, forKey: .lng)
		lat = Double(latString) ?? 0
		lng = Double(lngString) ?? 0
	}
}
