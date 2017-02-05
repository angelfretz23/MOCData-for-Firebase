//
//  DatabaseListTableViewController.swift
//  MOCData
//
//  Created by Angel Contreras on 1/28/17.
//  Copyright © 2017 Angel-Contreras. All rights reserved.
//

import UIKit

class DatabaseListTableViewController: UITableViewController{
    
    let databaseController = DatabaseController()
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NewDatabaseAdded, object: nil)
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return databaseController.databases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "databaseCell", for: indexPath) as? DatabaseListTableViewCell
        
        let database = databaseController.databases[indexPath.row]
        cell?.updateCellWith(database: database)
        
        return cell ?? DatabaseListTableViewCell()
    }
    
    func reloadTableView(){
        tableView.reloadData()
    }
    
    weak var okAction: UIAlertAction?
    @IBAction func newDatabase(_ sender: UIBarButtonItem){
        let alertController = UIAlertController(title: "New Database", message: "Enter a name for a new database.", preferredStyle: .alert)
        
        //Add Textfield to Alertcontroller
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Database Name"
            //listen for changes
            NotificationCenter.default.addObserver(self, selector: #selector(self.alertControllerTextFieldTextDidChange(notification:)), name: .UITextFieldTextDidChange, object: textField)
        }
        
        func removeObservers(){
            NotificationCenter.default.removeObserver(self, name: .UITextFieldTextDidChange, object: alertController.textFields?.first)
        }
        
        // Actions
        let otherOkAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK pressed")
        
            removeObservers()
            guard let databaseName = alertController.textFields?.first?.text else { return }
            self.databaseController.add(database: Database(name: databaseName))
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            print("Cancel pressed")
            removeObservers()
        }
        
        //Disable the OK Action
        otherOkAction.isEnabled = false
        
        //save the reference of the OK Action to toggle the enable property
        okAction = otherOkAction
        
        //Add AlertActions
        alertController.addAction(otherOkAction)
        alertController.addAction(cancelAction)
    
        present(alertController, animated: true, completion: nil)
    }
    
    func alertControllerTextFieldTextDidChange(notification: Notification){
        let textField = notification.object as! UITextField
        okAction?.isEnabled = (textField.text?.characters.count)! >= 1
    }
}
