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
                            VStack (spacing: -85){
                                Ellipse()
                                    .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                    .frame(width: 115, height: 75)
                                ZStack{
                                    Ellipse()
                                        .fill(Color(red: 73/255, green: 175/255, blue: 114/255))
                                        .frame(width: 115, height: 75)
                                    Image(systemName: "trash.fill")
                                        .resizable()
                                        .frame(width: 50, height: 45)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 4)
                                }
                                
                            }
                            .offset(x: 100)
                            
                            VStack (spacing: -85){
                                Ellipse()
                                    .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                    .frame(width: 115, height: 75)
                                ZStack{
                                    Ellipse()
                                        .fill(Color(red: 73/255, green: 175/255, blue: 114/255))
                                        .frame(width: 115, height: 75)
                                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 45)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 4)
                                }
                                
                            }
                            .offset(x: 0)
                            
                            VStack (spacing: -85){
                                Ellipse()
                                    .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                    .frame(width: 115, height: 75)
                                ZStack{
                                    Ellipse()
                                        .fill(Color(red: 73/255, green: 175/255, blue: 114/255))
                                        .frame(width: 115, height: 75)
                                    Image(systemName: "trash.fill")
                                        .resizable()
                                        .frame(width: 50, height: 45)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 4)
                                }
                                
                            }
                            .offset(x: -100)
                            
                            VStack (spacing: -85){
                                Ellipse()
                                    .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                    .frame(width: 115, height: 75)
                                ZStack{
                                    Ellipse()
                                        .fill(Color(red: 73/255, green: 175/255, blue: 114/255))
                                        .frame(width: 115, height: 75)
                                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 45)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 4)
                                }
                                
                            }
                            .offset(x: 0)
                            
                            VStack (spacing: -85){
                                Ellipse()
                                    .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                    .frame(width: 115, height: 75)
                                ZStack{
                                    Ellipse()
                                        .fill(Color(red: 73/255, green: 175/255, blue: 114/255))
                                        .frame(width: 115, height: 75)
                                    Image(systemName: "trash.fill")
                                        .resizable()
                                        .frame(width: 50, height: 45)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 4)
                                }
                                
                            }
                            .offset(x: 100)
                            
                            VStack (spacing: -85){
                                Ellipse()
                                    .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                    .frame(width: 115, height: 75)
                                ZStack{
                                    Ellipse()
                                        .fill(Color(red: 73/255, green: 175/255, blue: 114/255))
                                        .frame(width: 115, height: 75)
                                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 45)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 4)
                                }
                                
                            }
                            .offset(x: 0)
                            
                            VStack (spacing: -85){
                                Ellipse()
                                    .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                    .frame(width: 115, height: 75)
                                ZStack{
                                    Ellipse()
                                        .fill(Color(red: 73/255, green: 175/255, blue: 114/255))
                                        .frame(width: 115, height: 75)
                                    Image(systemName: "trash.fill")
                                        .resizable()
                                        .frame(width: 50, height: 45)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 4)
                                }
                                
                            }
                            .offset(x: -100)
                        }
                        .offset(y: 15)
                    }
                
            .edgesIgnoringSafeArea(.top)
            .offset(y: -90)
        }
        .background(Color(red: 243/255, green: 243/255, blue: 241/255))
    }
}
