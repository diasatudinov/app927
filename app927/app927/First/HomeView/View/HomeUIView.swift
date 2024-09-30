//
//  HomeUIView.swift
//  app927
//
//  Created by Dias Atudinov on 19.09.2024.
//

import SwiftUI

struct HomeUIView: View {
    @ObservedObject var viewModel: WorkoutViewModel
    @ObservedObject var settingsVM: SettingsViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    ZStack {
                        if let image = settingsVM.account.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
                                .clipShape(Circle())
                        }  else {
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
                
                if viewModel.workouts.isEmpty {
                    VStack(alignment: .leading ,spacing: 20) {
                        Text("You have no upcoming training sessions")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                        
                        ZStack {
                            Rectangle()
                                .frame(height: 72)
                                .foregroundColor(.white.opacity(0.1))
                                .cornerRadius(16)
                            HStack {
                                Text("No classes")
                                    
                                Spacer()
                                Image(systemName: "xmark.circle.fill")
                            }.foregroundColor(.white.opacity(0.3)).padding(.horizontal).font(.system(size: 18, weight: .semibold))
                        }
                        Spacer()
                        
                    }.padding(.top, 10)
                } else {
                    Text("Your next \ntraining sessions")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    ScrollView {
                        ForEach(viewModel.workouts.prefix(5), id: \.self) { workout in
                            WorkoutsCell(viewModel: viewModel, workout: workout)
                        }
                        
                        
                        
                    }
                    
                }
                
                
            }.padding(.horizontal).padding(.bottom, 50)
        }
    }
}


#Preview {
    HomeUIView(viewModel: WorkoutViewModel(), settingsVM: SettingsViewModel())
}
