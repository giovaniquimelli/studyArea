//
//  Messages.swift
//  StudyArea
//
//  Created by Gio on 02/02/22.
//

import Foundation

struct Messages {
    let text: String
    let sender: MessageSender
//    let senderId: String
//    let profilePictureRef: String?
}

enum MessageSender: Int {
    case system = 0, teacher, student
}
