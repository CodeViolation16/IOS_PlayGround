//
//  practice.swift
//  ListTennisPlayers
//
//  Created by Khanh Nguyen on 10/18/24.
//

import SwiftUI

struct practice: View {
	 var Names: [String] = ["Khanh", "Nguyen", "Gia", "Nguyen"]
	 @State var toggling: Int? = nil
	 var body: some View {
			VStack {
				 List (Names.indices, id: \.self){ item in
						VStack{
							 HStack{
									Text(Names[item])
										 .font(.headline)
									Spacer()
									Image(systemName: "chevron.down" )
										 .onTapGesture {
												if toggling == item {
													 toggling = nil
												}
												else  {
													 toggling = item
												}
										 }
							 }
							 if toggling == item {
									Text("This is additional information about \(Names[item]).")
										 .font(.subheadline)
										 .padding(.top, 4)
										 .transition(.slide)
							 }
						}
				 }
			}
	 }
}

#Preview {
    practice()
}
