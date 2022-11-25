//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Ching Yee Selina Wong on 20/11/2022.
//

import SwiftUI

struct DetailView: View {
    let scrum:DailyScrum
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: DailyScrum.sampleDaTA[0])
    }
}
