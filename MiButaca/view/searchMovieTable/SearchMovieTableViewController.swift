//
//  SearchMovieTableViewController.swift
//  MiButaca
//
//  Created by Leti on 21/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit

class SearchMovieTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [Movie] = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 100
        self.title = Constants.buscarPeli
        searchBar.delegate = self
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let spinner: SpinnerProtocol = Spinner(superView: self)
        spinner.start()
        
        let text: String = searchBar.text!
        
        let controller: SearchMovieProtocol! = SearchMovieController(view: self)
        controller.search(movie: text)
    }
    
    func reloadData(movies: [Movie]){
        self.movies = movies
        self.tableView.reloadData()
        
        let spinner: SpinnerProtocol = Spinner(superView: self)
        spinner.stop()
        
        //Hide keyboard
        searchBar.resignFirstResponder()
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellsNames.movieSearchCell, for: indexPath) as! SearchMovieTableViewCell

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
