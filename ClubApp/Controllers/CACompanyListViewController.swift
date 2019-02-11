//
//  CACompanyListViewController.swift
//  ClubApp
//
//  Created by Bhagyashree Haresh Khatri on 08/02/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit


class CACompanyListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,CAMembersViewControllerDelegate{
    
    @IBOutlet var companyListTableView: UITableView!
    var companies = [
        Model.Company(name: "Google", description: "The main purpose of Google Search is to hunt for text in publicly accessible documents offered by web servers, as opposed to other data, such as images or data contained in databases.", website: "www.google.com",logo: "GoogleImg",isFollowing: "No",isFavourite: "No",membersList: [Model.members(name: "Hal Abelson",age: 50,number: +60172128411,email:"HalAbelson.@gmail.com",isMemberFavourite:"No"),Model.members(name: "Harald Tveit Alvestrand ",age: 57,number: +60172228411,email:"HAlvestrand@gmail.com",isMemberFavourite:"No"),Model.members(name: "Tim Armstrong",age: 40,number: +60172226411,email:"Timarmstrong@gmail.com",isMemberFavourite:"No"),Model.members(name: "Krishna Bharat",age: 26,number: +60172268411,email:"KrishnaBharat@gmail.com",isMemberFavourite:"No"),Model.members(name: "Harald Hoe",age: 30,number: +60172228411,email:"HAlveshoe@gmail.com",isMemberFavourite:"No"),Model.members(name: "Adam Bosworth",age: 23,number: +60152228411,email:"Adambosworth@gmail.com",isMemberFavourite:"No"),Model.members(name: "Daniel Bleichenbacher",age: 34,number: +60122228411,email:"DanielBleichenbacher@gmail.com",isMemberFavourite:"No"),Model.members(name: "Joshua Bloch",age: 40,number: +60173228411,email:"Joshuabloch@gmail.com",isMemberFavourite:"No")]),
                     
        Model.Company(name: "Apple", description: "Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software.", website: "www.apple.com", logo: "appleImg",isFollowing: "No",isFavourite: "No",membersList:[Model.members(name: "Steve Jobs",age: 50,number: +60172128411,email:"SteveJobs.@gmail.com",isMemberFavourite:"No"),Model.members(name: "Mike Markkula",age: 57,number: +60172228411,email:"MikeMarkkula@gmail.com",isMemberFavourite:"No"),Model.members(name: "Bill Fernandez",age: 40,number: +60172226411,email:"BillFernandez@gmail.com",isMemberFavourite:"No"),Model.members(name: "Rod Holt",age: 26,number: +60172268411,email:"RodHolt@gmail.com",isMemberFavourite:"No"),Model.members(name: "Steve Wozniak",age: 30,number: +60172228411,email:"SteveWozniak@gmail.com",isMemberFavourite:"No")]),
                     
        Model.Company(name: "Facebook", description: "Facebook, Inc. engages in the development of social media applications for people to connect through mobile devices, personal computers, and other surfaces.", website: "www.facebook.com", logo: "facebookImg",isFollowing: "No",isFavourite: "No",membersList: [Model.members(name: "Mark Zuckerberg",age: 50,number: +60172128411,email:"MarkZuckerberg@gmail.com",isMemberFavourite:"No"),Model.members(name: "Blake Ross",age: 57,number: +60172228411,email:"BlakeRoss@gmail.com",isMemberFavourite:"No"),Model.members(name: "David Wehner",age: 40,number: +60172226411,email:"DavidWehner@gmail.com",isMemberFavourite:"No"),Model.members(name: "Dustin Moskovitz",age: 26,number: +60172268411,email:"DustinMoskovitz@gmail.com",isMemberFavourite:"No"),Model.members(name: "Andrew McCollum",age: 30,number: +60172228411,email:"AndrewMcCollum@gmail.com",isMemberFavourite:"No")]),
                    
        Model.Company(name: "Twitter", description: "Twitter, Inc. The Company's products and services include Twitter, Periscope, Promoted Tweets, Promoted Accounts and Promoted Trends.", website: "www.twitter.com", logo: "twitterImg",isFollowing: "No",isFavourite: "No",membersList: [Model.members(name: "Albert Sheu",age: 50,number: +60172128411,email:"AlbertSheu@gmail.com",isMemberFavourite:"No"),Model.members(name: "Alexander Macgillivray",age: 57,number: +60172228411,email:"AlexanderMacgillivray@gmail.com",isMemberFavourite:"No"),Model.members(name: "Chloe Sladden",age: 40,number: +60172226411,email:"ChloeSladden@gmail.com",isMemberFavourite:"No"),Model.members(name: "Doug Cook",age: 26,number: +60172268411,email:"DougCook@gmail.com",isMemberFavourite:"No"),Model.members(name: "Andrew McCollum",age: 30,number:+60172428411,email:"AndrewMcCollum@gmail.com",isMemberFavourite:"No")]),
                     
        Model.Company(name: "LinkedIn", description: "A Showcase Page is a subpage of your Company Page, that allows you to promote specific products or services to a very specific audience.", website: "www.linkedin.com", logo: "linkedInImg",isFollowing: "No",isFavourite: "No",membersList: [Model.members(name: "Albert Sheu",age: 50,number: +60172128411,email:"AlbertSheu@gmail.com",isMemberFavourite:"No"),Model.members(name: "Alexander Macgillivray",age: 57,number: +60172228411,email:"AlexanderMacgillivray@gmail.com",isMemberFavourite:"No"),Model.members(name: "Chloe Sladden",age: 40,number: +60172226411,email:"ChloeSladden@gmail.com",isMemberFavourite:"No"),Model.members(name: "Doug Cook",age: 26,number: +60172268411,email:"DougCook@gmail.com",isMemberFavourite:"No"),Model.members(name: "Andrew McCollum",age: 30,number: +60172428411,email:"AndrewMcCollum@gmail.com",isMemberFavourite:"No")]),
                     
        Model.Company(name: "WhatsApp", description: "WhatsApp Inc. operates as a cross-platform mobile messaging company. The company's cross-platform communication application allows users to exchange unlimited text.", website: "www.whatsapp.com", logo: "watsappImg",isFollowing: "No",isFavourite: "No",membersList: [Model.members(name: "Mark Zuckerberg",age: 50,number: +60172128411,email:"MarkZuckerberg@gmail.com",isMemberFavourite:"No"),Model.members(name: "Blake Ross",age: 57,number: +60172228411,email:"BlakeRoss@gmail.com",isMemberFavourite:"No"),Model.members(name: "David Wehner",age: 40,number: +60172226411,email:"DavidWehner@gmail.com",isMemberFavourite:"No"),Model.members(name: "Dustin Moskovitz",age: 26,number: +60172268411,email:"DustinMoskovitz@gmail.com",isMemberFavourite:"No"),Model.members(name: "Andrew McCollum",age: 30,number: +60172228411,email:"AndrewMcCollum@gmail.com",isMemberFavourite:"No")]),
                     
        Model.Company(name: "Xing", description: "XING is a social network for business professionals to connect and share ideas and projects, as well as find suitable employment. XING Is the social network for business professionals.", website: "www.xing.com", logo: "XingImg",isFollowing: "No",isFavourite: "No",membersList: [Model.members(name: "Hal Abelson",age: 50,number: +60172128411,email:"HalAbelson.@gmail.com",isMemberFavourite:"No"),Model.members(name: "Harald Tveit Alvestrand ",age: 57,number: +60172228411,email:"HAlvestrand@gmail.com",isMemberFavourite:"No"),Model.members(name: "Tim Armstrong",age: 40,number: +60172226411,email:"Timarmstrong@gmail.com",isMemberFavourite:"No"),Model.members(name: "Krishna Bharat",age: 26,number: +60172268411,email:"KrishnaBharat@gmail.com",isMemberFavourite:"No"),Model.members(name: "Harald Hoe",age: 30,number: +60172228411,email:"HAlveshoe@gmail.com",isMemberFavourite:"No"),Model.members(name: "Adam Bosworth",age: 23,number: +60152228411,email:"Adambosworth@gmail.com",isMemberFavourite:"No"),Model.members(name: "Daniel Bleichenbacher",age: 34,number: +60122228411,email:"DanielBleichenbacher@gmail.com",isMemberFavourite:"No"),Model.members(name: "Joshua Bloch",age: 40,number: +60173228411,email:"Joshuabloch@gmail.com",isMemberFavourite:"No")])
                     ]
    
    var filteredCompanies = [Model.Company]()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    //MARK: UIApplication Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiConfig()
        
    }
    
    //MARK: Application Configuration
    
    func uiConfig(){
        filteredCompanies = companies
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        companyListTableView.tableHeaderView = searchController.searchBar
        self.companyListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //MARK: UISearchResultsUpdating Delegate
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredCompanies = companies
        } else {
            // Filter the results
            filteredCompanies = companies.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        self.companyListTableView.reloadData()
    }
    
    //MARK: UITableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! CACompanyListTableViewCell
        cell.companyNameLbl?.text = self.filteredCompanies[indexPath.section].name
        cell.companyDescriptionLbl?.text = self.filteredCompanies[indexPath.section].description
        cell.websiteLbl?.text = self.filteredCompanies[indexPath.section].website
        cell.websiteLogoImageView.image = UIImage (named: self.filteredCompanies[indexPath.section].logo)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
            if(self.filteredCompanies[indexPath.section].isFollowing == "Yes"){
                cell.isFollowingBtn.isSelected = true
            }
            else{
                cell.isFollowingBtn.isSelected = false
            }
        
            if(self.filteredCompanies[indexPath.section].isFavourite == "Yes"){
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
        return self.filteredCompanies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: CAMembersViewController = storyboard.instantiateViewController(withIdentifier: "CAMembersViewController") as! CAMembersViewController
        controller.membersListArray = self.filteredCompanies[indexPath.section].membersList
        controller.companyIndexPathLbl = String(indexPath.section)
        controller.delegate = self
        self.navigationController?.present(controller, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            return 175.0;
        }
    
    //MARK: IBActions
    
    @IBAction func AscendingAction(_ sender: Any) {
        self.filteredCompanies.sort{$0.name < $1.name}
        self.companyListTableView.reloadData()
    }
    
    
    @IBAction func descendingAction(_ sender: Any) {
        self.filteredCompanies.sort{$0.name > $1.name}
        self.companyListTableView.reloadData()
    }
    
    //MARK:Objc Functions
    
     @objc func isFollowingAction(_ button: UIButton)
     {
        if(self.filteredCompanies[button.tag].isFollowing == "Yes"){
            self.filteredCompanies[button.tag].isFollowing = "No"
        }
        else{
           self.filteredCompanies[button.tag].isFollowing = "Yes"
        }
        self.companyListTableView.reloadData()
        
    }
    
    @objc func isFavouriteAction(_ button: UIButton)
    {
        if(self.filteredCompanies[button.tag].isFavourite == "Yes"){
            self.filteredCompanies[button.tag].isFavourite = "No"
        }
        else{
            self.filteredCompanies[button.tag].isFavourite = "Yes"
        }
        self.companyListTableView.reloadData()
        
    }
    
    //MARK:CAMembersViewController Delegate
    
    func persistMemberFavouriteList(indexPath: String,membersList: [Model.members]) {
        let rowId = Int(indexPath)
        self.filteredCompanies[rowId!].membersList = membersList
    }
    
}

