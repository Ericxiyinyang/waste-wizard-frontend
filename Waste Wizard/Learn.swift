/*
 Ann Song
 2/28
 On my honor I have neither given nor received unauthorized aid.
 
 ChatGPT was used to generate recycling information.
 
 */

import SwiftUI

struct Learn: View {
    @Environment(\.dismiss) private var dismiss
    
    // Separate @State variables for each modal
    @State private var showModal1 = false
    @State private var showModal2 = false
    @State private var showModal3 = false
    @State private var showModal4 = false
    @State private var showModal5 = false
    @State private var showModal6 = false
    @State private var showModal7 = false
    
    // Quiz scores
    @State private var quizScore1 = 0
    @State private var quizScore2 = 0
    @State private var quizScore3 = 0
    @State private var quizScore4 = 0
    @State private var quizScore5 = 0
    @State private var quizScore6 = 0
    @State private var quizScore7 = 0
    
    var body: some View {
        VStack {
            // Display top header view
            ZStack {
                Rectangle()
                    .fill(Color(red: 0, green: 146/255, blue: 58/255))
                    .frame(height: 150)
                    .opacity(0.7)
                    .shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 5)
                    .edgesIgnoringSafeArea(.top)
                
                // Display total score as the sum of all quiz scores
                Text("Total Score: \(quizScore1 + quizScore2 + quizScore3 + quizScore4 + quizScore5 + quizScore6 + quizScore7)")
                    .offset(y: -55)
                    .bold()
                    .font(.title3)
                    .foregroundStyle(.white)
            }
            
            // Make a scroll view for all the learn modules
            ScrollView(.vertical) {
                LazyVStack(spacing: 40) {
                    // Module 1
                    Button(action: {
                        // When the button is pressed, showModal1 is pressed, eventually will trigger a modal
                        self.showModal1 = true
                    }) {
                        // Module icon (stacking two ellipses)
                        VStack(spacing: -85) {
                            Ellipse()
                                .fill(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .frame(width: 115, height: 75)
                            ZStack {
                                Ellipse()
                                    .fill(Color(red: 73/255, green: 175/255, blue: 114/255))
                                    .frame(width: 115, height: 75)
                                
                                // Using an icon
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
                            // Main titel
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
                            
                            // Question 1
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
                            
                            // Question 2
                            VStack {
                                Text("What is a benefit of recycling?")
                                Button("A) Recycling has no impact.") {
                                    // Incorrect Answer
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Recycling helps preserve ecosystems.") {
                                    // Correct Answer
                                    self.quizScore1 += 1
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            .padding()
                            
                            // Display user score for that quiz
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
                            
                            RecyclingTipView(tip: "Choose products with recyclable or minimal packaging to reduce waste.")
                        
                            Text("Quiz")
                                .font(.title2)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            VStack {
                                Text("Does recycling use less energy than producing goods from virgin materials?")
                                Button("A) Yes") {
                                    self.quizScore2 += 1
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) No") {
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
                                    self.quizScore2 += 1
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            .padding()
                            Text("Your score: \(quizScore2)/2")
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
                            
                            RecyclingTipView(tip: "Opt for reusable alternatives to single-use items whenever possible, such as using a reusable water bottle instead of disposable plastic bottles. This reduces waste and lessens the demand for new materials.")
                        
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
                                    self.quizScore3 += 1
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
                                    self.quizScore3 += 1
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            .padding()
                            Text("Your score: \(quizScore3)/2")
                                .padding()
                                .bold()
                        }
                    }
                    
                    // Button 4 (placeholder)
                    Button(action: {
                        self.showModal4 = true
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
                    .sheet(isPresented: $showModal4) {
                        VStack {
                            Spacer()
                            Text("Placeholder")
                                .font(.title)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                            Text("Placeholder")
                                .bold()
                                .font(.title2)
                                .padding(.top, 5)
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            Text("Placeholder")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .padding(.bottom, 20)
                            
                            RecyclingTipView(tip: "Placeholder")
                            
                            Text("Quiz")
                                .font(.title2)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            VStack {
                                Text("Placeholder")
                                Button("A) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            VStack {
                                Text("Placeholder")
                                Button("A) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Placeholder.") {
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            .padding()
                            Text("Your score: \(quizScore4)/2")
                                .padding()
                                .bold()
                        }
                    }
                    
                    // Button 5 (placeholder)
                    Button(action: {
                        self.showModal5 = true
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
                    .sheet(isPresented: $showModal5) {
                        VStack {
                            Spacer()
                            Text("Placeholder")
                                .font(.title)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                            Text("Placeholder")
                                .bold()
                                .font(.title2)
                                .padding(.top, 5)
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            Text("Placeholder")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .padding(.bottom, 20)
                            
                            RecyclingTipView(tip: "Placeholder")
                            
                            Text("Quiz")
                                .font(.title2)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            VStack {
                                Text("Placeholder")
                                Button("A) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            VStack {
                                Text("Placeholder")
                                Button("A) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Placeholder.") {
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            .padding()
                            Text("Your score: \(quizScore5)/2")
                                .padding()
                                .bold()
                        }
                    }
                    
                    // Button 6 (placeholder)
                    Button(action: {
                        self.showModal6 = true
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
                    .sheet(isPresented: $showModal6) {
                        VStack {
                            Spacer()
                            Text("Placeholder")
                                .font(.title)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                            Text("Placeholder")
                                .bold()
                                .font(.title2)
                                .padding(.top, 5)
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            Text("Placeholder")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .padding(.bottom, 20)
                            
                            RecyclingTipView(tip: "Placeholder")
                            
                            Text("Quiz")
                                .font(.title2)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            VStack {
                                Text("Placeholder")
                                Button("A) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            VStack {
                                Text("Placeholder")
                                Button("A) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Placeholder.") {
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            .padding()
                            Text("Your score: \(quizScore6)/2")
                                .padding()
                                .bold()
                        }
                    }
                    
                    // Button 7 (placeholder)
                    Button(action: {
                        self.showModal7 = true
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
                    .sheet(isPresented: $showModal7) {
                        VStack {
                            Spacer()
                            Text("Placeholder")
                                .font(.title)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                            Text("Placeholder")
                                .bold()
                                .font(.title2)
                                .padding(.top, 5)
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            Text("Placeholder")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .padding(.bottom, 20)
                            
                            RecyclingTipView(tip: "Placeholder")
                            
                            Text("Quiz")
                                .font(.title2)
                                .padding()
                                .bold()
                                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
                            VStack {
                                Text("Placeholder")
                                Button("A) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            VStack {
                                Text("Placeholder")
                                Button("A) Placeholder") {
                                    
                                }
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                
                                Button("B) Placeholder.") {
                                }
                                
                                .foregroundColor(Color(red: 57/255, green: 137/255, blue: 88/255))
                                .bold()
                                .padding(.horizontal, 10)
                            }
                            .padding()
                            Text("Your score: \(quizScore7)/2")
                                .padding()
                                .bold()
                        }
                    }
                    
                }
                .offset(y: 15)
            }
            .edgesIgnoringSafeArea(.top)
            .offset(y: -90)
        }
        // Don't use the regular IOS back button
        .navigationBarBackButtonHidden(true)
        
        // Custom back button
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
        .navigationBarBackButtonHidden(true)
    }
}

struct Learn_Preview: PreviewProvider {
    static var previews: some View {
        Learn()
    }
}
