import SwiftUI

struct Player {
	 var gender: String
	 var isPro: Bool
	 var doubleUTR: Double
	 var singleUTR: Double

}
struct ContentView: View {
	 var listName: [String] = ["Djokovic", "Rune", "Alcaraz", "Nadal", "Alex"]
	 var players: [Player] = [
			Player(gender: "Male", isPro: true, doubleUTR: 12.56, singleUTR: 12.55),
			Player(gender: "Male", isPro: true, doubleUTR: 12.34, singleUTR: 12.33),
			Player(gender: "Male", isPro: true, doubleUTR: 12.12, singleUTR: 12.11),
			Player(gender: "Male", isPro: true, doubleUTR: 12.22, singleUTR: 12.21),
			Player(gender: "Male", isPro: false, doubleUTR: 11.90, singleUTR: 11.85)
	 ]

	 @State private var expandedIndex: Int? = nil

	 var body: some View {
			ZStack {
				 Color.gray.ignoresSafeArea()
				 VStack {
						List(listName.indices, id: \.self) { index in
							 VStack {
									HStack {
										 Text(listName[index])
												.font(.headline)
										 Spacer()
										 Image(systemName: expandedIndex == index ? "chevron.down" : "chevron.right")
												.onTapGesture {
													 if expandedIndex == index {
															expandedIndex = nil
													 } else {
															expandedIndex = index
													 }
												}
									}
									
									if expandedIndex == index {
										 VStack(alignment: .leading) {
												if listName[index] == "Alex" {
													 Text("🖼️🖼️🪄🪄🫶🫶")
															.font(.subheadline)
															.padding(.top, 4)
															.transition(.slide)
												} else {
													 Text("This is additional information about \(listName[index]).")
															.font(.subheadline)
															.padding(.top, 4)
															.transition(.slide)
													 PlayerView(player: players[index])
															.padding(.top, 8) // Add some padding if needed
												}
										 }
										 .frame(maxWidth: .infinity, alignment: .leading)
									}
									
							 }
							 .padding(.vertical, 8)
							 
						}
				 }
			}
	 }
}

struct PlayerView: View {
	 var player: Player

	 var body: some View {
			VStack(alignment: .leading) {
				 Text("Gender: \(player.gender)")
						.font(.subheadline)

				 Text("My UTR Singles: \(player.singleUTR, specifier: "%.2f")")
						.font(.subheadline)

				 Text("My UTR Doubles: \(player.doubleUTR, specifier: "%.2f")")
						.font(.subheadline)

				 Text("Is Pro: \(player.isPro ? "Yes" : "No")")
						.font(.subheadline)
			}
	 }
}

#Preview {
	 ContentView()
}
