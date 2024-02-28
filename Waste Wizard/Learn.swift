import SwiftUI

struct RecyclingTipView: View {
    let tip: String
    
    var body: some View {
        VStack {
            Text("Recycling Tip")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
            Text(tip)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
        }
    }
}

struct Learn: View {
    @Environment(\.dismiss) private var dismiss
    
    // Separate @State variables for each modal
    @State private var showModal1 = false
    @State private var showModal2 = false
    @State private var showModal3 = false
    // Add more @State variables for additional modals if needed
    
    // Quiz scores
    @State private var quizScore1 = 0
    @State private var quizScore2 = 0
    @State private var quizScore3 = 0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color(red: 0, green: 146/255, blue: 58/255))
                .frame(height: 150)
                .opacity(0.7)
                .shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 5)
                .edgesIgnoringSafeArea(.top)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 40) {
                    // Button 1
                    Button(action: {
                        self.showModal1 = true
                    }) {
                        VStack(spacing: -85) {
                            Ellipse()
                                .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .frame(width: 115, height: 75)
                            ZStack {
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
                        
                    }
                    .offset(x: 100)
                    .sheet(isPresented: $showModal1) {
                        // Content of the first modal
                        VStack {
                            Spacer()
                            Text("Importance of Recycling")
                                .font(.title)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                            Text("Environmental Conservation")
                                .bold()
                                .font(.title2)
                                .padding(.top, 5)
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            Text("Recycling helps conserve natural resources such as forests, minerals, and water by reducing the need for raw materials extraction, thereby preserving ecosystems and biodiversity.")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .padding(.bottom, 20)
                            
                            // Recycling tip for Modal 1
                            RecyclingTipView(tip: "Remember to rinse out food containers before recycling to avoid contamination.")
                        
                            // Quiz for Modal 1
                            Text("Quiz")
                                .font(.title2)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            VStack {
                                Text("How does recycling contribute to conserving natural resources?")
                                Button("A) Reduces need for raw material extraction.") {
                                    // Update quiz score
                                    self.quizScore1 += 1
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Increases need for raw material extraction.") {
                                    // Incorrect answer
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            VStack {
                                Text("What is a benefit of recycling?")
                                Button("A) Recycling has no impact.") {
                                    // Update quiz score
                                    self.quizScore1 += 1
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Recycling helps preserve ecosystems.") {
                                    // Incorrect answer
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            .padding()
                            Text("Your score: \(quizScore1)/2")
                                .padding()
                                .bold()
                        }
                        
                    }
                    
                    // Button 2
                    Button(action: {
                        self.showModal2 = true
                    }) {
                        VStack(spacing: -85) {
                            Ellipse()
                                .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .frame(width: 115, height: 75)
                            ZStack {
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
                    }
                    .sheet(isPresented: $showModal2) {
                        // Content of the first modal
                        VStack {
                            Spacer()
                            Text("Importance of Recycling")
                                .font(.title)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                            Text("Energy Conservation")
                                .bold()
                                .font(.title2)
                                .padding(.top, 5)
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            Text("Recycling often requires less energy than producing goods from virgin materials, leading to reduced energy consumption and lower greenhouse gas emissions, which mitigates climate change.")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .padding(.bottom, 20)
                            
                            // Recycling tip for Modal 1
                            RecyclingTipView(tip: "Choose products with recyclable or minimal packaging to reduce waste.")
                        
                            // Quiz for Modal 1
                            Text("Quiz")
                                .font(.title2)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            VStack {
                                Text("Does recycling use less energy than producing goods from virgin materials?")
                                Button("A) Yes") {
                                    // Update quiz score
                                    self.quizScore1 += 1
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) No") {
                                    // Incorrect answer
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            VStack {
                                Text("What impact does recycling have on greenhouse gas emissions?")
                                Button("A) Increases greenhouse gas emissions.") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Reduces greenhouse gas emissions.") {
                                    // Update quiz score
                                    self.quizScore1 += 1
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            .padding()
                            Text("Your score: \(quizScore1)/2")
                                .padding()
                                .bold()
                        }
                        
                    }
                    
                    // Button 3
                    Button(action: {
                        self.showModal3 = true
                    }) {
                        VStack(spacing: -85) {
                            Ellipse()
                                .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .frame(width: 115, height: 75)
                            ZStack {
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
                        
                    }
                    .offset(x: -100)
                    .sheet(isPresented: $showModal3) {
                        // Content of the first modal
                        VStack {
                            Spacer()
                            Text("Importance of Recycling")
                                .font(.title)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                            Text("Waste Reduction")
                                .bold()
                                .font(.title2)
                                .padding(.top, 5)
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            Text("Recycling diverts waste from landfills and incinerators, extending their lifespan and reducing pollution and greenhouse gas emissions associated with waste disposal.")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .padding(.bottom, 20)
                            
                            // Recycling tip for Modal 1
                            RecyclingTipView(tip: "Opt for reusable alternatives to single-use items whenever possible, such as using a reusable water bottle instead of disposable plastic bottles. This reduces waste and lessens the demand for new materials.")
                        
                            // Quiz for Modal 1
                            Text("Quiz")
                                .font(.title2)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            VStack {
                                Text("How does recycling impact waste management?")
                                Button("A) Increases waste in landfills and incinerators.") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Diverts waste from landfills and incinerators.") {
                                    // Update quiz score
                                    self.quizScore1 += 1
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            VStack {
                                Text("What is a econ benefit from recycling?")
                                Button("A) Recycling results in job loss.") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Recycling creates jobs in collection, processing, and manufacturing.") {
                                    // Update quiz score
                                    self.quizScore1 += 1
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            .padding()
                            Text("Your score: \(quizScore1)/2")
                                .padding()
                                .bold()
                        }
                        
                    }
                    // Button 4
                    Button(action: {
                        
                    }) {
                        VStack(spacing: -85) {
                            Ellipse()
                                .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .frame(width: 115, height: 75)
                            ZStack {
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
                        
                    }
                    
                    // Button 5
                    Button(action: {
                        
                    }) {
                        VStack(spacing: -85) {
                            Ellipse()
                                .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .frame(width: 115, height: 75)
                            ZStack {
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
                    }
                    .offset(x: 100)
                    
                    // Button 6
                    Button(action: {
                        
                    }) {
                        VStack(spacing: -85) {
                            Ellipse()
                                .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .frame(width: 115, height: 75)
                            ZStack {
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
                    }
                    
                    // Button 7
                    Button(action: {
                        
                    }) {
                        VStack(spacing: -85) {
                            Ellipse()
                                .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .frame(width: 115, height: 75)
                            ZStack {
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
                    }
                    .offset(x: -100)
                }
                .offset(y: 15)
            }
            .edgesIgnoringSafeArea(.top)
            .offset(y: -90)
        }
        .navigationBarBackButtonHidden(true)
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

struct Learn_Preview: PreviewProvider {
    static var previews: some View {
        Learn()
    }
}
