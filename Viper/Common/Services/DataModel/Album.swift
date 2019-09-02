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
	let title: String?

	init() {
		userId = 0
		id = 0
		title = ""
	}

	enum CodingKeys: String, CodingKey {
		case userId = "userId"
		case id = "id"
		case title = "title"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		userId = try values.decode(Int.self, forKey: .userId)
		id = try values.decode(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}

}
