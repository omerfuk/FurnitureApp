//
//  DetailScreen.swift
//  FurnitureApp
//
//  Created by Ömer Faruk Kılıçaslan on 15.08.2022.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("bg")
                .edgesIgnoringSafeArea(.all)
                
            
            ScrollView{
                Image("chair_1")
                    .resizable()
                    
                    .frame(width: UIScreen.main.bounds.width, height: 400)
                
                DescriptionView()
                    .offset(y: -40)
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack{
                Text("$1299")
                    .font(.title)
                    .foregroundColor(.black.opacity(0.8))
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                        .foregroundColor(Color.black.opacity(0.6))
                }
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("bg"))
            .cornerRadius(50, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            //Specified corner radius (provded by extension
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: CustomNavButtonView(action: {presentationMode.wrappedValue.dismiss()}, image: Image(systemName: "chevron.backward")), trailing: CustomNavButtonView(action: {}, image: Image(systemName: "exclamationmark.shield"))
        )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners))
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Luxury Swedia \n Chair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 4){
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                Text("(4.9)")
                    .opacity(0.6)
                    .padding(.leading,8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical,8)
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                .lineSpacing(0.8)
                .opacity(0.6)
            
            HStack( alignment: .top){
                VStack(alignment: .leading){
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    
                    Text("Jati wood Canvas, \nAmazing Love")
                        .opacity(0.6)
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack(alignment: .bottom){
                VStack(alignment: .leading){
                    Text("Colors")
                        .fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: .yellow)
                        ColorDotView(color: .blue)
                        ColorDotView(color: .green)
                    }
                    
                }
                
                Spacer()
                
                VStack (alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    
                    HStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 56).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        
                        .background(Color.black.opacity(0.6))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }

            }
        }
        .padding()
        .padding(.top)
        .background(.white)
        .cornerRadius(40)
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct CustomNavButtonView: View {
    let action: ()-> Void
    let image: Image
    var body: some View {
        Button(action: action , label: {
            image
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8)
                .foregroundColor(.black)
        })
    }
}
