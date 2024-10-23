import SwiftUI

struct Lessons: View {
	 @State private var modalToggle: Bool = false
	 var body: some View {
			NavigationStack {
				 VStack {

				 }
				 .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
				 .navigationTitle("My Lessons")
				 .toolbar {
						ToolbarItem(placement: .navigationBarTrailing) {
							 Button(action: {
									modalToggle.toggle()
									print("Plus button tapped")
							 }) {
									Image(systemName: "plus.rectangle.portrait.fill")
										 .font(.system(size: 24))
							 }
							 .fullScreenCover(isPresented: $modalToggle) { // Use $modalToggle to bind the state
									ModalView(modalToggle: $modalToggle)
//
//										 .animation(.easeInOut(duration: 1), value: modalToggle)
							 }
						}

						ToolbarItem(placement: .bottomBar) {
							 Button(action: {

									print("Bottom bar button tapped")
							 }) {
									Text("More Options")
							 }
						}
				 }
			}
			.transition(.move(edge: .leading))
			.animation(.easeInOut, value: modalToggle)
	 }
}

struct LessonData {
	 var lessonsName: String = ""
	 var timeline: String = ""
	 var location: String = ""
	 var lessonNotes: String = ""
}

struct ModalView: View {
	 @State private var lessonData = LessonData()
	 @State private var datePicked = Date()
	 @Binding var modalToggle: Bool
	 var body: some View {
			NavigationView {
				 ZStack  {
						VStack(spacing: 10) {

							 HStack {
									Text("Timeline: ")
										 .font(.headline)
									Spacer()
									DatePicker("", selection: $datePicked, in: Date()...)
										 .labelsHidden()
							 }
							 .padding()

							 VStack {
									inputField(title: "Lesson Name", text: $lessonData.lessonsName)
									inputField(title: "Location", text: $lessonData.location)
									LessonNotesField(title: "Lesson Notes", text: $lessonData.lessonNotes)
							 }
							 .padding(.horizontal)

							 Button(action: {
									print("Lesson Created")
							 }) {
									Text("Create Lesson")
										 .padding()
										 .frame(width: 350, height: 50)
										 .background(Color.black)
										 .foregroundColor(.white)
										 .cornerRadius(12)
										 .offset(y:15)
							 }
						}
						.padding()
				 }

				 .frame(maxHeight: .infinity, alignment: .top)
				 .toolbar {
						ToolbarItem(placement: .navigationBarLeading) {
							 Button(action: {
									print("Plus button tapped")
									withAnimation { // Wrap in withAnimation for smoother dismissal
										 modalToggle.toggle()

									}
							 }) {
									Image(systemName: "arrow.left")
										 .font(.system(size: 16))
										 .foregroundColor(.black)
									Text("Add new lessons")
										 .font(.headline)
										 .foregroundColor(.primary)
							 }
							 .padding(.top, 30)
							 .padding(.leading, 10)

						}

				 }
			} 
	 }
}

struct inputField: View {
	 var title: String
	 @Binding var text: String

	 var body: some View {
			VStack(alignment: .leading) {
				 Text(title)
						.font(.headline)
				 TextField("Enter \(title.lowercased())", text: $text)
						.textFieldStyle(RoundedBorderTextFieldStyle())
						.padding(.bottom, 10)
			}
	 }
}

struct LessonNotesField: View {
	 let title: String
	 @Binding var text: String

	 var body: some View {
			VStack(alignment: .leading) {
				 Text(title)
						.font(.headline)
				 TextEditor(text: $text)
						.frame(height: 100)
						.border(.gray)
			}
	 }
}

//struct ModalView: View {
//	 @Binding var isPresented: Bool // Binding to control the modal's visibility
//
//	 var body: some View {
//			VStack {
//				 Text("This is a full modal!")
//						.font(.largeTitle)
//						.padding()
//
//				 Button("Close") {
//						isPresented = false // Close the modal
//				 }
//				 .padding()
//			}
//			.background(Color.white)
//			.edgesIgnoringSafeArea(.all) 
//	 }
//}

#Preview {
	 Lessons()
}
