//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Ching Yee Selina Wong on 14/11/2022.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
        }
    }
}


extension LabelStyle where Self == TrailingIconLabelStyle{
    static var trailingIcon: Self{Self()}
}

