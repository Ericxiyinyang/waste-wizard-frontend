//Eric
// On my honor I have not recieved any unauthorized aid
// this is our popup
import SwiftUI

// define the server address where we can send and get information
// *THIS MAY BE NON-FUNCTIONAL BY THE TIME YOU RUN THIS CODE AS GOOGLE's FREE SERVERS HAVE A LIMIATION*
let getUrl = "https://server-keyenk5jpa-ue.a.run.app/type"
let postUrl = "https://server-keyenk5jpa-ue.a.run.app/type"


// define how these informations will be passed in terms of a JSON, make sure
// this stuff is decodable so we can decode it to a String to show the user facts
struct Model:Decodable{
    let type: String
}

struct postModel:Decodable{
    let waste: String
}

public var trash_result: String = "r"

// URLSession Request Object that is Observable so we can catch's its data
class RequestModel: ObservableObject{
    // create our request model here so we can call it with buttons
    @ObservedObject var requestModel = RequestModel()
    // make a published variable of what we are getting with our load data
    @Published var items = [Model]()
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
                    let result = try JSONDecoder().decode([Model].self, from: data)
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
        guard let url = URL(string: postUrl) else {return }
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


// define our popup window
struct ScanDialogue: View {
    // set variable for how much we want off set the window when it is off
    @State private var offset: CGFloat = 600
    @Binding var popupActive: Bool
    // initialize the object with the popup's contents
    let title: String
    let buttonTitle: String
    let message: String
    let send_content: String
    // the body view of the popup
    var body: some View {
        ZStack {
            // make everything behind it darker
            Color(.black)
                .opacity(0.3)
                .onTapGesture {
                    close()
                }

            VStack() {
                // Add the title, messages as a Text()
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
                    // button to go to the InfoView to get waste information
                    // *THE CONTENT TYPE FOR INFO VIEW IS SET TO R SO THAT THE APP CAN WORK WITHOUT THE SERVER WORKING FOR YOUR TESTING PURPOSES Ms. Healey
                    // Actual code for server was:
                    // NavigationLink(destination: InfoView(content_type: SetContentType()) {}
                    NavigationLink(destination: InfoView(content_type: "r")) {
                        Text("Send")
                        // styling the button
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 110)
                            .background(Color(red: 0, green: 98/255, blue: 39/255))
                            .cornerRadius(15)
                        
                    }
                    // fake 3D effect
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
            // again..a lot of styling
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            // cross mark to close the popup
            .overlay(alignment: .topTrailing) {
                Button {
                    // when the x is pressed close the popup
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
                // animate the popup up with .spring() keyframes
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
    // function to close the popup
    func close() {
        // animate the popup down with .spring() keyframes
        withAnimation(.spring()) {
            offset = 600
            popupActive = false
        }
    }
    func SetContentType() -> String{
        let requestModel = RequestModel()
        requestModel.loadData()
        requestModel.postData(waste_type: current_detection)
        var trash_result = requestModel.items[0].type
        switch trash_result{
            case "recycling":
                return "r"
            case "compost":
                return "c"
            case "trash":
                return "t"
            default:
                return "r"
        }
    }
}

// again just preview testing here
#Preview {
    ScanDialogue(popupActive: .constant(true), title: "Are You Sure?", buttonTitle: "Yes", message: "You've scanned in a plastic bottle", send_content: "TEST")
}
