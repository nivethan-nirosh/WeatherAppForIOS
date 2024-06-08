//
//  ContentView.swift
//  WeatherApp
//
//  Created by Nivethannirosh on 2024-05-20.
//

import SwiftUI

struct ContentView: View {
    
    //A State button to distructive structure
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            //Binded Using binding variable
            BackgroundView(isNight: $isNight)
            VStack{
                cityTextView(
                    city:"Hatton, Sri Lanka")
                
                VStack(spacing: 10){
                    todayWeather(
                        todayWeatherPic: isNight ?"cloud.moon.fill":"cloud.sun.fill",
                        temp: isNight ? 21: 29)
                }
                
                
                HStack(spacing:20){
                    weatherDayView(
                        dayOfWeek: "MON",
                        imageName: "cloud.sun.fill",
                        temperature: 29)
                    
                    weatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.bolt.fill",
                        temperature: 28)
                    
                    weatherDayView(
                        dayOfWeek: "WED",
                        imageName: "cloud.sun.rain.fill",
                        temperature: 26)
                    
                    weatherDayView(
                        dayOfWeek: "THU",
                        imageName: "cloud.bolt.rain.fill",
                        temperature: 23)
                    
                    weatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "cloud.sleet.fill",
                        temperature: 21)

                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                    
                } label:{
                    buttonView(
                        foreColor: isNight ?.black:.blue,
                        backColor: isNight ?.gray:.white)                }
                
                Spacer()
                
                    
            }
            
            }
        
    }
}
struct ContentView_Previews:
    PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}

struct weatherDayView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack{
            
            Text(dayOfWeek)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                //.renderingMode(.original)
                .symbolRenderingMode(.palette)
            //rendering mode - heirarchial,palette etc
                .resizable()
                .foregroundStyle(.white,.yellow,.green)
                .aspectRatio(contentMode: .fill)
                .frame(width:30, height: 30)
            
            Text("\(temperature)°C")
                .font(.system(size: 22, weight: .heavy))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ?.black:.blue, isNight ?.blue:.blue, isNight ?.black:Color("lightBlue")]),
                       startPoint: .topTrailing,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
        //.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)(Also Used earlier)
        
        
   //     ContainerRelativeShape()
   //         .fill(isNight ?Color.black.gradient: Color.blue.gradient)
    //        .ignoresSafeArea()
        
    }
}

struct cityTextView: View {
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default ))
            //.frame(width: 300,height: 150)
            .foregroundColor(.white)
            //.background(Color.yellow)
            .padding(.top,35)
        
    }
}

struct todayWeather: View {
    
    var todayWeatherPic: String
    var temp: Int
    
    var body: some View{
        
        Image(systemName: todayWeatherPic)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:220 ,height: 200)
            .padding(.top,40)
    
    
    Text("\(temp)°C")
        
        .font(.system(size: 40, weight:.bold))
        .foregroundColor(.white)
    
        .padding(.bottom,60)
    }
}
