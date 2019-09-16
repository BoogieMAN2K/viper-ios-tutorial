//
//  String + Extansions.swift
//  Viper
//
//  Created by Victor Alejandria on 16/09/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation

extension String {

	var isValidEmail: Bool {
		let emailRegex = "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
		let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
		return  predicate.evaluate(with: self)
	}
}

