//
//  TitleRow.swift
//  FIREMessage
//
//  Created by Filippo Cilia on 20/06/2023.
//

import SwiftUI

struct TitleRow: View {
    var imgURL = URL(string: "https://unsplash.com/photos/3TLl_97HNJo")
    var name: String = "Mercedez G."
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imgURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()

                Text("Online")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(systemName: "phone.fill")
                .foregroundColor(.secondary)
                .padding(10)
                .background(Color.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color.cyan)
    }
}
