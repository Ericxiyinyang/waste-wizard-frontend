//
//  ScanDialogue.swift
//  Waste Wizard
//
//  Created by Eric Yang on 2024-02-23.
//

import SwiftUI

struct ScanDialogue: View {
    @State private var offset: CGFloat = 600
    @Binding var popupActive: Bool
    let title: String
    let buttonTitle: String
    let message: String
    let send_content: String
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.3)
                .onTapGesture {
                    close()
                }

            VStack {
                Text(title)
                    .font(.system(size: 30, weight: .bold))
                    .bold()
                    .padding(2)

                Text(message)
                    .font(.system(size: 29))
                    .frame(minWidth: 100, maxWidth: 300)
                Spacer(minLength: 20)
                VStack (spacing: -73) {
                    NavigationLink(destination: Learn()) {
                        Text("Send")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 110)
                            .background(Color(red: 0, green: 98/255, blue: 39/255))
                            .cornerRadius(15)
                        
                    }
                    
                    NavigationLink(destination: Learn()) {
                        Text("Send")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 110)
                            .background(Color(red: 0, green: 146/255, blue: 58/255))
                            .cornerRadius(15)
                        
                    }
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(alignment: .topTrailing) {
                Button {
                    close()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .fontWeight(.medium)
                }
                .tint(.black)
                .padding()
            }
            .shadow(radius: 20)
            .padding(30)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }

    func close() {
        withAnimation(.spring()) {
            offset = 600
            popupActive = false
        }
    }
}

#Preview {
    ScanDialogue(popupActive: .constant(true), title: "Are You Sure?", buttonTitle: "Yes", message: "You've scanned in a plastic bottle", send_content: "TEST")
}
