//
//  ContentView.swift
//  AC-testapp
//
//  Created by Tyler Boston on 11/24/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        
        VStack {
            // Pull in the image for the logo
            Image("FenCo logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 10.0)
            
            // Pull in the image for the Bakers
            Image("IMG_6406")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 20.0)
            
            // Add a little space
            Spacer()
            
            // Browse the Catalog
            ZStack{
                Image("browse button")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300.0, height: 150.0)
                Button(action: orderBiscuits) {
                    Label("", systemImage: "browse button")
                }
                
            }
            .padding(.top, 40.0)
            Spacer()
        }
        
        /*
        NavigationSplitView {
            
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }*/
    }

    
    private func orderBiscuits() {
                    
        }
        
    }
   /* private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }*/


struct ContentViewTwo: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var showConfirmation = false
    
    func addToCartConfirmation () {
        
        self.showConfirmation.toggle()
    }
    var body: some View {
        
        
        
        VStack {
            // Pull in the image for the Biscuit Button
            Image("biscuit button")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 10.0)
                .onTapGesture {
                    addToCartConfirmation()
                }
            
           
           //  Shows Order Confirmation 
        }.alert("NOW WE'RE BAKING", isPresented: $showConfirmation){
            Button("Add MO"){}
        } message: {
            Text("You've Now Added a Biscuit to Your Cart 😽")
        }
        
        
        
        
        
    }
        
    
    private func orderBiscuits() {
        
    
        
    }
        /*
        NavigationSplitView {
            
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }*/
    }


#Preview("Content View") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

#Preview("Content View2") {
    ContentViewTwo()
        .modelContainer(for: Item.self, inMemory: true)
}
