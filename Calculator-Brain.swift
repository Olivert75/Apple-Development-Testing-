import Foundation

class CalculatorBrains
{
	private var xValue:Double = 0.0
	private var yValue:Double = 0.0
	private var result:Double = 0.0
	
	//public Methods
	
	func setOperands(x numX:Double,  y numY:Double)
	{
		xValue = numX
		yValue = numY
		
	}
	
	func performCalculation(opCode:String)
	{
		switch opCode
		{
		case "➕": result = xValue + yValue
		case "➖": result = xValue - yValue
		case "✖️": result = xValue * yValue
		case "➗":
			if yValue > 0 {result = xValue/yValue} else {result = 0.0}
		case "C": result = 0.0
		default:
			result = 0.0
		}
		
	}
	func getResult() -> Double
	{
		return result
	}
	
} //end of class definition