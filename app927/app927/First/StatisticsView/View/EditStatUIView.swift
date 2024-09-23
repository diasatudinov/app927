//
//  EditStatUIView.swift
//  app927
//
//  Created by Dias Atudinov on 23.09.2024.
//

import SwiftUI

struct EditStatUIView: View {
    @ObservedObject var viewModel: StatisticsViewModel
    var stat: Stat
    @State var name = ""
    @State var number = ""
    
    let icons = ["gauge.with.needle.fill", "basketball.circle.fill", "figure.softball", "figure.volleyball"]
    @State var index = 0
    @State private var selectedIcon: String?
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
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Information")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    ZStack(alignment: .leading) {
                        if name.isEmpty {
                            Text("Statistics name*")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        
                        TextField("", text: $name)
                            .foregroundColor(.white.opacity(0.3))
                            .font(.system(size: 15, weight: .semibold))
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    ZStack(alignment: .leading) {
                        if number.isEmpty {
                            Text("Number of points*")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        
                        TextField("", text: $number)
                            .keyboardType(.numberPad)
                            .foregroundColor(.white.opacity(0.3))
                            .font(.system(size: 15, weight: .semibold))
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    Text("Icon")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text("Select a icon")
                        .font(.system(size: 15))
                        .foregroundColor(.white.opacity(0.3))
                    ZStack {
                        Circle()
                            .frame(height: 79)
                            .foregroundColor(selectedIcon != nil ? .tabBtn : .white.opacity(0.5))
                            .padding(21)
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.5), lineWidth: 1)
                            )
                        if let selectedIcon = selectedIcon {
                            if selectedIcon == "figure.softball" || selectedIcon == "figure.volleyball" {
                                ZStack {
                                    Circle()
                                        .frame(width: 60)
                                        .foregroundColor(.tabBtn)
                                    Image(systemName: selectedIcon)
                                        .foregroundColor(.black)
                                        .font(.system(size: 40, weight: .bold))
                                }
                            } else {
                                Image(systemName: selectedIcon)
                                    .foregroundColor(.black)
                                    .font(.system(size: 40, weight: .bold))
                            }
                            
                        }
                    }.onTapGesture {
                        selectedIcon = icons[index]
                        if index < 4 {
                            index += 1
                        }
                        
                        if index == 4 {
                            index = 0
                        }
                    }
                }
                Spacer()
                HStack {
                    Button {
                        if !name.isEmpty, let number = Int(number), let icon = selectedIcon {
                            
                            viewModel.editStat(stat, name: name, number: number, icon: icon)
                            
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 50)
                                .cornerRadius(16)
                                .foregroundColor((!name.isEmpty && Int(number) != nil && selectedIcon != nil) ? .redBtn : .redBtn.opacity(0.5))
                            Text("Edit")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button {
                        viewModel.deleteStat(stat)
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 50)
                                .cornerRadius(16)
                                .foregroundColor(.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.redBtn, lineWidth: 2)
                                )
                            Text("Delete")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                }
            }.padding(.horizontal)
        }
        .onAppear {
            name = stat.name
            number = "\(stat.number)"
            selectedIcon = stat.icon
        }
    }
}


#Preview {
    EditStatUIView(viewModel: StatisticsViewModel(), stat: Stat(name: "Number of points", number: 0, icon: "figure.volleyball"))
}
