import SwiftUI
import SwiftData

struct Scan: View {
    @State var popupActive: Bool = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            ZStack(alignment: .top){
                Color(.white)
                HostedViewController()
                    .ignoresSafeArea()
                VStack(){
                    Rectangle()
                        .fill(Color(red: 0, green: 146/255, blue: 58/255))
                        .frame(height: 200, alignment: .top)
                        .opacity(0.15)
                        .background(
                            BlurView(style: .systemUltraThinMaterialDark)
                        )
                    Spacer()
                    VStack (spacing: -88) {
                        Button{
                            popupActive = true
                        } label: {
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
                    Spacer()
                        .frame(height: 50)
                    
                }
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
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                // 2
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        // 3
                        dismiss()
                        
                    } label: {
                        // 4
                        HStack {
                            
                            Image(systemName: "chevron.backward")
                            Text("Go Back")
                                .font(.system(size: 20, weight: .medium))
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            HStack{
                if popupActive {
                    ScanDialogue(popupActive: $popupActive, title: "Are you sure?", buttonTitle:"Yes!", message: "You've scanned a/an \(current_detection)", send_content: current_detection)
                }
            }
            .ignoresSafeArea()
        }
    }
}



struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

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
