//
//  UserTableViewController.swift
//  MultipleSectionTask
//
//  Created by Sachin on 22/06/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    var section : Int = 0
    var firstSectionData : [String] = []
    var secondSectionData : [String] = []
    var thirdSectionData : [String] = []
    var newmachine : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstSectionData.append("MacBook")
        self.firstSectionData.append("MacBookPro")
        self.firstSectionData.append("MacBookPro2")
        self.secondSectionData.append("Dell Inspiron")
        self.secondSectionData.append("Lenovo Yuga 8000")
        self.secondSectionData.append("HP")
        self.secondSectionData.append("Asus")
        self.thirdSectionData.append("HP")
        self.thirdSectionData.append("Asus")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section = section
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return firstSectionData.count
        case 1:
            return secondSectionData.count
        case 2:
            return thirdSectionData.count
        default:
            return 1
        }
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        print("IndexPthofSection : \(indexPath.section)")
        print("Indexof row : \(indexPath.row)")
        
        switch (indexPath.section) {
        case 0:
           cell.textLabel?.text = firstSectionData[indexPath.row]
        case 1:
            cell.textLabel?.text = secondSectionData[indexPath.row]
        case 2:
           cell.textLabel?.text = thirdSectionData[indexPath.row]
        default:
            cell.textLabel?.text = "No Data"

        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 40.0
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 10.0
    }
    
//   override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
//        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
//        label.text = "HIHIHI"
//        label.textColor = UIColor.brown
//        self.view.addSubview(view)
//
//    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "MacOS Compactible"
        case 1:
            return "Windows Compactible"
        case 2:
            return "Linux Compactible"
        default:
            return "Category Unknown"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.orange
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 0, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont(name: "Verdana", size: 30)
        headerLabel.textColor = UIColor.white
        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)

        return headerView
    }
    
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return ""
//        case 1:
//            return ""
//        case 2:
//            return "End of Category"
//        default:
//            return "Category Unknown"
//        }

//    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.orange
        let footerLabel = UILabel(frame: CGRect(x: 30, y: 0, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        footerLabel.addSubview(footerView)

        return footerView
    }
   
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let addAction = UIContextualAction(style: .destructive, title: "Add") { (action, view, handler) in
        switch indexPath.section {
        case 0:
            let alertController = UIAlertController(title: "Add Data", message: "Please Add New in Popular Category", preferredStyle: .alert)
            alertController.addTextField(configurationHandler: { (textField) in
                textField.placeholder = "Enter New Machine"
                self.newmachine = textField.text!
                print("New Machine Data : \(String(describing: textField.text))")
            })
            let save = UIAlertAction(title: "Save", style: .default ) { (action:UIAlertAction) in
                self.firstSectionData.insert(self.newmachine, at: indexPath.row + 1)
                tableView.reloadData()
                print("FirstSectioned Data : \(self.firstSectionData)")
                
            }
            let cancel = UIAlertAction(title: "Cancel", style: .default ) { (action:UIAlertAction) in

            }
            alertController.addAction(cancel)
            alertController.addAction(save)
            self.present(alertController, animated: true, completion: nil)
            
                    
        case 1:
            self.secondSectionData.insert("New Row Added", at: indexPath.row + 1)
            tableView.reloadData()
                    
        case 2:
            self.thirdSectionData.insert("New Row Added", at: indexPath.row + 1)
            tableView.reloadData()
                    
        default:
            return
        }
        }
        addAction.backgroundColor = .blue
        let configuration = UISwipeActionsConfiguration(actions: [addAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
        switch indexPath.section {
        case 0:
            self.firstSectionData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadRows(at: [indexPath], with: .fade)
                
        case 1:
            self.secondSectionData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadRows(at: [indexPath], with: .fade)
                
        case 2:
            self.thirdSectionData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadRows(at: [indexPath], with: .fade)
                
        default:
            return
        }
        }
        deleteAction.backgroundColor = .orange
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        switch indexPath.section {
        case 0:
            return true
        case 1:
            return true
        case 2:
            return true
        default:
            return false
        }
    }
    
}
