//
//  StatisticsUIView.swift
//  app927
//
//  Created by Dias Atudinov on 23.09.2024.
//

import SwiftUI

struct StatisticsUIView: View {
    @ObservedObject var viewModel: StatisticsViewModel
    @ObservedObject var settingsVM: SettingsViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    ZStack {
                        if let image = settingsVM.account.image {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 56, height: 56)
                                .scaledToFill()
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.red)
                                .padding(.top)
                                .background(Color.white.opacity(0.5)).clipShape(Circle())
                                .padding(9)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.5), lineWidth: 1)
                                )
                        }
                    }
                    
                    Text("Welcome \(settingsVM.account.name)!")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    Spacer()
                    
                }
                
                HStack {
                    Text("Your statistics")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink {
                        NewStatUIView(viewModel: viewModel).navigationBarBackButtonHidden()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(height: 40)
                                .foregroundColor(.redBtn)
                            Image(systemName: "plus.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                        }
                    }
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.statistics, id: \.self) { stat in
                            NavigationLink {
                                EditStatUIView(viewModel: viewModel, stat: stat).navigationBarBackButtonHidden()
                            } label: {
                                StatCell(stat: stat)
                            }
                        }
                    }
                    
                }
                Spacer()
            }.padding(.horizontal).padding(.bottom, 40)
        }
    }
}

#Preview {
    StatisticsUIView(viewModel: StatisticsViewModel(), settingsVM: SettingsViewModel())
}
