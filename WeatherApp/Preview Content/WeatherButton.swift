//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Nivethannirosh on 2024-05-20.
//
import SwiftUI

struct buttonView: View{
    var foreColor: Color
    var backColor: Color
    
    var body: some View{
        Text("Change Day")
            .font(.system(size: 26, weight: .bold))
            .foregroundColor(foreColor)
            .frame(width: 280, height: 50)
            .background(backColor)
            .cornerRadius(10)
    }
}
