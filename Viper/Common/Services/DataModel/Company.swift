//
//  Company.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation

struct Company: Codable {
	let name : String?
	let catchPhrase : String?
	let bs : String?

	init() {
		name = ""
		catchPhrase = ""
		bs = ""
	}

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case catchPhrase = "catchPhrase"
		case bs = "bs"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase)
		bs = try values.decodeIfPresent(String.self, forKey: .bs)
	}
}
