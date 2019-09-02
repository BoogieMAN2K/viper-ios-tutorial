//
//  Album.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation

struct Album: Codable {
	let userId: Int?
	let id: Int?
	let description: String?

	init() {
		userId = 0
		id = 0
		description = ""
	}

	enum CodingKeys: String, CodingKey {
		case userId = "userId"
		case id = "id"
		case description = "description"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		let userIdString = try values.decode(String.self, forKey: .userId)
		let idString = try values.decode(String.self, forKey: .id)
		userId = Int(userIdString) ?? 0
		id = Int(idString) ?? 0
		description = try values.decodeIfPresent(String.self, forKey: .description)
	}

}
