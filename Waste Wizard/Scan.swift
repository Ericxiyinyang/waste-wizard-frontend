// Feb 28, 2024
// Eric
// On my honor I have not recieved any unauthorized aid
// Sources:
// URL Session Dev Docs - https://developer.apple.com/documentation/foundation/urlsession
// import all the libs we need, since this is just the front end we just need Swift and Swift UI
import SwiftUI
import SwiftData


// constructing the actual front-end page now...
struct Scan: View {
    // state to track if the popup should be active or not to trigger animations
    @State var popupActive: Bool = false
    // setting dismiss variable in order to have a custom, white, back button that had better contrast and apple's default blue
    @Environment(\.dismiss) private var dismiss
    // body of the view
    var body: some View {
        // the whole thing is a big ZStack, we are just stacking elements on top of each other
        ZStack{
            // stack for our Camera Feed, Buttons, and UI
            ZStack(alignment: .top){
                Color(.white)
                // This is where we place our Hosted Camera View
                CameraView()
                    .ignoresSafeArea()
                // now we create the elements that go on top of this camera view
                VStack(){
                    // this is where we get a rectangle with the extra blur view we want behind it. We also get a nice green color by setting it with fill and then blurring the background
                    Rectangle()
                        .fill(Color(red: 0, green: 146/255, blue: 58/255))
                        .frame(height: 200, alignment: .top)
                        .opacity(0.15)
                        .background(
                            BlurView(style: .systemUltraThinMaterialDark)
                        )
                    // spacer for layout
                    Spacer()
                    // We use a vstack for a button because this creates the 3D illusion by stacking a darker version of the button below the actual button :)
                    VStack (spacing: -88) {
                        // make the button set the popup to true for the user to verify that they've scanned in the right stuff
                        Button{
                            popupActive = true
                        } label: {
                            // label the button
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color(red: 0, green: 98/255, blue: 39/255))
                                    .frame(width: 270, height: 90)
                                
                                Text("Scan")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                        }
                        .foregroundColor(.white)
                        //                    .padding(.vertical, 20)
                        //                    .padding(.horizontal, 100)
                        //                    .background(Color(red: 0, green: 98/255, blue: 39/255))
                        .cornerRadius(15)
                        
                        // this is the darker version that I was talking about..otherwise it is the same code
                        Button{
                            popupActive = true
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color(red: 0, green: 146/255, blue: 58/255))
                                    .frame(width: 270, height: 90)
                                
                                Text("Scan")
                                    .foregroundColor(.white)
                                    .padding()
                            }
                        }
                        .font(.system(size: 30, weight: .black))
                        .foregroundColor(.white)
                        //                    .padding(.vertical, 20)
                        //                    .padding(.horizontal, 100)
                        //                    .background(Color(red: 0, green: 146/255, blue: 58/255))
                        .cornerRadius(15)
                        .offset(y:-10)
                        
                    }
                    // again spacing
                    Spacer()
                        .frame(height: 50)
                    
                }
                // finally we put the text on top, same vstack idea for fake 3D
                VStack(){
                    Text("Point at an object")
                        .font(.system(size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 71/255, green: 71/255, blue: 71/255))
                        .offset(CGSize(width: 0, height: 110))
                    Text("Point at an object")
                        .font(.system(size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(CGSize(width: 0, height: 60))
                }
            }
            // we need the thing to fill the whole screen, not use the default nav back button, and instead use a custom toolbar
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                // making our own back toolbar here with the dismiss() action we defined
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            // setting font to a bigger size and white
                            Image(systemName: "chevron.backward")
                            Text("Go Back")
                                .font(.system(size: 20, weight: .medium))
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            // looks for if popupActive, a @State variable (this means we can observe this change and update the interface) is True
            HStack{
                if popupActive {
                    // if we need to displace a popup, insert an extra popup view for the user with the current detection
                    ScanDialogue(popupActive: $popupActive, title: "Are you sure?", buttonTitle:"Yes!", message: "You've scanned a/an \(current_detection)", send_content: current_detection)
                }
            }
            .ignoresSafeArea()
        }
    }
}


// how we achieve the background blur is by duplicating the Camera View and bluring it, then overlaying it on top of the unblured big vie
struct BlurView: UIViewRepresentable {
    // load in our style of blur that apple has already made
    var style: UIBlurEffect.Style
    // helper functions that makes & updates the UIView of the blur if we need
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

// setting up previews for Xcode, nothing to do with the actual app
struct BlurBehindRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        Scan()
    }
}


struct Scan_Preview: PreviewProvider {
    static var previews: some View {
        Scan()
    }
}
