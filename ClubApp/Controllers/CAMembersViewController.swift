//
//  CAMembersViewController.swift
//  ClubApp
//
//  Created by Bhagyashree Haresh Khatri on 10/02/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit

protocol CAMembersViewControllerDelegate: class {
    func persistMemberFavouriteList(indexPath: String,membersList:[Model.members])
}

class CAMembersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {
    
    var membersListArray = [Model.members]()
    var filteredMembers = [Model.members]()
    weak var delegate: CAMembersViewControllerDelegate?
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var memberTableView: UITableView!
    var companyIndexPathLbl = String()
    
    //MARK: UIApplication Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        uiConfig()
    }
    
    //MARK: Application Configuration
    
    func uiConfig(){
        self.memberTableView.delegate = self
        self.memberTableView.dataSource = self
        filteredMembers = membersListArray
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        memberTableView.tableHeaderView = searchController.searchBar
    }
    
    //MARK: UISearchResultsUpdating Delegate
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredMembers = membersListArray
        }
        else {
            // Filter the results
            filteredMembers = membersListArray.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        self.memberTableView.reloadData()
    }
    
    //MARK: UITableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CAMembersListTableViewCellIdentifier", for: indexPath) as! CAMembersListTableViewCell
        cell.memberNameLbl?.text = self.filteredMembers[indexPath.section].name
        cell.memberAgeLbl?.text = String(self.filteredMembers[indexPath.section].age)
        cell.memberMailLbl?.text = self.filteredMembers[indexPath.section].email
        cell.memberPhoneNoLbl?.text = String(self.filteredMembers[indexPath.section].number)
        
            if(self.filteredMembers[indexPath.section].isMemberFavourite == "Yes"){
                cell.isFavourite.isSelected = true
            }
            else{
                cell.isFavourite.isSelected = false
            }
        cell.isFavourite.tag = indexPath.section
        cell.isFavourite.addTarget(self, action: #selector(isFavouriteAction(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 127.0;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor =  UIColor(red: 194.0/255, green: 194.0/255, blue: 199.0/255, alpha: 0.20)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.filteredMembers.count
    }
    
    //MARK: IBActions
    
    @IBAction func ascendingAction(_ sender: Any) {
        self.filteredMembers.sort{$0.name < $1.name}
        self.memberTableView.reloadData()
    }
    
    @IBAction func descendingAction(_ sender: Any) {
        self.filteredMembers.sort{$0.name > $1.name}
        self.memberTableView.reloadData()
    }
    
    @IBAction func BackAction(_ sender: Any) {
        delegate?.persistMemberFavouriteList(indexPath: companyIndexPathLbl,membersList: self.filteredMembers)
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:Objc Functions
    
    @objc func isFavouriteAction(_ button: UIButton)
    {
        if(self.filteredMembers[button.tag].isMemberFavourite == "Yes"){
            self.filteredMembers[button.tag].isMemberFavourite = "No"
        }
        else{
            self.filteredMembers[button.tag].isMemberFavourite = "Yes"
        }
        self.memberTableView.reloadData()
        
    }
}
