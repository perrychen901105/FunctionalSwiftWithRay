//: Playground - noun: a place where people can play

import UIKit

enum RideType{
    case Family
    case Kids
    case Thrill
    case Scary
    case Relaxing
    case Water
}

struct Ride {
    let name: String
    let types: Set<RideType>
    let waitTime: Double
}

let parkRides = [
    Ride(name: "Raging Rapids", types: [.Family, .Thrill, .Water], waitTime: 45.0),
    Ride(name: "Crazy Funhouse", types: [.Family], waitTime: 10.0),
    Ride(name: "Spinning Tea Cups", types: [.Kids], waitTime: 15.0),
    Ride(name: "Spooky Hollow", types: [.Scary], waitTime: 30.0),
    
]
