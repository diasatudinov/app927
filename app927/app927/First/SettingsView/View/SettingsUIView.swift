//
//  SettingsUIView.swift
//  app927
//
//  Created by Dias Atudinov on 23.09.2024.
//

import SwiftUI

struct SettingsUIView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    ZStack {
                        if let image = viewModel.account.image {
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
                    
                    Text("Welcome \(viewModel.account.name)!")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    Spacer()
                    
                }.padding(.bottom, 29).padding(.horizontal)
                
                
                ScrollView {
                    VStack(spacing: 14) {
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.secondBG)
                            HStack {
                                NavigationLink {
                                    AccountUIView(account: viewModel.account, viewModel: viewModel).navigationBarBackButtonHidden()
                                } label: {
                                    HStack(spacing: 20) {
                                        
                                        if let image = viewModel.account.image {
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 49, height: 49)
                                                .clipShape(Circle())
                                        } else {
                                            Image(systemName: "person.fill")
                                                .font(.system(size: 35))
                                                .foregroundColor(.red)
                                                .padding(.top)
                                                .background(Color.white.opacity(0.5)).clipShape(Circle())
                                        }
                                        
                                        Text("Accaunt")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .bold))
                                        Spacer()
                                        
                                    }.padding()
                                }
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.secondBG)
                            HStack {
                                Button {
                                    viewModel.shareApp()
                                } label: {
                                    HStack {
                                        
                                        Image(systemName: "square.and.arrow.up.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        
                                        Text("Share App")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .bold))
                                        Spacer()
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 68)
                                                .foregroundColor(.white.opacity(0.3))
                                                .cornerRadius(40)
                                            Text("Share")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                    }.padding(20)
                                }
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.secondBG)
                            HStack {
                                Button {
                                    viewModel.rateApp()
                                } label: {
                                    HStack {
                                        
                                        Image(systemName: "star.square.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        
                                        Text("Rate Us")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .bold))
                                        Spacer()
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 68)
                                                .foregroundColor(.white.opacity(0.3))
                                                .cornerRadius(40)
                                            Text("Rate")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                    }.padding(20)
                                }
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(12)
                                .foregroundColor(.secondBG)
                            HStack {
                                Button {
                                    viewModel.openUsagePolicy()
                                } label: {
                                    HStack {
                                        
                                        Image(systemName: "person.badge.shield.checkmark.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        Text("Usage policy")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .bold))
                                        Spacer()
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 68)
                                                .foregroundColor(.white.opacity(0.3))
                                                .cornerRadius(40)
                                            Text("Read")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                    }.padding(20)
                                }
                            }
                        }
                        
                    }.padding(.horizontal)
                }
                
                Spacer()
            }.padding(.bottom, 96)
                
        }
    }
}

#Preview {
    SettingsUIView(viewModel: SettingsViewModel())
}
