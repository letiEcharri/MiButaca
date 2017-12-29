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
    let cellName = Constants.cellsNames.movieCell
    var rowNumber: Int = 0
    var rowIndex: IndexPath = IndexPath()
    var movieIDdescription = ""
    var movieIDFirebase = ""
    
    override func viewWillAppear(_ animated: Bool) {
        //Get movies from coredata
        let controller: MoviesTableProtocol = MoviesTableController(view: self)
        movies = controller.getMoviesFromDevice()
        
        //Style backbutton
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        //Add Search right button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchAction(sender:)))
        
        //Add Search left button
        navigationItem.leftBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(goToHome(sender:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        print("NUMERO FILAS: \(movies.count)")
        self.tableView.rowHeight = 100
        self.title = Constants.moviesName
    }
    
    @objc func searchAction(sender: UIBarButtonItem){
        DispatchQueue.main.async{
            self.performSegue(withIdentifier: Constants.segue.MoviesToSearch, sender: nil)
        }
    }
    
    func reloadData(){
        DispatchQueue.main.async{
            self.tableView.reloadData()
            print("")
        }
    }
    
    func goToDescription(){
        DispatchQueue.main.async{
            self.performSegue(withIdentifier: Constants.segue.MoviesToDescription, sender: nil)
        }
    }
    
    @objc func goToHome(sender: UIBarButtonItem){
        DispatchQueue.main.async{
            self.performSegue(withIdentifier: Constants.segue.MoviesToHome, sender: nil)
        }
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
        
        cell.save(id: movies[indexPath.row].id)
        cell.save(idFirebase: movies[indexPath.row].idFirebase)
        
        let image: UIImage = movies[indexPath.row].picture.loadImageFromURL()
        cell.display(image: image)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieIDdescription = movies[indexPath.row].id
        rowIndex = indexPath
        movieIDFirebase = movies[indexPath.row].idFirebase
        
        goToDescription()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        tableView.deselectRow(at: rowIndex, animated: true)
        
        if segue.identifier == Constants.segue.MoviesToDescription{
            let view: DescriptionViewController = segue.destination as! DescriptionViewController
            
            view.idMovie = movieIDdescription
            view.idFirebase = movieIDFirebase
            view.moviesView = self
        }else if segue.identifier == Constants.segue.MoviesToSearch{
            let view: SearchMovieTableViewController = segue.destination as! SearchMovieTableViewController
            
            view.moviesView = self
        }
    }
    

}
