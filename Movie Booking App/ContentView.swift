//
//  ContentView.swift
//  Movie Booking App
//
//  Created by Vishal Kumar on 20/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Home()
        }
        .padding()
    }
}

struct Home: View {
    @State var show = false
    
    var body: some View {
        VStack(spacing: 15) { 
            HStack { 
                VStack(alignment: .leading){ 
                    Text("Browse").font(.largeTitle)
                    Button { 
                        
                    } label: { 
                        HStack(spacing:8) { 
                            Text("Movies In New Delhi")
                            Image(systemName: "chevron.down").font(.body)
                        }
                    }.foregroundColor(.black)

                }
                Spacer()
                Button { 
                    
                } label: { 
                    Image("menu").renderingMode(.original).resizable().frame(width: 30,height: 30)
                }

            }.padding(.top,15)
            
            
            
            SearchView().padding(.vertical,15)
            
            HStack {
                Text("All Movies")
                Spacer()
                Button { 
                    
                } label: { 
                    HStack(spacing: 10){
                        Text("Filter")
                        Image("filter").renderingMode(.original).resizable().frame(width: 20,height: 20)
                    }
                }.foregroundColor(.black)

            }.padding(.bottom,15)
            
            ScrollView(.vertical, showsIndicators: false) { 
                VStack(spacing: 15) { 
                    ForEach(datas){ i in 
                        ScrollView(.horizontal,showsIndicators: false){ 
                            HStack(spacing:15) { 
                                ForEach(i.row) { j in 
                                    VStack(alignment: .leading,spacing: 12) { 
                                        Image(j.image).resizable().frame(height: 150).onTapGesture {
                                            self.show.toggle()
                                        }.cornerRadius(8)
                                        Text(j.name).font(.caption).lineLimit(1)
                                        Text(j.time).font(.caption)
                                    }.foregroundColor(Color.black.opacity(0.5))
                                        .frame(width:120)
                                }
                            }
                        }
                    }
                }
            }
            
        }.padding(.horizontal,5)
            .sheet(isPresented: $show) { 
                Detail()
            }
    }
}

struct Detail: View {
    @State var selected = "21"
    var body : some View {
        VStack {
            Image("r31").resizable().aspectRatio(1,contentMode: .fill).frame(height: 350)
            VStack(spacing: 15){
                VStack{
                    Text("Avengers").foregroundColor(.black)
                    HStack(spacing: 15){
                        HStack{
                            Image(systemName: "star.fill").font(.caption)
                            Text("4.9")
                        }
                        HStack{
                            Image(systemName: "clock")
                            Text("111 min")
                        }
                        HStack{
                            Image(systemName: "film")
                            Text("IMAX")
                        }
                    }
                    Divider().padding(.vertical,15)
                    Text("The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one final stand in Marvel Studios' grand conclusion to twenty-two films, \"Avengers: Endgame.").font(.caption)
                }.padding()
                    .background(Color("Color"))
                    .foregroundColor(Color.black.opacity(0.5))
                    .cornerRadius(25)
                
                HStack(spacing:10) { 
                    ForEach(dates) { i in
                        Button { 
                            self.selected = i.date 
                        } label: { 
                            VStack(spacing:10) {
                                Text(i.day).font(.subheadline)
                                Text(i.date)
                            }.padding()
                        }.foregroundColor(self.selected == i.date ? .white : .gray)
                            .background(self.selected == i.date ? .blue : .clear)
                        .cornerRadius(10)
                    } 
                }.padding(.vertical,25)
                
                HStack(spacing:15){
                    Text("₹230")
                    Button { 
                        
                    } label: { 
                        Text("Book Now").padding(.vertical,15).padding(.horizontal,35)
                    }.foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())

                }.padding(.top,15)
                    
                    Spacer()
                
            }.padding(.horizontal,25)
                .padding(.top,-35)
        }
    }
}

struct SearchView: View {
    @State var txt = ""
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "magnifyingglass").font(.body)
            TextField("Search Movies", text: $txt)
        }.padding()
        .foregroundColor(.black)
        .background(Color("Color"))
        .cornerRadius(25)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct type : Identifiable {
    var id:Int
    var row:[row]
}

struct row : Identifiable {
    var id : Int
    var name :  String
    var time : String
    var image :  String
}

struct datetype:Identifiable {
    var id : Int
    var date :  String
    var day : String
}

var datas = [
    type(id: 0, row: [
    row(id: 0, name: "Avatar", time: "1h 12m", image: "r11"),
    row(id: 1, name: "Pirates of Carabian", time: "1h 42m", image: "r12"),
    row(id: 2, name: "Captain America", time: "2h 40m", image: "r13"),
]),
type(id: 1, row: [
    row(id: 0, name: "Blade Runner", time: "1h 12m", image: "r21"),
    row(id: 1, name: "Wonder Women", time: "1h 42m", image: "r22"),
    row(id: 2, name: "Black Adam", time: "1h 24m", image: "r23"),
]),

type(id: 2, row: [
    row(id: 0, name: "Avangers", time: "1h 12m", image: "r31"),
    row(id: 1, name: "The Hulk", time: "1h 42m", image: "r32"),
    row(id: 2, name: "Bumble Bee", time: "1h 24m", image: "r33"),
]),
]

var dates = [
    datetype(id:0,date:"21",day:"Mon"),
    datetype(id:1,date:"22",day:"Tue"),
    datetype(id:2,date:"23",day:"Wed"),
    datetype(id:3,date:"24",day:"Thu"),
    datetype(id:4,date:"25",day:"Fri")
]
