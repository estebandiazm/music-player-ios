//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Juan Diaz on 27/08/18.
//  Copyright © 2018 Juan Diaz. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var songs : Array<Array<String>> = Array<Array<String>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Canciones"
        
        songs.append(["popcorn-Te_Equivocas_si_no_Crees","mp3","popcorn-Te_Equivocas_si_no_Crees.jpg"])
        songs.append(["El sin sentido-Perdiendo el control","mp3","El sin sentido-Perdiendo el control.jpg"])
        songs.append(["Andres Cepeda FT Cali y El Dande, Te voy amar","mp3","Andres Cepeda FT Cali y El Dande, Te voy amar.jpg"])
        songs.append(["FANTASIA DEARLYS","mp3","FANTASIA DEARLYS.jpeg"])
        songs.append(["Cali Y El Dandee Sirena","mp3","Cali Y El Dandee Sirena.jpeg"])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //Configure the cell...
        cell.textLabel?.text = self.songs[indexPath.row][0]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! PlayerViewController
        let index = self.tableView.indexPathForSelectedRow
        
        if index != nil {
            controller.songName = self.songs[index!.row][0]
            controller.songExt = self.songs[index!.row][1]
            controller.imageName = self.songs[index!.row][2]
        }
    }
}

