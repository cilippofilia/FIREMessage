//
//  MessageField.swift
//  FIREMessage
//
//  Created by Filippo Cilia on 20/06/2023.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter your message here"),
                            text: $message)

            Button(action: {
                messagesManager.sendMessage(text: message)
                message = ""
            }) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.cyan)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background()
        .cornerRadius(30)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = { _ in }
    var commit: () -> () = { }

    var body: some View {
        TextField("Send some love...",
                  text: $text,
                  onEditingChanged: editingChanged,
                  onCommit: commit)
        .keyboardType(.default)
        .textFieldStyle(.roundedBorder)
        .multilineTextAlignment(.leading)
        .lineLimit(1...6)
    }
}
