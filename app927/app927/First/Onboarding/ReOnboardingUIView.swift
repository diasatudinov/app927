//
//  ReOnboardingUIView.swift
//  app927
//
//  Created by Dias Atudinov on 19.09.2024.
//

import SwiftUI

struct ReOnboardingUIView: View {
    @State private var pageNum: Int = 1
    @State private var showSheet = false
    @AppStorage("signedUP") var signedUP: Bool = false
    
    var body: some View {
        if !signedUP {
            ZStack {
                Color.secondBG
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    
                    switch pageNum {
                    case 1: Image("app927Screen1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 500)
                            .padding(.top, 50)
                        
                    case 2: Image("app927Screen2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 500)
                            .padding(.top, 50)
                    default:
                        Image("appScreen3")
                            .resizable()
                            .frame(height: 549)
                            .ignoresSafeArea()
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                        
                        VStack {
                            switch pageNum {
                            case 1:
                                VStack(spacing: 12) {
                                    Text("Stay Ahead of Your Game")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .multilineTextAlignment(.center)
                                    Text("Effortlessly track your training schedule and personal stats")
                                        .font(.system(size: 15))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white.opacity(0.5))
                                }.frame(height: 120).padding(.bottom, 10).padding(.horizontal, 30).foregroundColor(.white).padding(.top, 24)
                            case 2:
                                VStack(spacing: 12) {
                                    Text("Elevate Your Basketball \nSkills")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .multilineTextAlignment(.center)
                                    Text("Set personal goals, and monitor your progress with ease.")
                                        .font(.system(size: 15))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white.opacity(0.5))
                                }.frame(height: 120).padding(.bottom, 10).padding(.horizontal, 30).foregroundColor(.white).padding(.top, 24)
                            default:
                                Text("Save information about \nyour favorite routes")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .frame(height: 70)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 10)
                                
                            }
                            Spacer()
                            Button {
                                if pageNum < 2 {
                                    pageNum += 1
                                } else {
                                    signedUP = true
                                }
                            } label: {
                                Text("Next")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }.frame(height: 50).background(Color.redBtn)
                                .cornerRadius(16).padding(.horizontal)
                            
                            HStack(spacing: 8) {
                                Circle()
                                    .fill(pageNum == 1 ? Color.redBtn : Color.redBtn.opacity(0.5))
                                    .frame(width: 8, height: 8)
                                    .cornerRadius(19)
                                
                                Circle()
                                    .fill(pageNum == 2 ? Color.redBtn : Color.redBtn.opacity(0.5))
                                    .frame(width: 8, height: 8)
                                    .cornerRadius(19)
                                
                            }
                            .padding()
                            Spacer()
                        }
                        
                    }
                    
                    
                }.edgesIgnoringSafeArea(.bottom)
            }
            
        } else {
             TabUIView()
        }
    }
}


#Preview {
    ReOnboardingUIView()
}
