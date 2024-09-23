//
//  StatCell.swift
//  app927
//
//  Created by Dias Atudinov on 23.09.2024.
//

import SwiftUI

struct StatCell: View {
    @State var stat: Stat
    var body: some View {
        ZStack {
            //Color.secondBG
            Color.white.opacity(0.1)
            VStack(alignment: .leading) {
                
                Text(stat.name)
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.5))
                HStack {
                    Text("\(stat.number)")
                        .foregroundColor(.white)
                    Spacer()
                    if stat.icon == "figure.softball" || stat.icon == "figure.volleyball" {
                        ZStack {
                            Circle()
                                .frame(width: 40)
                                .foregroundColor(stat.number == 0 ? .white.opacity(0.5) : .tabBtn)
                            Image(systemName: stat.icon)
                                .foregroundColor(.secondBG)
                                .font(.system(size: 22, weight: .bold))
                        }
                    } else {
                        ZStack {
                            Image(systemName: stat.icon)
                        }.foregroundColor(stat.number == 0 ? .white.opacity(0.5) : .tabBtn)
                    }
                }.font(.system(size: 34, weight: .bold))
            }.padding(.horizontal)
            
            
        }.frame(height: 89).cornerRadius(12)
    }
}

#Preview {
    StatCell(stat: Stat(name: "Number of points", number: 0, icon: "figure.volleyball"))
}
