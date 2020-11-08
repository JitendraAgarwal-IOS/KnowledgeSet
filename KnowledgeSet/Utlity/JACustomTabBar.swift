//
//  JACustomTabBar.swift
//  KnowledgeSet
//
//  Created by Capgemini on 08/11/20.
//

import SwiftUI


struct JACustomTabBar: View {
//    @State var selected = "Home"
    var title: String = ""
    var image: String = ""
    //var tabItem: String = [] as!
    @State var fakeData = ["Array A", "Array B", "Array C", "Array D"]
    
    
    var body: some View {
    
      
     
        
        TabView {
            
            ForEach(fakeData, id: \.self) { data in
                
                Text("Home Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: image)
                        Text(data)
                    }
                
                
            }
            
            
            
          
            
    
       
        
        }
        
    }
    
}
