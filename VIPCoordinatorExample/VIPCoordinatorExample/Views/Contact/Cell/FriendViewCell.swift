//
//  FriendViewCell.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright © 2019 TEQ. All rights reserved.
//

import UIKit

class FriendViewCell: UITableViewCell {
    func displayFriendFullName(firstName: String, lastName: String) {
        self.textLabel!.text = "\(firstName) \(lastName)"
    }

}
