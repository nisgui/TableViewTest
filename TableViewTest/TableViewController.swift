//
//  TableViewController.swift
//  TableViewTest
//
//  Created by Aluno Mack on 11/09/19.
//  Copyright © 2019 MaatheusGois.Academy.Storybord.Trainer. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    var videos: [Video] = []
    var currentVideo = [Video]() //update table
    var searchCountry = [String]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videos = createArray()
        currentVideo = videos
        setUpSearchBar()

    }
//conteudo do array
    func createArray() -> [Video] {
        var tempVideos: [Video] = []
        
        
        let video1 = Video(image: #imageLiteral(resourceName: "car"), title: "Car")
        let video2 = Video(image: #imageLiteral(resourceName: "landscape"), title: "Lanscape")
        let video3 = Video(image: #imageLiteral(resourceName: "lay"), title: "City")
        let video4 = Video(image: #imageLiteral(resourceName: "phrase"), title: "Phrase")
        let video5 = Video(image: #imageLiteral(resourceName: "bird"), title: "Owl")
        let video6 = Video(image: #imageLiteral(resourceName: "writing"), title: "Writing")
        let video7 = Video(image: #imageLiteral(resourceName: "fire"), title: "Fire")
        
        
        tempVideos.append(video1)
        tempVideos.append(video2)
        tempVideos.append(video3)
        tempVideos.append(video4)
        tempVideos.append(video5)
        tempVideos.append(video6)
        tempVideos.append(video7)
        
        currentVideo = videos
        return tempVideos
    }
//insert button
    @IBAction func addButton(_ sender: Any) {
        insertNewVideoTitle()
    }
    
    func insertNewVideoTitle(){
        
    }
//search bar
    private func setUpSearchBar(){
        searchBar.delegate = self
    }
    
//pass data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Because view is going to have multiple segue's going to different views, you have to identify wich segue's you are working with
        if segue.identifier == "MasterOfDetail"{
            let dest = segue.destination as! DetailViewController
            dest.video = sender as? Video
            
        }
    }
}
extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    // this is determining how many rows the table view actually shows and tells it to return the number of videos
    //type numberOfRows to a quick path
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return currentVideo.count
        
    }
    //type cell to a quick path
    //this function will be called every time a new cell appears and gonna display the propper data into that index cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = currentVideo[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCellTableViewCell;
        
        cell.setVideo(video: video)
        return cell



    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if you tap in the 4th row, is going to give index 3 (cause it starts in 0)
        let video = currentVideo[indexPath.row]
        performSegue(withIdentifier: "MasterOfDetail", sender: video)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

    
    //func numberOfSections(in tableView: UITableView) -> Int {
        //return 3
    //}
    //func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return

}

//searchBar
extension TableViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
        currentVideo = videos
        table.reloadData()
        return
    }
        currentVideo = videos.filter({ (Video) -> Bool in Video.title.lowercased().contains(searchText.lowercased())})
        table.reloadData()
    

    }
    

}
