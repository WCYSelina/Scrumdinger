//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Ching Yee Selina Wong on 29/11/2022.
//

import SwiftUI

struct DetailEditView: View {
    @State private var data = DailyScrum.Data()
    @State private var newAttendeeName = ""
    var body: some View {
        Form{
            Section(header: Text("Meeting Info")){
                TextField("Title",text: $data.title)
                HStack{
                    Slider(value:$data.lengthInMinutes,in: 5...30,step: 1){
                        Text("Length")
                    }.accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes").accessibilityHidden(true)
                }
            }
            Section(header:Text("Attendees")){
                ForEach(data.attendees){attendee in
                    Text(attendee.name)
                }
                .onDelete{indices in
                    data.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee",text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(attendee)
                            newAttendeeName = "" //CLEAR THE CONTENTS IN THE TEXT BOX
                        }
//                        withAnimation(.easeInOut(duration: 0.3)){
//                                let attendee = DailyScrum.Attendee(name: newAttendeeName)
//                                data.attendees.append(attendee)
//                        }
                        
                        
                    }){
                        Image(systemName: "plus.circle.fill").accessibilityLabel("Add attendee")
                    }.disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
