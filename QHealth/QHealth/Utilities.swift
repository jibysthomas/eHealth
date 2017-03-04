//
//  Utilities.swift
//  MyWallet
//
//  Created by Hafiz Abdul Kareem on 1/4/16.
//  Copyright © 2016 Hafiz Abdul Kareem. All rights reserved.
//

import UIKit

var SETTINGS_PLIST:String = "Setting"

@objc class Utilities: NSObject {
    class func checkIsEmptyString( _ checkString1:String?)->Bool{
        var checkString = checkString1 as NSString?
        var isEmpty: Bool = true
        if checkString != nil{
            isEmpty = false
            checkString = checkString!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString?
            if (checkString == nil) || (checkString!.isEqual(to: "")) || (checkString!.length == 0) || (checkString!.isEqual(to: "(null)")) || checkString!.isEqual(NSNull()){
                isEmpty = true
            }
        }
        return isEmpty
    }
    
    /********************************************************************************************************************************
     This function helps to get the document path of application
     ********************************************************************************************************************************/
    
    class func getDocumentPathForUser() -> String {
        var documentsDir:String!
        let paths:NSArray = NSSearchPathForDirectoriesInDomains(.cachesDirectory,.userDomainMask,true) as NSArray
        if Utilities.checkIsArrayIsEmpty(paths) == false {
            documentsDir = paths.object(at: 0) as! String
        }
        return documentsDir
    }    

    class func addKeyBoardNotificationController(_ givenViewController:UIViewController) {
        NotificationCenter.default.addObserver(givenViewController, selector: Selector(("keyboardWillShow:")), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(givenViewController, selector: Selector(("keyboardWillHide:")), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    class func getAppDelegate()-> AppDelegate{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate
    }
    
    class func addNavColor(navController: UINavigationController){
        navController.navigationBar.backgroundColor = UIColor(red: 91/255, green: 197/255, blue: 167/255, alpha: 1)
        navController.navigationBar.barTintColor = UIColor(red: 0/255, green: 161/255, blue: 155/255, alpha: 1)
        navController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    class func integerValueToStr(_ givenInteger : NSInteger)->String {
        let givenIntegerNumber = givenInteger as NSNumber
        let givenIntegerString : String = givenIntegerNumber.stringValue
        return givenIntegerString
    }
    
    class func getStringBeforeSpaces(_ givenString: String)-> String {
        var combinedString:String = ""
        let stringArray = givenString.components(separatedBy: " ")
        for str in stringArray {
            let firstChar = String(str[str.characters.index(str.startIndex, offsetBy: 0)])
            combinedString = combinedString + firstChar
        }
        return combinedString.uppercased()
    }
    
    class func windowFrame()-> CGSize {
        return UIScreen.main.bounds.size
    }
    
    class func removeWhiteSpacesOnBothEndsOf_String(_ givenString:String) -> String {
        let trimmedStr: String = givenString.trimmingCharacters(in: CharacterSet.whitespaces)
        return Utilities.returnCorrespondingString(trimmedStr)
    }

    class func addDoneButtonOnKeyboard(_ view: UIView?){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: Utilities.getAppDelegate().window!.frame.size.width, height: 50))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: view, action: #selector(UIResponder.resignFirstResponder))
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        if let accessorizedView = view as? UITextView {
            accessorizedView.inputAccessoryView = doneToolbar
        } else if let accessorizedView = view as? UITextField {
            accessorizedView.inputAccessoryView = doneToolbar
        }
    }

    /********************************************************************************************************************************
     This function checks whether the specified string is empty or not and returns corresponding string. If the string is nil or empty it returns blank string. But never return nil.
     ********************************************************************************************************************************/
    
    class func returnCorrespondingString(_ checkStr:String?)-> String{
        var checkString:String!
        if checkStr != nil {
            checkString = checkStr!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if (checkString == "" || checkString == "(null)" || checkString.isKind(of: NSNull.self)) {
                checkString = ""
            }else{
                checkString = checkStr
            }
        }
        else {
            checkString = ""
        }
        
        return checkString
    }

    class func checkWhetherDictionaryHavingValue(_ dicValue: AnyObject?)-> Bool{
        var hasValue:Bool = false
        if dicValue != nil && dicValue as? NSNull != NSNull(){
            hasValue = true
        }
        return hasValue
    }

    class func getDataFromLocalJsonFile(_ jsonFileName : String) -> Data {
        var data = Data()
        if let path = Bundle.main.path(forResource: jsonFileName, ofType: "json"){
            data = try! Data (contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe)
        }
        return data
    }

    class func checkIsArrayIsEmpty( _ givenArray:NSArray!)->Bool{
        var isEmpty: Bool = true
        if givenArray != nil{
            if givenArray.count > 0{
                isEmpty = false
            }
        }
        
        return isEmpty
    }
    
    class func checkIsMutableArrayIsEmpty( _ givenArray:NSMutableArray!)->Bool{
        var isEmpty: Bool = true
        if givenArray != nil{
            if givenArray.count > 0{
                isEmpty = false
            }
        }
        
        return isEmpty
    }

    /********************************************************************************************************************************
     This function checks whether the specified string is empty or not.
     ********************************************************************************************************************************/
    
    class func isEmptyString(_ checkStr:String?)-> Bool{
        var retval:Bool = false
        if checkStr != nil {
            let checkString:String = checkStr!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if (checkString == "" || checkString == "(null)" || checkString.isKind(of: NSNull.self) || (checkString.characters.count) == 0) {
                retval = true
            }
        }
        else {
            retval = true
        }
        
        return retval
    }

    class func addShadowLayer(_ givenView:UIView, shadowColor:UIColor, shadowOpacity: Float, shadowRadius: CGFloat, shadowOffset: CGSize) {
        givenView.layer.shadowColor = shadowColor.cgColor
        givenView.layer.shadowOpacity = shadowOpacity
        givenView.layer.shadowOffset = shadowOffset
        givenView.layer.shadowRadius = shadowRadius
    }
    
    class func orderBorderConstraints(_ view:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = true
        view.setNeedsUpdateConstraints()
        view.updateConstraintsIfNeeded()
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }

    class func addBorder_oldMethod(_ view:UIView, borderWidth:CGFloat, color:UIColor, left:Bool, right:Bool, top:Bool, bottom:Bool) {
        
        for subview in view.subviews{
            if subview.tag == -17001 || subview.tag == -17002 || subview.tag == -17003 || subview.tag == -17004 {
                subview.removeFromSuperview()
            }
        }
        
        if left
        {
            let border = UIView(frame:CGRect(x: 0, y: 0, width: borderWidth, height: view.frame.size.height))
            border.tag = -17001
            border.backgroundColor = color
            border.autoresizingMask = [UIViewAutoresizing.flexibleRightMargin , UIViewAutoresizing.flexibleHeight]
            view.addSubview(border)
            self.orderBorderConstraints(border)
        }
        if right
        {
            let border = UIView(frame:CGRect(x: view.frame.size.width - borderWidth, y: 0, width: borderWidth, height: view.frame.size.height))
            border.tag = -17002
            border.backgroundColor = color
            border.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin , UIViewAutoresizing.flexibleHeight]
            view.addSubview(border)
            self.orderBorderConstraints(border)
        }
        if top
        {
            let border = UIView(frame:CGRect(x: 0, y: 0, width: view.frame.size.width, height: borderWidth))
            border.tag = -17003
            border.backgroundColor = color
            border.autoresizingMask = [UIViewAutoresizing.flexibleBottomMargin , UIViewAutoresizing.flexibleWidth]
            view.addSubview(border)
            self.orderBorderConstraints(border)
        }
        if bottom
        {
            let border = UIView(frame:CGRect(x: 0, y: view.frame.size.height - borderWidth, width: view.frame.size.width, height: borderWidth))
            border.tag = -17004
            border.backgroundColor = color
            border.autoresizingMask = [UIViewAutoresizing.flexibleTopMargin , UIViewAutoresizing.flexibleWidth]
            view.addSubview(border)
            self.orderBorderConstraints(border)
        }
        view.layoutIfNeeded()
    }
    
    class func addBorderLine(_ view:UIView, left:Bool, bottom:Bool, right:Bool, top:Bool, lineHeight:CGFloat, lineColor:UIColor, leftPadding: CGFloat, rightPadding: CGFloat, bottomPadding: CGFloat, topPadding: CGFloat) {
        
        if left == true && bottom == true && right == true && top == true && leftPadding == 0 && rightPadding == 0 && bottomPadding == 0 && topPadding == 0 {
            view.layer.borderWidth = lineHeight
            view.layer.borderColor = lineColor.cgColor
        }else{
            if bottom == true {
                let border = CALayer()
                border.backgroundColor = lineColor.cgColor
                border.frame = CGRect(x: leftPadding, y: (view.frame.size.height - lineHeight) - bottomPadding, width: view.frame.size.width - (leftPadding + rightPadding), height: lineHeight)
                view.layer.addSublayer(border)
            }
            
            if top == true {
                let border = CALayer()
                border.backgroundColor = lineColor.cgColor
                border.frame = CGRect(x: leftPadding, y: topPadding, width: view.frame.size.width - (leftPadding + rightPadding), height: lineHeight)
                view.layer.addSublayer(border)
            }

            if left == true {
                let border = CALayer()
                border.backgroundColor = lineColor.cgColor
                border.frame = CGRect(x: leftPadding, y: topPadding, width: lineHeight, height: view.frame.size.height - (topPadding + bottomPadding))
                view.layer.addSublayer(border)
            }

            if right == true {
                let border = CALayer()
                border.backgroundColor = lineColor.cgColor
                border.frame = CGRect(x: (view.frame.size.width - lineHeight) - rightPadding, y: topPadding, width: lineHeight, height: view.frame.size.height - (topPadding + bottomPadding))
                view.layer.addSublayer(border)
            }
        }
    }
    
    class func roundCorners(_ view:UIView, cornerRadius:CGFloat, topLeft:Bool, topRight:Bool, bottomLeft:Bool, bottomRight:Bool) {
        
        var cornerRect:UIRectCorner = UIRectCorner.allCorners
        
        if topLeft && topRight && bottomLeft && bottomRight {
            cornerRect = UIRectCorner.allCorners
        }
        else if topLeft && topRight && bottomLeft && !bottomRight {
            cornerRect = [.topLeft , .topRight , .bottomLeft]
        }
        else if topLeft && topRight && !bottomLeft && bottomRight {
            cornerRect = [.topLeft , .topRight , .bottomRight]
        }
        else if topLeft && !topRight && bottomLeft && bottomRight {
            cornerRect = [.topLeft , .bottomLeft , .bottomRight]
        }
        else if !topLeft && topRight && bottomLeft && bottomRight {
            cornerRect = [.topRight , .bottomLeft , .bottomRight]
        }
        else if topLeft && topRight && !bottomLeft && !bottomRight {
            cornerRect = [.topLeft , .topRight]
        }
        else if topLeft && !topRight && bottomLeft && !bottomRight {
            cornerRect = [.topLeft , .bottomLeft]
        }
        else if !topLeft && topRight && bottomLeft && !bottomRight {
            cornerRect = [.topRight , .bottomLeft]
        }
        else if topLeft && !topRight && !bottomLeft && bottomRight {
            cornerRect = [.topLeft , .bottomRight]
        }
        else if !topLeft && topRight && !bottomLeft && bottomRight {
            cornerRect = [.topRight , .bottomRight]
        }
        else if !topLeft && !topRight && bottomLeft && bottomRight {
            cornerRect = [.bottomLeft , .bottomRight]
        }
        else if topLeft && !topRight && !bottomLeft && !bottomRight {
            cornerRect = .topLeft
        }
        else if !topLeft && topRight && !bottomLeft && !bottomRight {
            cornerRect = .topRight
        }
        else if !topLeft && !topRight && bottomLeft && !bottomRight {
            cornerRect = .bottomLeft
        }
        else if !topLeft && !topRight && !bottomLeft && bottomRight {
            cornerRect = .bottomRight
        }
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: cornerRect, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        view.layer.mask = maskLayer;
    }
}

extension Array {
    var sample: Element? {
        if self.isEmpty { return nil }
        let randomInt = Int(arc4random_uniform(UInt32(self.count)))
        return self[randomInt]
    }
}

extension UIImage {
    
    func crop(_ to:CGSize) -> UIImage {
        guard let cgimage = self.cgImage else { return self }
        
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        
        let contextSize: CGSize = contextImage.size
        
        //Set to square
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        let cropAspect: CGFloat = to.width / to.height
        
        var cropWidth: CGFloat = to.width
        var cropHeight: CGFloat = to.height
        
        if to.width > to.height { //Landscape
            cropWidth = contextSize.width
            cropHeight = contextSize.width / cropAspect
            posY = (contextSize.height - cropHeight) / 2
        } else if to.width < to.height { //Portrait
            cropHeight = contextSize.height
            cropWidth = contextSize.height * cropAspect
            posX = (contextSize.width - cropWidth) / 2
        } else { //Square
            if contextSize.width >= contextSize.height { //Square on landscape (or square)
                cropHeight = contextSize.height
                cropWidth = contextSize.height * cropAspect
                posX = (contextSize.width - cropWidth) / 2
            }else{ //Square on portrait
                cropWidth = contextSize.width
                cropHeight = contextSize.width / cropAspect
                posY = (contextSize.height - cropHeight) / 2
            }
        }
        
        _ = CGRect(x: posX, y: posY, width: cropWidth, height: cropHeight)
        
        // Create bitmap image from context using the rect
       // let imageRef: CGImageRef = CGImageCreateWithImageInRect(contextImage.CGImage, rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
       // let cropped: UIImage = UIImage(CGImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        
        UIGraphicsBeginImageContextWithOptions(to, true, self.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: to.width, height: to.height))
        let resized = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resized!
    }
}

extension NSNumber {
    
    // CGFloat -> NSNumber
    fileprivate convenience init(doubleOrFloat d : Double) {
        self.init(value: d as Double)
    }
    fileprivate convenience init(doubleOrFloat f : Float) {
        self.init(value: f as Float)
    }
    convenience init(cgFloat : CGFloat) {
        self.init(doubleOrFloat: cgFloat.native)
    }
    
    // NSNumber -> CGFloat
    fileprivate func doubleOrFloatValue() -> Double {
        return self.doubleValue
    }
    fileprivate func doubleOrFloatValue() -> Float {
        return self.floatValue
    }
    var cgFloatValue : CGFloat {
        return CGFloat(floatLiteral: doubleOrFloatValue())
    }
}
