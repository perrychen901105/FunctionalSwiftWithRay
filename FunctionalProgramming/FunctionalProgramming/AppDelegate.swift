//
//  AppDelegate.swift
//  FunctionalProgramming
//
//  Created by PerryChen on 12/24/15.
//  Copyright © 2015 PerryChen. All rights reserved.
//

import UIKit
import Foundation
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
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
        
        var parkRides = [
            Ride(name: "Raging Rapids", types: [.Family, .Thrill, .Water], waitTime: 45.0),
            Ride(name: "Crazy Funhouse", types: [.Family], waitTime: 10.0),
            Ride(name: "Spinning Tea Cups", types: [.Kids], waitTime: 15.0),
            Ride(name: "Spooky Hollow", types: [.Scary], waitTime: 30.0),
            Ride(name: "Thunder Coaster", types: [.Family, .Thrill], waitTime:60.0),
            Ride(name: "Grand Carousel", types: [.Family, .Kids], waitTime: 15.0),
            Ride(name: "Bumper Boats", types: [.Family, .Water], waitTime: 25.0),
            Ride(name: "Mountain Railroad", types: [.Family, .Relaxing], waitTime: 0.0)
        ]
        
        parkRides[0] = Ride(name: "Functional Programming", types: [.Thrill], waitTime: 5.0)
        
        func sortedNames(rides: [Ride]) -> [String] {
            var sortedRides = rides
            var i, j : Int
            var key: Ride
            
            // 1 Looping over all the rides passed into the function
            for (i = 0; i < sortedRides.count; i++) {
                key = sortedRides[i]
                
                // 2 Performing an insertion sort
                for (j = i; j > -1; j--) {
                    if key.name.localizedCompare(sortedRides[j].name) == .OrderedAscending {
                        sortedRides.removeAtIndex(j + 1)
                        sortedRides.insert(key, atIndex: j)
                    }
                }
            }
            
            // 3 Gathering the names of the sorted rides
            var sortedNames = [String]()
            for ride in sortedRides {
                sortedNames.append(ride.name)
            }
            
            print(sortedRides)
            
            return sortedNames
        }
        print(sortedNames(parkRides))
        
        var originalNames = [String]()
        for ride in parkRides {
            originalNames.append(ride.name)
        }
        print(originalNames)
    
        func waitTimeIsShort(ride: Ride) -> Bool {
            return ride.waitTime < 15.0
        }
        
//        var shortWaitingTimeRides = parkRides.filter(waitTimeIsShort)
        var shortWaitingTimeRides = parkRides.filter {
            $0.waitTime < 15.0
        }
        print(shortWaitingTimeRides)
        
        let rideNames = parkRides.map { $0.name }
        print(rideNames.sort(<))
        
        let averageWaitTime = parkRides.reduce(0.0) { (average, ride) -> Double in
           average + ride.waitTime/Double(parkRides.count)
        }
        print(averageWaitTime)
        
        func rideTypeFilter(type: RideType)(fromRides rides: [Ride]) -> [Ride] {
            return rides.filter { $0.types.contains(type) }
        }
        
        func createRideTypeFilter(type: RideType) -> ([Ride] -> [Ride]) {
            return rideTypeFilter(type)
        }
        
        let kidRideFilter = createRideTypeFilter(.Kids)
        print(kidRideFilter(parkRides))
        
        func ridesWithWaitTimeUnder(waitTime: Double, fromRides rides: [Ride]) -> [Ride] {
            return rides.filter { $0.waitTime < waitTime }
        }
        
//        var shortWaitRides = ridesWithWaitTimeUnder(15.0, fromRides: parkRides)
//        assert(shortWaitRides.count == 2, "Count of short wait rides should be 2")
//        print(shortWaitRides)
//        
//        extension Ride: Comparable { }
//        
//        func
        
        return true
    }

}

