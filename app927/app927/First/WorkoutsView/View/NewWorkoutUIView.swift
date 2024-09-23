//
//  NewWorkoutUIView.swift
//  app927
//
//  Created by Dias Atudinov on 19.09.2024.
//

import SwiftUI

struct NewWorkoutUIView: View {
    @ObservedObject var viewModel: WorkoutViewModel
    
    @State var name = ""
    @State var venue = ""
    @State var tasks = ""
    @State var dayOfWeek = ""
    @State var startTime = Date()
    @State var endTime = Date().addingTimeInterval(3600)
    let filters = ["Physical training", "Tactical training"]
    @State var selectedFilter: String?
    
    @State private var isShowingStartPicker = false
    @State private var isShowingEndPicker = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    Spacer()
                    Text("Workouts")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    Spacer()
                    
                        Image(systemName: "chevron.left")
                            .foregroundColor(.clear)
                    
                }
                VStack(alignment: .leading) {
                    
                    Text("Information")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    
                    ZStack(alignment: .leading) {
                        if name.isEmpty {
                            Text("Workout name*")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        
                        TextField("", text: $name)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    ZStack(alignment: .leading) {
                        if venue.isEmpty {
                            Text("Venue*")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        TextField("", text: $venue)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    ZStack(alignment: .leading) {
                        if tasks.isEmpty {
                            Text("Tasks*")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        TextField("", text: $tasks)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    ZStack(alignment: .leading) {
                        if dayOfWeek.isEmpty {
                            HStack {
                                Image(systemName: "calendar").foregroundColor(.clear)
                                Text("Day of the week*")
                                    
                            }.foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(dayOfWeek.isEmpty ? .gray : .tabBtn)
                            TextField("", text: $dayOfWeek)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                                
                                
                        }.padding().background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    HStack {
                        ZStack(alignment: .leading) {
                            if false {
                                HStack {
                                    Image(systemName: "calendar").foregroundColor(.clear)
                                    Text("Day of the week*")
                                        
                                }.foregroundColor(Color.gray)
                                    .padding(.leading)
                            }
                            HStack(spacing: 10) {
                                HStack{
                                    VStack {
                                        Button(action: {
                                            isShowingStartPicker.toggle()
                                        }) {
                                            HStack {
                                                Image(systemName: "clock.arrow.circlepath")
                                                    .foregroundColor(.tabBtn)
                                                Text("\(formattedTime(date: startTime))")
                                                    .foregroundColor(.white)
                                                    
                                                
                                            }.font(.system(size: 15, weight: .semibold))
                                        }
                                        if isShowingStartPicker {
                                            DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                                                .labelsHidden()
                                                .datePickerStyle(WheelDatePickerStyle())
                                                .frame(width: UIScreen.main.bounds.width / 2 - 48)
                                            
                                        }
                                    }
                                    Spacer()
                                }.padding().background(Color.white.opacity(0.12))
                                    .cornerRadius(10)
                                HStack {
                                    VStack {
                                        Button(action: {
                                            
                                                isShowingEndPicker.toggle()
                                            
                                            
                                        }) {
                                            HStack {
                                                Image(systemName: "clock.arrow.circlepath")
                                                    .foregroundColor(.tabBtn)
                                                Text("\(formattedTime(date: endTime))")
                                                    .foregroundColor(.white)
                                                    
                                                
                                            }.font(.system(size: 15, weight: .semibold))
                                        }
                                        if isShowingEndPicker {
                                            DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
                                                .labelsHidden()
                                                .datePickerStyle(WheelDatePickerStyle())
                                                .frame(width: UIScreen.main.bounds.width / 2 - 48)
                                            
                                            
                                        }
                                    }
                                    Spacer()
                                }.padding().background(Color.white.opacity(0.12))
                                    .cornerRadius(10)
                            }.frame(width: UIScreen.main.bounds.width - 32)
                        }
                    }
                }
                
                HStack {
                    Text("Type of excursion")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Range(0...filters.count - 1)) { index in
                            Text(filters[index])
                                .font(.system(size: 13))
                                .padding(12)
                                .foregroundColor(selectedFilter == filters[index] ? .tabBtn : .white.opacity(0.7))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(selectedFilter == filters[index] ? .tabBtn : .white.opacity(0.7), lineWidth: 1)
                                )
                                .onTapGesture {
                                    selectedFilter = filters[index]
                                }
                        }
                    }.padding(2)
                }
                
                Spacer()
                
                Button {
                    if !name.isEmpty && !venue.isEmpty && !tasks.isEmpty && !dayOfWeek.isEmpty, let category = selectedFilter {
                        
                            let workout = Workout(name: name, venue: venue, tasks: tasks, dayOfWeek: dayOfWeek, startTime: startTime, endTime: endTime, category: category)
                            viewModel.addWorkout(workout)
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 50)
                            .cornerRadius(16)
                            .foregroundColor((!name.isEmpty && !venue.isEmpty && !tasks.isEmpty && !dayOfWeek.isEmpty && selectedFilter != nil) ? .redBtn : .white.opacity(0.5))
                        Text("Save")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                }
                
            }.padding(.horizontal)
            
        }
    }
    
    private func formattedTime(date: Date) -> String {
           let formatter = DateFormatter()
           formatter.dateFormat = "HH:mm a"
           return formatter.string(from: date)
       }
}

#Preview {
    NewWorkoutUIView(viewModel: WorkoutViewModel())
}
