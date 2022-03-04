//
//  String+extension.swift
//  UPLogs
//
//  Created by erbittuu on 08/14/2020.
//  Copyright (c) 2020 erbittuu. All rights reserved.
//

import Foundation

extension String {
    /// The last path component of the receiver.
    var lastPathComponent: String {
        return NSString(string: self).lastPathComponent
    }

    /// A new string made by deleting the extension from the receiver.
    var stringByDeletingPathExtension: String {
        return NSString(string: self).deletingPathExtension
    }
}
