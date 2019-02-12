//
//  CACompanyListViewController.swift
//  ClubApp
//
//  Created by Bhagyashree Haresh Khatri on 08/02/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit
import Kingfisher

class CACompanyListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,CAMembersViewControllerDelegate{
    
    @IBOutlet var companyListTableView: UITableView!
    
    var companiesList = [Company]()
    var filteredCompaniesList = [Company]()
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: UIApplication Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfig()
    }
    
    //MARK: Application Configuration
    
    func uiConfig(){
        loadJSON()
        filteredCompaniesList = companiesList
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        companyListTableView.tableHeaderView = searchController.searchBar
        self.companyListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //MARK: JSONLoading
    
    func loadJSON(){
        if let url = Bundle.main.url(forResource: "generated", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let response = try decoder.decode([Company].self, from: data)
                print(response[0])
                for i in response.indices{
                    let company = response[i]
                    companiesList.append(company)
                }
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    //MARK: UISearchResultsUpdating Delegate
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredCompaniesList = companiesList
            
        } else {
            // Filter the results
                filteredCompaniesList = companiesList.filter
                    { $0.company.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        self.companyListTableView.reloadData()
    }
    
    //MARK: UITableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! CACompanyListTableViewCell
        cell.companyNameLbl?.text = self.filteredCompaniesList[indexPath.section].company
        cell.companyDescriptionLbl?.text = self.filteredCompaniesList[indexPath.section].about
        cell.websiteLbl?.text = self.filteredCompaniesList[indexPath.section].website
        
        let url = URL(string: self.filteredCompaniesList[indexPath.section].logo)
        cell.websiteLogoImageView.kf.setImage(with: url)
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
            if(self.filteredCompaniesList[indexPath.section].isFollowing == "Yes"){
                cell.isFollowingBtn.isSelected = true
            }
            else{
                cell.isFollowingBtn.isSelected = false
            }

            if(self.filteredCompaniesList[indexPath.section].isFavourite == "Yes"){
                cell.isFavourite.isSelected = true
            }
            else{
                cell.isFavourite.isSelected = false
            }

        cell.isFollowingBtn.tag = indexPath.section
        cell.isFollowingBtn.addTarget(self, action: #selector(isFollowingAction(_:)), for: .touchUpInside)
        cell.isFavourite.tag = indexPath.section
        cell.isFavourite.addTarget(self, action: #selector(isFavouriteAction(_:)), for: .touchUpInside)
        return cell
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
        return self.filteredCompaniesList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: CAMembersViewController = storyboard.instantiateViewController(withIdentifier: "CAMembersViewController") as! CAMembersViewController
        controller.MembersListArray = self.filteredCompaniesList[indexPath.section].members!
        controller.companyIndexPathLbl = String(indexPath.section)
        controller.delegate = self
        self.navigationController?.present(controller, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175.0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//        {
//            return 175.0;
//        }
    
    //MARK: IBActions
    
    @IBAction func AscendingAction(_ sender: Any) {
        self.filteredCompaniesList.sort{$0.company < $1.company}
        self.companyListTableView.reloadData()
    }
    
    @IBAction func descendingAction(_ sender: Any) {
        self.filteredCompaniesList.sort{$0.company > $1.company}
        self.companyListTableView.reloadData()
    }
    
    //MARK:Objc Functions
    
     @objc func isFollowingAction(_ button: UIButton)
     {
        if(self.filteredCompaniesList[button.tag].isFollowing == "Yes"){
            self.filteredCompaniesList[button.tag].isFollowing = "No"
        }
        else{
           self.filteredCompaniesList[button.tag].isFollowing = "Yes"
            self.companiesList[button.tag].isFollowing = "Yes"
        }
        self.companyListTableView.reloadData()
        
    }
    
    @objc func isFavouriteAction(_ button: UIButton)
    {
        if(self.filteredCompaniesList[button.tag].isFavourite == "Yes"){
            self.filteredCompaniesList[button.tag].isFavourite = "No"
        }
        else{
            self.filteredCompaniesList[button.tag].isFavourite = "Yes"
            self.companiesList[button.tag].isFavourite = "Yes"
        }
        self.companyListTableView.reloadData()
    }
    
    //MARK:CAMembersViewController Delegate
    
    func persistMemberFavouriteList(indexPath: String,membersList: [Member]) {
        let rowId = Int(indexPath)
        self.filteredCompaniesList[rowId!].members = membersList
    }
    
}

