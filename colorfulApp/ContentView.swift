//
//  ContentView.swift
//  colorfulApp
//
//  Created by Андрей Василевский on 4/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var redSliderValue = 0.0
    @State var greenSliderValue = 0.0
    @State var blueSliderValue = 0.0
    
    @State var alertPresented = false
    
    var body: some View {
        ZStack{
            Color(.purple)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Rectangle()
                        .frame(width: 300, height: 150)
                        .foregroundColor(Color(red: redSliderValue / 255, green: greenSliderValue / 255, blue: blueSliderValue / 255))
                        .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.white, lineWidth: 5))
                        .cornerRadius(10.0)
                        .shadow(radius: 10)
                }.padding()
                
                HStack {
                    Text("\(lround(redSliderValue))")
                        .frame(width: 50)
                        .foregroundColor(.white)
                    MainSlider(value: $redSliderValue)
                        .accentColor(.red)
                    MainTextField(value: $redSliderValue, alert: $alertPresented)
                        .alert(isPresented: $alertPresented, content: {
                            Alert(title: Text("Wrong Format"), message: Text("Please Enter max number 255"))
                        })
                        .frame(width: 50.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                   
                        
                }
                HStack {
                    Text("\(lround(greenSliderValue))")
                        .frame(width: 50)
                        .foregroundColor(.white)
                    MainSlider(value: $greenSliderValue)
                        .accentColor(.green)
                    MainTextField(value: $greenSliderValue, alert: $alertPresented)
                        .alert(isPresented: $alertPresented, content: {
                            Alert(title: Text("Wrong Format"), message: Text("Please Enter max number 255"))
                        })
                        .frame(width: 50.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                }
                HStack {
                    Text("\(lround(blueSliderValue))")
                        .frame(width: 50)
                        .foregroundColor(.white)
                    MainSlider(value: $blueSliderValue)
                        .accentColor(.blue)
                    MainTextField(value: $blueSliderValue, alert: $alertPresented)
                        .alert(isPresented: $alertPresented, content: {
                            Alert(title: Text("Wrong Format"), message: Text("Please Enter max number 255"))
                        })
                        .frame(width: 50.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
                Spacer()
            }.padding()
        }
    }
}

struct MainTextField: View {
    
    @Binding var value: Double
    @Binding var alert: Bool
    
    var body: some View {
        TextField("255", value: $value, formatter: NumberFormatter(), onCommit: {
            if value > 255 {
                alert = true
                value = 255
            }
        })
    }
}

struct MainSlider: View {
    
    @Binding var value: Double
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
