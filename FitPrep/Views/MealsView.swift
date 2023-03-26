//
//  MealsView.swift
//  FitPrep
//
//  Created by Ryan Helmn on 18/02/2023.
//

import SwiftUI

struct MealsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Categories"){
                    NavigationLink("Low Calorie") {
                        Text("Low Cal meals")
                    }
                }
            }
                .navigationBarTitle(Text("Meals"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button("Shopping List") {
                            print("Clicked")
                        }
                    })
                }
        }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}
