//
//  ActivitiesController.swift
//  Bencraft
//
//  Created by Nacho Grasso on 29/10/2019.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase
import Promises

class ActivitiesController : UIViewController,UITableViewDelegate,UITableViewDataSource  {
    var legajo: String!
    
    var act:Array<Activity> = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return act.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "healthyCell", for: indexPath)
        
        cell.textLabel?.text = act[indexPath.row].nombre
        cell.detailTextLabel?.text = act[indexPath.row].desc
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBOutlet weak var activitiesTableView: UITableView!


    
    lazy var background: DispatchQueue = {
        return DispatchQueue.init(label: "background.queue", attributes: .concurrent)
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        activitiesTableView.dataSource = self
        activitiesTableView.delegate = self

        self.background.async {
            self.act = Activity.getMyActivities(legajo: self.legajo)
            DispatchQueue.main.async {
                self.activitiesTableView.reloadData()
            }
        }
//        if (act.count == 0) {
//            sendAlertForNoActivities()
//        }
//
//    func sendAlertForNoActivities() {
//        let alert = UIAlertController(title: "Los datos ingresados son incorrectos.", message: "", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Reintentar", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete"){
            (action,view,completion) in
            let aux = self.act[indexPath.row].meta
            print(aux)
            self.background.async{
                Activity.removeActivity(activityPath: aux,legajo: self.legajo )
                DispatchQueue.main.async {
                    self.activitiesTableView.reloadData()
                }
            }
            self.act.remove(at: indexPath.row)
            self.activitiesTableView.deleteRows(at:[indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .red
        return action
        
        }
    }
}


