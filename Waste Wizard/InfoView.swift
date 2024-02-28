// Feb 28, 2024
// Eric
// On my honor I have not recieved any unauthorized aid
// Sources:
// Pexels Image - https://www.pexels.com/photo/person-hands-on-assorted-color-plastic-lid-lot-761297/
// This is where we display the waste information
import SwiftUI

struct InfoView: View {
    // same thing to create a custom back button
    @Environment(\.dismiss) private var dismiss
    // r - recycling, c - compost, t - trash
    var content_type: String
    
    var body: some View {
        
        ZStack(alignment: .top){
            // get a dark backgroun d
            Color(red: 36/255, green: 36/255, blue: 36/255)
                .ignoresSafeArea()
            VStack(){
                ZStack(alignment: .center){
                    // switch case to diplay different actions + rectangle colors for different types of waste
                    switch content_type{
                        case "r":
                            Rectangle()
                                .frame(height: 300)
                                .ignoresSafeArea()
                                .foregroundColor(Color(red: 0, green: 146/255, blue: 58/255))
                            Text("Recycle This.")
                        case "c":
                            Rectangle()
                                .frame(height: 300)
                                .ignoresSafeArea()
                                .foregroundColor(Color(red: 252/255, green: 189/255, blue: 53/255))
                            Text("Compost This.")
                        case "t":
                            Rectangle()
                                .frame(height: 300)
                                .ignoresSafeArea()
                                .foregroundColor(.black)
                            Text("Throw This.")
                        default:
                            Text("Throw This Away.")
                    }
                }
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(.white)
                // display general info about why putting things away in the right places is important
                Text("Proper disposal of waste into trash, compost, and recycling bins is crucial for environmental health and sustainability. By sorting waste correctly, we reduce landfill volume, conserve natural resources, and decrease pollution. Composting organic waste enriches soil and reduces methane emissions, while recycling conserves raw materials and energy. This simple act of responsible disposal plays a significant role in combating climate change and preserving the planet for future generations. 😄")
                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 35))
                    .font(.system(size: 23, weight: .light))
                    .foregroundColor(.white)
                    .lineSpacing(3)
                    .offset(y: -20)

            }
        }
        .navigationBarBackButtonHidden(true)
        // same thing to create a custom back button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Go Back")
                            .font(.system(size: 20, weight: .medium))
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

//again..previews

#Preview {
    InfoView(content_type: "t")
}
