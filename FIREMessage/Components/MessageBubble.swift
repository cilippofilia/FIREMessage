//
//  MessageBubble.swift
//  FIREMessage
//
//  Created by Filippo Cilia on 20/06/2023.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime: Bool = false

    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .padding()
                    .background(message.received ? .cyan : .blue)
                    .cornerRadius(20)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                withAnimation {
                    showTime.toggle()
                }
            }

            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .padding(message.received ? .leading : .trailing)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MessageBubble(message: Message.testMessageR)
            MessageBubble(message: Message.testMessageS)
        }
    }
}
