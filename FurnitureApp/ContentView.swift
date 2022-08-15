//
//  ContentView.swift
//  FurnitureApp
//
//  Created by Ömer Faruk Kılıçaslan on 15.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex:Int = 0
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        ZStack{
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                
                AppBarView()
                
                TagLineView()
                    .padding()
                
                SearchAndScanView()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0 ..< categories.count) { i in
                            CategoryView(isActive: i == selectedIndex, text: categories[i])
                                .onTapGesture {
                                    selectedIndex = i
                                }
                        }
                    }
                    .padding()
                }
                
                Text("Popular")
                    .font(.system(size: 24))
                    .padding(.horizontal)
                
                ProductCardView()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.circle")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "person.circle")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
            }
            
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest")
            .font(.largeTitle)
            .foregroundColor(.black.opacity(0.7))
            .italic()
        + Text(" Furniture!")
            .font(.largeTitle)
            .foregroundColor(.black.opacity(0.7))
            .italic()
            .bold()
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(.trailing,8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing)
            
            Button {
                
            } label: {
                Image(systemName: "square.split.2x2.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black.opacity(0.7))
                    .cornerRadius(10)
            }
            
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive:Bool
    let text: String
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 0){
                Text(text)
                    .font(.system(size: 18))
                    .foregroundColor(isActive ?  .black.opacity(1) : Color.black.opacity(0.6))
                
                if isActive {
                    Color.black.opacity(0.6)
                        .frame(width: 15, height: 2)
                        .clipShape(Capsule())
                }
                
            }
            .padding(.trailing)
        }
    }
}

struct ProductCardView: View {
    var body: some View {
        VStack {
            Image("chair_1")
                .resizable()
                .frame(width: 210, height: 200)
                .cornerRadius(20)
            
            Text("Luxury Swedian Chair")
                .font(.title3)
                .bold()
            
            HStack (spacing: 2){
                ForEach(0..<5) { item in
                    Image(systemName: "star.fill")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .bold()
            }
            
        }
        .frame(width: 210)
        .padding()
        .background(.white)
        .cornerRadius(20)
    }
}
