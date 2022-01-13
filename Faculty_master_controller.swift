import UIKit

class FacultyMasterController: UITableViewController {

    private var arrFacultyNames: [String] = ["Ms.Krou", "Mr.Keefe", "Dr.Ekin", "Dr.Mendez", "Dr.Lee", "Dr.Long", "Dr.J Shah","Dr.Zhang"]
    private var arrTitltes: [String] = ["Senior Lecturer", "Senior Lecturer", "Associate Professor", "Professor", "Associate Professor", "Associate Professor", "Professor","Professor"]
    private var arrCourse: [String] = ["CIS 3213", "CIS 1234", "QMST 1541", "CIS4154", "CIS1456", "QMST1344", "CIS3325", "CIS1234"]
    private var arrPictures = ["krou.png", "keefe.png", "ekin.png", "mendez.png", "lee.png", "long.png", "shah.png", "zhang.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CIS & QMST"
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrFacultyNames.count
    }

    var selectedRowNum: Int = 0
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        selectedRowNum = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "facultyCell", for: indexPath)
        
        cell.textLabel?.text = arrFacultyNames[selectedRowNum]
        cell.detailTextLabel?.text = arrTitltes[selectedRowNum]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    //When run teh app again everything will comeback since it just retain the memory
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrFacultyNames.remove(at: indexPath.row)
            arrTitltes.remove(at: indexPath.row)
            arrCourse.remove(at: indexPath.row)
            arrPictures.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        if let indexPath = tableView.indexPathForSelectedRow
        {
        let selectedRowNum = indexPath.row
        // Get the new view controller using segue.destination.
        let facultyDetailViewController = segue.destination as! FacultyDetailViewController
        
        // Pass the selected object to the new view controller.
        facultyDetailViewController.facultyName = arrFacultyNames [selectedRowNum]
            facultyDetailViewController.courseName = arrCourse[selectedRowNum]
            facultyDetailViewController.facultyPicFileName = arrPictures[selectedRowNum]
        }
    }
    

}
