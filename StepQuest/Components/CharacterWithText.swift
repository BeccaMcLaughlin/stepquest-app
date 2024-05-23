import SwiftUI

struct CharacterWithText: View {
    let character: CharacterType
    let text: String
    let buttons: [ButtonInfo]

    var body: some View {
        VStack {
            Image(character.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 400.0)
            Text(text)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            VStack {
                ForEach(buttons, id: \.text) { buttonInfo in
                    CustomButton(buttonInfo: buttonInfo)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.blue.edgesIgnoringSafeArea(.all)
        CharacterWithText(
            character: CharacterType.wizard,
            text: """
    A young child has lost their favorite toy, a wooden dragon, near the whispering willow tree about 400 steps from the village center. Can you help them find it?
    """,
            buttons: [
                ButtonInfo(text: "Yes, I will help!", action: { print("Selected option: Yes, I will help!") }),
                ButtonInfo(text: "No, I can't right now.", action: { print("Selected option: No, I can't right now.") })
            ]
        )
    }
}
