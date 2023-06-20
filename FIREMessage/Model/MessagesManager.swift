//
//  MessagesManager.swift
//  FIREMessage
//
//  Created by Filippo Cilia on 20/06/2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageID = ""

    let db = Firestore.firestore()

    init() {
        getMessages()
    }

    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("ERROR fetching the documents: \(String(describing: error?.localizedDescription))")
                return
            }

            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into message: \(error)")
                    return nil
                }
            }
            // sort messages by timestamp
            self.messages.sort { $0.timestamp < $1.timestamp }

            if let id = self.messages.last?.id {
                self.lastMessageID = id
            }
        }
    }

    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())

            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error adding messages to Firestore: \(error)")
        }
    }
}
