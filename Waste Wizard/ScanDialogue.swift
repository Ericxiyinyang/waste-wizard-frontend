//
//  ScanDialogue.swift
//  Waste Wizard
//
//  Created by Eric Yang on 2024-02-23.
//

import SwiftUI

// define the server address where we can send and get information
let getUrl = ""
let postUrl = ""


// define how these informations will be passed in terms of a JSON, make sure
// this stuff is decodable so we can decode it to a String to show the user facts
struct getModel:Decodable{
    let type: String
}

struct postModel:Decodable{
    let waste: String
}


// URLSession Request Object that is Observable so we can catch's its data
class RequestModel: ObservableObject{
    // create our request model here so we can call it with buttons
    @ObservedObject var requestModel = RequestModel()
    // make a published variable of what we are getting with our GET requests from the server
    @Published var items = [getModel]()
    // function to load our HTTP GET
    func loadData(){
        // define the URL into a URL object, if we don't have one just return
        guard let url = URL(string: getUrl) else {return}
        // add a datatask in apple's URLSession toolkit so it can call the GET
        URLSession.shared.dataTask(with: url) {(data, res, err) in
            do{
                // we need to parse the JSON data because we need to ultimately display a "String" object to the end user. Luckily apple has a JSONDecoder made for us! :)
                if let data = data {
                    // decoding the JSON...
                    let result = try JSONDecoder().decode([getModel].self, from: data)
                    // asynchronously add this to our main DispatchQueue so we don't wait for the request while other things happen
                    DispatchQueue.main.async {
                        self.items = result
                    }
                // if data somehow fails we just put NO DATA
                } else {
                    let result = "NO DATA"
                }
            // debugging if we get a request error
            } catch(let error){
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    // very similar to the last function, but used to send POST data so we can POST what waste the end user is looking at
    func postData(waste_type: String){
        // again, make the String url into a URL object
        guard let url = URL(string: postUrl) else {return}
        // set our waste_type
        var waste = waste_type
        // compose our POST body with the same structure as the POST model "waste": waste_type
        let body: [String: Any] = ["waste": waste]
        // now we go in reverse, we have to serialize this to JSON so the server
        // understands what I'm trying to do here...
        let finalData = try! JSONSerialization.data(withJSONObject: body)
        // finally we need to make an URLRequest object with our URL object
        var request = URLRequest(url: url)
        // set the request method to POST + attach body + set the value
        request.httpMethod = "POST"
        request.httpBody = finalData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // again now we just need to use Apple's URLSession dataTask to send the request
        URLSession.shared.dataTask(with: request) {(data, res, err) in
            do{
                if let data = data {
                    // this is the exact same as the Get method...
                    let result = try JSONDecoder().decode([postModel].self, from: data)
                    print(result)
                } else {
                    let result = "NO DATA"
                }
            } catch(let error){
                print(error.localizedDescription)
            }
        }.resume()
    }
}


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
                    .foregroundColor(Color(red: 0, green: 146/255, blue: 58/255))
                    .padding(2)

                Text(message)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .frame(minWidth: 100, maxWidth: 300)
                Spacer(minLength: 20)
                VStack (spacing: -70) {
                    NavigationLink(destination: Learn()) {
                        Text("Send")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 110)
                            .background(Color(red: 0, green: 98/255, blue: 39/255))
                            .cornerRadius(15)
                        
                    }
                    
                    NavigationLink(destination: InfoView(content_type: "r")) {
                        Text("Send")
                            .font(.system(size: 30, weight: .bold))
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
