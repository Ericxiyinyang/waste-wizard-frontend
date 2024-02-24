import SwiftUI



struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: -30)
                
                HStack(spacing: 15) {
                    VStack (spacing: -50) {
                        NavigationLink(destination: Learn()) {
                            Text("Learn")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 24)
                                .background(Color(red: 0, green: 98/255, blue: 39/255))
                                .cornerRadius(6)
                            
                        }
                        
                        NavigationLink(destination: Learn()) {
                            Text("Learn")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 24)
                                .background(Color(red: 0, green: 146/255, blue: 58/255))
                                .cornerRadius(6)
                            
                        }
                        
                    }

                    VStack (spacing: -50) {
                        NavigationLink(destination: Scan()) {
                            Text("Scan")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 27)
                                .background(Color(red: 0, green: 98/255, blue: 39/255))
                                .cornerRadius(6)
                            
                        }
                        
                        NavigationLink(destination: Scan()) {
                            Text("Scan")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 27)
                                .background(Color(red: 0, green: 146/255, blue: 58/255))
                                .cornerRadius(6)
                            
                        }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

