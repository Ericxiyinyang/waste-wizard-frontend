import SwiftUI
import SwiftData

struct Learn: View {
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color(red: 0, green: 146/255, blue: 58/255))
                .frame(height: 150)
                .opacity(0.7)
                .shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 5)
                .edgesIgnoringSafeArea(.top)
                    ScrollView(.vertical) {
                        LazyVStack(spacing: 40) {
                            ForEach(0..<20) { index in

                                VStack (spacing: -85){
                                    Ellipse()
                                        .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                        .frame(width: 115, height: 75)
                                    Ellipse()
                                        .fill(Color(red: 73/255, green: 175/255, blue: 114/255))
                                        .frame(width: 115, height: 75)
                                    
                                }
                            }
                        }
                    }
                
            .edgesIgnoringSafeArea(.top)
            .offset(y: -90)
//            Rectangle()
//                .fill(Color(red: 0, green: 146/255, blue: 58/255))
//                .frame(height: 300)
//                .opacity(0.7)
//                .shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 5)
//                .edgesIgnoringSafeArea(.bottom)
//                .offset(y: 50)
        }
    }
}
