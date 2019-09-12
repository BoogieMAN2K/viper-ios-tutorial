//
//  User.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation

struct User {
	let id : Int?
	let name : String?
	let username : String?
	let email : String?
	let address : String?
	let phone : String?
	let website : String?
	let company : String?

	init() {
		self.id = 0
		self.name = ""
		self.username = ""
		self.email = ""
		self.address = ""
		self.phone = ""
		self.website = ""
		self.company = ""
	}

	init(user: ServicesUser) {
		self.id = user.id
		self.name = user.name
		self.username = user.username
		self.email = user.email
		self.address = "\(user.address?.street ?? ""), \(user.address?.suite ?? ""), \(user.address?.city ?? ""), \(user.address?.zipcode ?? "")"
		self.phone = user.phone
		self.website = user.website
		self.company = "\(user.company?.name ?? "")"
	}
}
