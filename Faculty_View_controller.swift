import UIKit

class FacultyDetailViewController: UIViewController {

    @IBOutlet weak var lblFacultyController: UILabel!
    @IBOutlet weak var lblCourseTaught: UILabel!
    @IBOutlet weak var ingFacultyPicture: UIImageView!
    
    
    //local variables to hold data brings sent by the faculty master view controller
    
    var facultyName:String = ""
    var courseName:String = ""
    var facultyPicFileName:String = ""
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = facultyName
        lblFacultyController.text = facultyName
        lblCourseTaught.text = courseName
        ingFacultyPicture.image = UIImage(named: facultyPicFileName)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}