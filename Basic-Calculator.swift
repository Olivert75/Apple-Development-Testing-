import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var btnClear: UIButton!
	
	@IBOutlet weak var txtNumber1: UITextField!
	
	@IBOutlet weak var txtNumber2: UITextField!
	
	@IBOutlet weak var lblResult: UILabel!
	
	@IBOutlet weak var sliderNumber1: UISlider!
	
	@IBOutlet weak var mathToolBar: UISegmentedControl!
	
	
	@IBOutlet weak var toolBarSwitch: UISwitch!
	
	@IBOutlet weak var sliderNumber2: UISlider!
	
	@IBAction func onSwitch(_ sender: UISwitch)
	{
		
		let anActionSheet = UIAlertController(title: "Are you sure", message: "Switching to Math Toolbar",  preferredStyle:.actionSheet)
		let yesAction = UIAlertAction(title: "Yes, Switch", style: .destructive, handler: {action in self.mathToolBar.isHidden = false})
		let noAction = UIAlertAction(title: "NO!, Don't Switch", style: .cancel, handler:
		{action in self.mathToolBar.isHidden = true
		self.toolBarSwitch.isOn = false
		})
		
		anActionSheet.addAction(yesAction)
		anActionSheet.addAction(noAction)
		
		
		present(anActionSheet, animated:true, completion:nil)

	}
	@IBAction func onSlideChange(_ sender: UISlider)
	{
		txtNumber1.text = String(lroundf(sender.value))
	}
	
	@IBAction func onSlide2Change(_ sender: UISlider)
	{
		txtNumber2.text = String(format:"%.3f", sender.value)
	}
	@IBAction func touchOperation(_ sender: AnyObject)
		
	{
		var op = ""
		if sender.isKind(of: UIButton.self)
		{
			op = sender.title(for: .selected)!
		}
		if sender.isKind(of: UISegmentedControl.self)
		{
			op = sender.titleForSegment(at: sender.selectedSegmentIndex)!
		}
		if op == "C"
		{
			clearUI(btnClear)
		}
		else
		{
		let number1:Double = Double(txtNumber1.text!)!
		let number2:Double = Double(txtNumber2.text!)!
		let aCalculator = CalculatorBrains()
		aCalculator.setOperands(x: number1, y: number2)
		aCalculator.performCalculation(opCode:op)
		lblResult.text = String(format:"%.3f", aCalculator.getResult())
		}
	}
	
	
	@IBAction func displayAlert(_ sender: UIButton)
	{
		let anAlert = UIAlertController(title: "Delete Employee Record", message: "Are you sure you want to delete the record?", preferredStyle: .alert)
		let okAction = UIAlertAction(title: "Yes, Delete", style:.destructive, handler: nil)
		anAlert.addAction(okAction)
		self.present(anAlert, animated: true, completion:nil)
	
		
		
		
	}
	
	@IBAction func clearUI(_ sender: UIButton)
	{
		txtNumber1.text = ""
		txtNumber2.text = ""
		lblResult.text = ""
		sliderNumber1.value = 0.0
		sliderNumber2.value = 0.0
		toolBarSwitch.isOn = false
		mathToolBar.isHidden = true
		
	}
	
	
	@IBAction func tapGesture(_ sender: UITapGestureRecognizer)
	{
		dismissKeyboard()
	}
	
	func dismissKeyboard()
	{
		txtNumber1.resignFirstResponder()
		txtNumber2.resignFirstResponder()
	}
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		mathToolBar.isHidden = true
	}


}