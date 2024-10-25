import SwiftUI

struct Test: View {
	 @State private var modToggle: Bool = false
	 @State private var selectedDates: [Date] = []
	 @State private var newDate: Date = Date()
	 @State private var best_band: String = ""  // Initialize the string
	 @State private var best_bands: [String] = []  // Array to store best bands

	 var body: some View {
			VStack {
						// Display all selected dates
				 ForEach(selectedDates, id: \.self) { date in
						Text("Selected Date: \(String(describing: date))")  // Show each selected date
				 } 
				 ForEach(best_bands, id: \.self) { band in
						Text("Selected Band: \(band)")  // Show each selected date
				 }


				 Button(action: {
						modToggle.toggle()
				 }, label: {
						Text("Toggle Date Picker")
				 })

				 if modToggle {
						Modal(selectedDate: $newDate, selectedDates: $selectedDates, bestBand: $best_band, bestBands: $best_bands)  // Pass the best_bands binding
				 }
			}
			.padding()
	 }
}

struct Modal: View {
	 @Binding var selectedDate: Date
	 @Binding var selectedDates: [Date]  // Array to store selected dates
	 @Binding var bestBand: String
	 @Binding var bestBands: [String]  // Array to store best bands

	 var body: some View {
			VStack {
				 DatePicker("Select a new date", selection: $selectedDate, displayedComponents: .date)
						.labelsHidden()
				 TextField("Best band in the world", text: $bestBand)
						.textFieldStyle(RoundedBorderTextFieldStyle())  // Optional: Style the text field
						.padding()

				 Button("Submit Date") {
							 // Check if the selected date is already in the selectedDates array
						if !selectedDates.contains(where: { Calendar.current.isDate($0, inSameDayAs: selectedDate) }) {
							 selectedDates.append(selectedDate)
							 bestBands.append(bestBand)  // Append the band name to the bestBands array
							 bestBand = ""  // Clear the text field after submission
						}
				 }
			}
			.padding()
	 }
}

#Preview {
	 Test()
}
