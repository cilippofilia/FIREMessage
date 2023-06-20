//
//  Message.swift
//  FIREMessage
//
//  Created by Filippo Cilia on 20/06/2023.
//

import SwiftUI

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date

#if DEBUG
    static let testMessageR = Message(id: "01",
                                     text: "I have been coding SwiftUI application from scratch and it's sooooo much FUN!!!",
                                     received: false,
                                     timestamp: Date())

    static let testMessageS = Message(id: "02",
                                      text: "I KNOW!! To bad it is not natively cross platform with Android",
                                      received: true,
                                      timestamp: Date())
#endif
}
