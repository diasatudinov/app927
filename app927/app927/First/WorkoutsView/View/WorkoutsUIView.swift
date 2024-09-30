//
//  WorkoutsUIView.swift
//  app927
//
//  Created by Dias Atudinov on 19.09.2024.
//

import SwiftUI

struct WorkoutsUIView: View {
    
    @ObservedObject var viewModel: WorkoutViewModel
    @ObservedObject var settingsVM: SettingsViewModel
    let filters = ["All", "Physical training", "Tactical training"]
    @State var selectedFilter: String? = "All"
    
    var filteredItems: [Workout] {
        if selectedFilter == nil || selectedFilter == "All" {
            return viewModel.workouts
        } else {
            return viewModel.workouts.filter { $0.category.lowercased().contains(selectedFilter?.lowercased() ?? "All") }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    ZStack {
                        if let image = settingsVM.account.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
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
                    NavigationLink {
                        NewWorkoutUIView(viewModel: viewModel).navigationBarBackButtonHidden()
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
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Range(0...filters.count - 1)) { index in
                            Text(filters[index])
                                .font(.system(size: 13))
                                .padding(5).padding(.vertical, 6)
                                .foregroundColor(selectedFilter == filters[index] ? .tabBtn : .white.opacity(0.5))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(selectedFilter == filters[index] ? .tabBtn : .white.opacity(0.5), lineWidth: 1)
                                )
                                .onTapGesture {
                                    selectedFilter = filters[index]
                                }
                        }
                    }.padding(2)
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
                    VStack {
                        
                        ScrollView {
                            
                            ForEach(filteredItems, id: \.self) { workout in
                                NavigationLink {
                                    EditWorkoutUIView(viewModel: viewModel, workout: workout).navigationBarBackButtonHidden()
                                } label: {
                                    WorkoutsCell(viewModel: viewModel, workout: workout)
                                }
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
    WorkoutsUIView(viewModel: WorkoutViewModel(), settingsVM: SettingsViewModel())
}
