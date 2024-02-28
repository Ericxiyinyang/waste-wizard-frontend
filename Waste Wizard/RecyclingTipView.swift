/*
 Ann Song
 2/28
 On my honor I have neither given nor received unauthorized aid.
 
 */

import SwiftUI

// Interface for recycling tips
struct RecyclingTipView: View {
    let tip: String
    
    var body: some View {
        // Make a VStack
        VStack {
            // Display the recycling tip header
            Text("Recycling Tip")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 73/255, green: 175/255, blue: 114/255))
            
            // Display the actual tip
            Text(tip)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
        }
    }
}
