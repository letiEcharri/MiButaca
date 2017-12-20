//
//  MoviesTableViewController.swift
//  MiButaca
//
//  Created by Leti on 18/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var movies: [Movie] = [Movie]()
    let cellName = "movieTableCell"
    
    override func viewWillAppear(_ animated: Bool) {
        let controller: MoviesTableProtocol = MoviesTableController(view: self)
        movies = controller.getMoviesFromDevice()
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        print("NUMERO FILAS: \(movies.count)")
        self.tableView.rowHeight = 100
        self.title = Constants.moviesName
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! MoviesTableViewCell
        
        // Configure the cell...
        cell.display(title: movies[indexPath.row].title)
        cell.display(gender: movies[indexPath.row].gender)
        cell.display(score: movies[indexPath.row].score)
        
        let image: UIImage = movies[indexPath.row].picture.loadImageFromURL()
        cell.display(image: image)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
