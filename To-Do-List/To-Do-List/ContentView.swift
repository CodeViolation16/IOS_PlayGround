import SwiftUI

struct ContentView: View {
	 @State private var items: [String] = ["Item 1", "Item 2", "Item 3"]

	 var body: some View {
			NavigationStack {
				 List {
						Section("Platforms") {
							 ForEach(items, id: \.self) { item in
									Text(item) // Use 'item' directly
							 }
							 .onDelete(perform: onDelete) // Correct placement and reference to onDelete
						}
				 }
				 .navigationTitle("To-Do List")
				 .toolbar {
						EditButton() // Enables editing mode for reordering and deleting
				 }
			}
	 }

			// Function to handle item deletion
	 private func onDelete(at offsets: IndexSet) {
			items.remove(atOffsets: offsets) // Remove items from the array
	 }
}

#Preview {
	 ContentView()
}
