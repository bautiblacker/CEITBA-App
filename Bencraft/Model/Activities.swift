//
//  Activities.swift
//  Bencraft
//
//  Created by Nacho Grasso on 29/10/2019.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase
import Promises

public struct Activity: Codable, Equatable{
    public let desc: String
    public let nombre: String
    public let meta: String

    
}

extension Activity{
    public static func ==(activity1:Activity,activity2:Activity)->Bool{
        return activity1.nombre == activity2.nombre
    }
    static func getMyActivitiesPath(legajo:String)-> Promise<Array<String>> {
            let a = Promise<Array<String>> {(resolve, reject) in
    
                let ref = Database.database().reference(withPath: "usuarios").child(legajo)
                ref.observe(.value) { (snap) in
                    snap.ref.removeAllObservers()
                    guard let dict = snap.value as? NSDictionary else { return }
                    let data = try! JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                    let usuario = try! JSONDecoder.init().decode(Usuario.self,from:data)
                    resolve(usuario.actividades)
                    
                }
            }
            return a
        }
    
    static func getActivity(activityPath:String) -> Promise<Activity> {
        let path = activityPath.components(separatedBy: "/")
        let a = Promise<Activity> {(resolve, reject) in
            let ref = Database.database().reference(withPath: path[0]).child(path[1])
            ref.observe(.value) { (snap) in
                snap.ref.removeAllObservers()
                guard let dict = snap.value as? NSDictionary else { return }
                let data = try! JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                let act = try! JSONDecoder.init().decode(Activity.self,from:data)
                resolve(act)
            }
        }
        return a
    }
    
    static func getMyActivities(legajo:String) -> Array<Activity> {
        let activitiesPath: Array<String> = try! await(self.getMyActivitiesPath(legajo: legajo))
        
        var activities = Array<Activity>()
        
        if activitiesPath[0].count == 0{
            
            return activities
        }
        else{
            activitiesPath.forEach{ activityPath in
                
                let act: Activity = try! await(self.getActivity(activityPath: activityPath))
                activities.append(act)

            }

            return activities
        }
        

    }
    
    static func removeActivity(activityPath:String,legajo:String) -> Bool {
        var activitiesPath: Array<String> = try! await(self.getMyActivitiesPath(legajo:legajo))
        if let index = activitiesPath.firstIndex(of: activityPath){
            activitiesPath.remove(at: index)
            var values = ["actividades": activitiesPath]
            if activitiesPath.isEmpty {
                values = ["actividades": [""]]
            }
            
            let ref = Database.database().reference(withPath: "usuarios").child("57129")
            ref.updateChildValues(values)
        }
        
        return true;
    }
}
