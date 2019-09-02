//
//  Photo.swift
//  Viper
//
//  Created by Victor Alejandria on 02/09/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation

struct Photo: Codable {
	let albumId: Int?
	let id: Int?
	let title: String?
	let url: String?
	let thumbnailUrl: String?

	init() {
		albumId = 0
		id = 0
		title = ""
		url = ""
		thumbnailUrl = ""
	}

	enum CodingKeys: String, CodingKey {
		case albumId = "albumId"
		case id = "id"
		case title = "title"
		case url = "url"
		case thumbnailUrl = "thumbnailUrl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		albumId = try values.decode(Int.self, forKey: .albumId)
		id = try values.decode(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
	}

}
