import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.retriveDataFromCore()
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        let anActionSheet = UIAlertController(title: "About to save the contact", message: "Are you sure want to save contact?", preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "Yes, save the data", style: .destructive, handler: {action in self.saveDataToCore()})
        let noAction = UIAlertAction(title: "No, don't save the data", style: .cancel, handler: nil)
        anActionSheet.addAction(yesAction)
        anActionSheet.addAction(noAction)
        present(anActionSheet, animated: true, completion: nil)
    }
    
    @IBAction func btnGet(_ sender: UIButton) {
        self.retriveDataFromCore()
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        txtName.text = ""
        txtEmail.text = ""
        txtPhoneNum.text = ""
    }
    
    func saveDataToCore(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let myContext = appDelegate.persistentContainer.viewContext
        let userDescription = NSEntityDescription.entity(forEntityName: "UserInfo", in: myContext)
        let aUser = NSManagedObject(entity: userDescription!, insertInto:myContext)
        aUser.setValue(txtName.text, forKey: "userName")
        aUser.setValue(txtEmail.text, forKey: "emailAddress")
        aUser.setValue(txtPhoneNum.text, forKey: "phoneNumber")
        do{
            try myContext.save()
            print("Save Successfully")
        }catch{
            print("Save Failed")
        }
    }
    
    func retriveDataFromCore(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let myContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        do{
            let user = try myContext.fetch(fetchRequest)
            if user.count > 0{
                let aUser = user[user.count - 1] as! UserInfo
                txtPhoneNum.text = (aUser.value(forKey: "phoneNumber") as! String)
                txtEmail.text = (aUser.value(forKey: "emailAddress") as! String)
                txtName.text = (aUser.value(forKey: "userName") as! String)
            }
            print("Fetch Successfully")
        }catch{
            print("Fetch Failed")
        }
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        txtName.resignFirstResponder()
        txtEmail.resignFirstResponder()
        txtPhoneNum.resignFirstResponder()
    }
    


}
