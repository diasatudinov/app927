//
//  TabUIView.swift
//  app927
//
//  Created by Dias Atudinov on 19.09.2024.
//

import SwiftUI

struct TabUIView: View {
    @State var selectedTab = 0
    private let tabs = ["Home", "Attractions", "Memories", "Settings"]
    @ObservedObject var workoutVM = WorkoutViewModel()
    @ObservedObject var statiscticsVM = StatisticsViewModel()
    @ObservedObject var settingsVM = SettingsViewModel()
    var body: some View {
        ZStack {
            
            switch selectedTab {
            case 0:
                HomeUIView(viewModel: workoutVM, settingsVM: settingsVM)
            case 1:
                WorkoutsUIView(viewModel: workoutVM, settingsVM: settingsVM)
            case 2:
                StatisticsUIView(viewModel: statiscticsVM, settingsVM: settingsVM)
            case 3:
               SettingsUIView(viewModel: settingsVM)
            default:
                Text("default")
            }
                VStack {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.secondBG)
                            .frame(height: 83)
                            
                        HStack(spacing: 50) {
                            ForEach(0..<tabs.count) { index in
                                Button(action: {
                                    selectedTab = index
                                }) {
                                    
                                    ZStack {
                                        VStack {
                                            Image(systemName: icon(for: index))
                                                .font(.system(size: 20, weight: .semibold))
                                                .padding(.bottom, 2)
                                            Text(text(for: index))
                                                .font(.system(size: 10, weight: .semibold))
                                        }.foregroundColor(selectedTab == index ? Color.tabBtn : Color.white.opacity(0.7))
                                    }
                                }
                                
                            }
                        }.padding(.bottom, 5)
                    
                    }
                    
                }.ignoresSafeArea()
            
        }
    }
    
    private func icon(for index: Int) -> String {
        switch index {
        case 0: return "house.fill"
        case 1: return "figure.cooldown"
        case 2: return "cellularbars"
        case 3: return "gear"
        default: return ""
        }
    }
    
    private func text(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "My workouts"
        case 2: return "Statistics"
        case 3: return "Settings"
        default: return ""
        }
    }
}


#Preview {
    TabUIView()
}
