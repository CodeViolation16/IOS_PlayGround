	 //
	 //  SwiftUIView.swift
	 //  ChatApp
	 //
	 //  Created by Khanh Nguyen on 10/18/24.
	 //

import SwiftUI
struct Message: Decodable {
	 var userID: String
	 var text: String
	 var createdAt: Date
	 var photoURL: String
}


struct MessageView: View {
	 var message: Message
	 var fromCurrentUser: Bool = false
	 var body: some View {
			HStack {
				 Image(systemName: "person")
				 HStack {
						Text(message.text)
							 .padding()
				 }
				 .frame(maxWidth: 260, alignment: .leading)
				 .background(.gray)
			}
	 }
}

#Preview {
	 MessageView(message: Message(userID: "123", text: "Hey there it's me", createdAt: Date(), photoURL: ""))
}
