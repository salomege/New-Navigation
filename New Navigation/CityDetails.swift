//
//  CityDetails.swift
//  New Navigation
//
//  Created by salome on 22.12.23.
//

import SwiftUI

struct cityDetails {
    let name: String
    let image: String
    let description: String
    let transport: [TransportDetails]
    let mustSee: [mustSeePlaces]
    let hotels: [popularHotels]
    
}

struct TransportDetails {
    let name: [String]
}

struct mustSeePlaces {
    let sightsList: [String]
}

struct popularHotels {
    let hotelList: [String]
}

let Cities: [cityDetails] = [
    cityDetails(name: "Rome",
                image: "Rome",
                description: "Rome, the capital of Italy, is a city steeped in history and culture. Known for its ancient ruins, including the Colosseum and Roman Forum, it's a vibrant blend of past and present. Home to Vatican City and St. Peter's Basilica, Rome is a significant center for Christianity. The city's rich art, architecture, and culinary scene make it a perennially popular destination for tourists worldwide.",
                transport: [TransportDetails(name: ["""
                                                    Taxi - 2$/KM \
                                                    Bus - 2.5$ \
                                                    Train - 2.5$ \
                                                    Tram - 1.5$
"""])],
                mustSee: [mustSeePlaces(sightsList: ["""
                                                     Colosseum \
                                                     Trevi Fountain of Rome \
                                                     Pantheon \
                                                     St. Peter’s Basilica \
                                                     Vatican Museums
"""])],
                hotels: [popularHotels(hotelList: ["""
                                                   Hotel Splendide Royal \
                                                   J.K. Place Roma \
                                                   The St. Regis Rome \
                                                   Hassler Roma \
                                                   Baglioni Hotel Regina
"""])]
               ),
    cityDetails(name: "Rio De Janeiro",
                image: "RioDejaneiro",
                description: "Rio de Janeiro, often called Rio, is a lively coastal city in Brazil. Renowned for its iconic beaches like Copacabana and Ipanema, it's a hub of vibrant Carnival celebrations and samba music. The striking Christ the Redeemer statue overlooks the city from the Corcovado mountain. Rio boasts a diverse culture, lush landscapes, and a dynamic atmosphere that captivates visitors with its energy and beauty.",
                transport: [TransportDetails(name: ["""
                                                    Taxi - Price: 2$/KM \
                                                    Bus - 2.5$ \
                                                    Train - 2.5$
"""])],
                mustSee: [mustSeePlaces(sightsList: ["""
                                                     place1 \
                                                     place2 \
                                                     place3
"""])],
                hotels: [popularHotels(hotelList: ["""
                                                   Hotel1 \
                                                   hotel2 \
                                                   hotel3
"""])]
               ),
    cityDetails(name: "Sydney",
                image: "Sydney",
                description: "Sydney, city, capital of the state of New South Wales, Australia. Located on Australia's southeastern coast, Sydney is the country's largest city and, with its magnificent harbour and strategic position, is one of the most important ports in the South Pacific.",
                transport: [TransportDetails(name: ["""
                                                    Taxi - Price: 2$/KM \
                                                    Bus - 2.5$ \
                                                    Train - 2.5$
"""])],
                mustSee: [mustSeePlaces(sightsList: ["""
                                                     place1 \
                                                     place2 \
                                                     place3
"""])],
                hotels: [popularHotels(hotelList: ["""
                                                   Hotel1 \
                                                   hotel2 \
                                                   hotel3
"""])]
               )
]

struct CityDetails: View {
    let city: cityDetails
    
    var body: some View {
        NavigationView {
            VStack {
                Text(city.name)
                    .font(.title)
                Image(city.image)
                    .resizable()
                    .frame(width:300, height: 200)
                Text(city.description)
                    .padding()
                    .font(.system(size: 18, weight: .regular))
                NavigationLink(destination: TransportListView(transports:
                                                                city.transport.first?.name ?? [])) {
                    Text("Show Transport")
                    
                }
                NavigationLink(destination: MustSeeListView(mustSeeList: city.mustSee.first?.sightsList ?? [])) {
                    Text("Show Top Destinations")
                }
                NavigationLink(destination: popularHotelsView(popularHotels: city.hotels.first?.hotelList ?? [])) {
                    Text("Show Top Hotels")
                }
                
            }
            
        }
    }
}
struct TransportListView: View {
    let transports: [String]
    var body: some View {
        List{
            ForEach(transports, id: \.self) { transport in Text(transport)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        NavigationLink(destination: ContentView()) {
            Text("Main Page")
        }
    }
    
}



struct MustSeeListView: View {
    let mustSeeList: [String]
    var body: some View {
        List {
            ForEach(mustSeeList, id: \.self) { mustSee in Text(mustSee)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        NavigationLink(destination: ContentView()) {
            Text("Main Page")
        }
    }
}


struct popularHotelsView: View {
    let popularHotels: [String]
    
    var body: some View {
        List {
            ForEach(popularHotels, id: \.self) { hotels in Text(hotels)
                    .fixedSize(horizontal: false, vertical:true)
            }
        }
        NavigationLink(destination: ContentView()) {
            Text("Main Page")
        }
    }
}
