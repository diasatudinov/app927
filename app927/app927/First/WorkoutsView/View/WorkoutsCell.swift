//
//  WorkoutsCell.swift
//  app927
//
//  Created by Dias Atudinov on 19.09.2024.
//

import SwiftUI

struct WorkoutsCell: View {
    @State var workout: Workout
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 94)
                .foregroundColor(.white.opacity(0.1))
                .cornerRadius(16)
            VStack(alignment: .leading, spacing: 7) {
                HStack {
                    Text(workout.name)
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                }
                
                
                HStack(spacing: 10) {
                    Text("\(formattedTime(time: workout.startTime))-\(formattedTime(time: workout.endTime))")
                        .font(.system(size: 11))
                        .foregroundColor(.white)
                        .padding(2).padding(.horizontal, 2)
                        .background(Color.redBtn)
                        .cornerRadius(6)
                    
                    Text(workout.dayOfWeek)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                    Text(workout.venue)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                    Spacer()
                    Image(systemName: "trash.fill")
                        .resizable()
                        .foregroundColor(.white.opacity(0.3))
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 24)
                }
                
                HStack(spacing: 10) {
                    Text(workout.category)
                        .font(.system(size: 11))
                        .padding(2).padding(.horizontal, 2)
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                            .stroke(lineWidth: 1)
                        )
                        .foregroundColor(.white.opacity(0.5))
                    Text(workout.tasks)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                }
            }.padding(.horizontal)
        }
    }
    
    private func formattedTime(time: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: time)
        }
}

#Preview {
    WorkoutsCell(workout: Workout(name: "", venue: "", tasks: "", dayOfWeek: "", startTime: Date(), endTime: Date(), category: ""))
}
