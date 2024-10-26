//
//  ContentView.swift
//  foodapp
//
//  Created by Ana Paola Oviedo on 2024-10-24.
//

import SwiftUI

// Business Model
struct Business: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var category: String
    var location: String
    var products: [Product]
}

// Product Model
struct Product: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
}

// Sample Data
let sampleProducts = [
    Product(name: "Pan de Puebla", price: 10.0),
    Product(name: "Chalupas", price: 35.0)
]

let sampleBusinesses = [
    Business(name: "Panadería La Esperanza", description: "Pan tradicional", category: "Alimentos", location: "Puebla Centro", products: sampleProducts),
    Business(name: "Restaurante El Fogón", description: "Tacos y comida poblana", category: "Restaurante", location: "Puebla Norte", products: sampleProducts)
]

// Business List View
struct BusinessListView: View {
    var businesses: [Business]
    
    var body: some View {
        NavigationView {
            List(businesses) { business in
                NavigationLink(destination: BusinessDetailView(business: business)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(business.name).font(.headline)
                            Text(business.description).font(.subheadline)
                            Text(business.location).font(.subheadline).foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Conecta Local - Negocios")
        }
    }
}

// Business Detail View
struct BusinessDetailView: View {
    var business: Business
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(business.name)
                .font(.largeTitle)
                .padding()
            
            Text(business.description)
                .font(.body)
                .padding([.leading, .trailing])
            
            Text("Ubicación: \(business.location)")
                .font(.subheadline)
                .padding([.leading, .trailing])
            
            Text("Productos:")
                .font(.headline)
                .padding([.leading, .top])
            
            List(business.products) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Text("$\(product.price, specifier: "%.2f")")
                }
            }
            
            Spacer()
        }
        .navigationTitle(business.name)
    }
}


