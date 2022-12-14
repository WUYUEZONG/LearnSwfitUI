//
//  ContentView.swift
//  FoodPicker
//
//  Created by mntechMac on 2022/11/28.
//

import SwiftUI

struct Foods {
    static var infos: [String: String] {
        ["ζ±ε ‘": "π", "ζ²ζ": "π₯", "δΉε€§ε©ιΊ΅":"π", "η«ι": "π²",]
    }
}

struct ContentView: View {
    
    @State var selectedFood: String?
    @State var showInfo = false
    
    let foods = Foods.infos.keys
    
    
    
    var body: some View {
        VStack(spacing: 20.0) {
            
            if let selectedFood = selectedFood, let info = Foods.infos[selectedFood] {
                Text(info)
                    .font(.system(size: 260))
                
                Text(selectedFood)
                    .bold()
                HStack {
                    Text("ι£η©δΏ‘ζ―")
                        
                    Button {
                        showInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .tint(.gray)
                    }

                }.font(.title2)
                
                VStack {
                    if showInfo {
                        
                        Grid {
                            GridRow {
                                Text("1")
                                Text("1")
                                Text("1")
                            }
                            
                            Divider()
                                
                            
                            GridRow {
                                Text("1")
                                Text("1")
                                Text("1")
                            }
                        }
                        .padding()
                        .background(Color.white)
//                        .animation(.to, value: <#T##Equatable#>)
                    }
                }
                
                
                Spacer()
                
            } else {
                Image("dinner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("δ»ε€©εδ»δΉοΌ")
                    .fontWeight(.bold)
                
                if selectedFood != .none {
                    Text(selectedFood!)
                        .font(.largeTitle)
                        .id(selectedFood)
                        .foregroundColor(Color.green)
                        .transition(.asymmetric(
                            insertion: .opacity
                                .animation(.easeInOut(duration: 0.5).delay(0.2)),
                            removal: .opacity
                                     .animation(.easeOut(duration: 0.2)))
                        )
                }
            }
            
            
            
            
            
            
            Button {
                selectedFood = foods.shuffled().filter({ $0 != selectedFood }).first!
            } label: {
                Text(selectedFood == .none ? "εθ―ζ" : "ζ’δΈδΈͺ")
                    .frame(width: 200.0)
                    .animation(.none, value: selectedFood)
                    .transformEffect(.identity)
                    
            }
            .buttonStyle(.borderedProminent)
            .cornerRadius(.infinity)
            
            Button {
                selectedFood = .none
            } label: {
                Text("ιη½?")
                    .frame(width: 200.0)
            }
            .buttonStyle(.bordered)
            .cornerRadius(.infinity)
            
        }
        .font(.title)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .secondarySystemBackground))
        .animation(.easeInOut, value: showInfo)
        .animation(.easeInOut, value: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
