import SwiftUI

struct CustomButton: View {
    let buttonInfo: ButtonInfo

    var body: some View {
        Button(action: buttonInfo.action) {
            Text(buttonInfo.text)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(8)
        }
        .padding(.horizontal)
        .padding(.vertical, 2)
    }
}
