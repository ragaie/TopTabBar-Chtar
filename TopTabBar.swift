//
//  TopTabBar.swift
//  topTabBar
//
//  Created by Ragaie alfy on 8/27/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

@IBDesignable class TopTabBar: UIView {

 
   private var containerView: UIView!
    
   private var lineBar : UILabel!
   private var lineIndecator : UILabel!
    private var ContainerView : UIView!
   private var tabButtons : [UIButton]! = []
    
    private var selectIndex : Int! = 0
    
    public var dataSourceItem : [UIViewController]! = []
    public var buttonTitle : [String]! = []
    public var buttonImges : [UIImage]! = []
    public var buttonImgesHighLight : [UIImage]! = []
    

    
    //MARK: Initializers
   
  
 //MARK: tabbar parameter
    @IBInspectable var buttonNumber : Int = 2 {
        didSet{
            
            if buttonNumber > 0 {
                changelayOut()
            }
        }
    }
    
    @IBInspectable var barBackgroundColor : UIColor = UIColor.blue {
        didSet{
            
            changelayOut()
        }
    }
    @IBInspectable var textColor : UIColor = UIColor.white {
        didSet{
            
            changelayOut()
        }
    }
//    @IBInspectable public var textSize : CGFloat = 15.0 {
//        didSet {
//            
//            changelayOut()
//            
//        }
//    }
//    
  
    
    @IBInspectable var titleTint: UIColor = UIColor.green {
        didSet{
            
            changelayOut()
        }
    }
    @IBInspectable var barHight : CGFloat = 0 {
        didSet{
            
            changelayOut()
        }
    }
    
    
    
    
    //MARK: line parameter 
    
    @IBInspectable var lineColor : UIColor = UIColor.lightGray {
        didSet{
            
            changelayOut()
        }
    }
    
    
    
    @IBInspectable var lineHight : CGFloat = 0.0{
        didSet{
            
            changelayOut()
        }
    }
    
    
    
    
    // MARK: parameter of indecator
    
    
    
    @IBInspectable var indecatorColor : UIColor = UIColor.black {
        didSet{
            
            changelayOut()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override public init(frame : CGRect) {
        super.init(frame : frame)
        initSubviews()
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        initActionAndDelegete()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setButtons()
        
    }
    
    public func initSubviews() {
        let bundle = Bundle(for: type(of: self))

        let nib = UINib(nibName: "TopTabBar", bundle: bundle)
        
        var view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // to make view fit view in design you welcome.
        view.frame = self.bounds
        // Make the view stretch with containing view
        // to fit like you want in storyboard
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // nib.contentView.frame = bounds
        
        addSubview(view)
        
    }
    
    



    
    // add action of dropDown
    func initActionAndDelegete()  {
        
        for item in tabButtons{
        
            item.addTarget(self, action: "showSelection:", for: .touchUpInside)
        }
    }
    
    
    
    
    
    
    
    
   // this action in button
    func showSelection(_ sender : UIButton)  {
        
        var buttonWidth = self.frame.width / CGFloat.init(buttonNumber)
// just for testing
        if sender.tag % 2 == 0{
            ContainerView.backgroundColor = UIColor.gray

        }
        else{
            ContainerView.backgroundColor = UIColor.green

        
        }
   //// set visiable view 
        
        
        if sender.tag < dataSourceItem.count {
            
            
            for item in ContainerView.subviews{
            
                item.removeFromSuperview()
            }
            
            var tempView = dataSourceItem[sender.tag].view
            
            tempView?.frame = ContainerView.frame// CGRect.init(x: ContainerView.frame.minX, y: ContainerView.frame.minY, width: ContainerView.frame.width, height: ContainerView.frame.height)//
            ContainerView.addSubview(tempView!)
        
        }
        
        
        
        
        
        
        /// hightLight button that selected
        
        /// change title color 
        
        if tabButtons.count > 0 {
            if buttonTitle.count > 0 {
                for item in tabButtons {
            
                    item.setTitleColor(textColor, for: .normal)
                }
                
                tabButtons[sender.tag].setTitleColor(titleTint, for: .normal)

                
            }
            else if buttonImges.count > 0 {
                for item in tabButtons {
                    if item.tag < buttonImges.count{
                        tabButtons[item.tag].setImage(buttonImges[item.tag], for: .normal)
                    }
                }
                if sender.tag < buttonImgesHighLight.count {
                    tabButtons[sender.tag].setImage(buttonImgesHighLight[sender.tag], for: .normal)
                }
            }
        }
        
        
        
        
        
        
        if sender.tag > selectIndex {

            // normal work in indecator
            //            UIView.animate(withDuration: 0.3, animations: {
            //
            //                var frame = self.lineIndecator.frame
            //                var senderFrame = sender.frame
            //
            //                self.lineIndecator.frame = CGRect.init(x: senderFrame.minX, y: frame.minY, width: buttonWidth  , height: frame.height)
            //                
            //            })
            //
            
            
            
            
            
            
            
            
//            var frame = self.lineIndecator.frame
//            var senderFrame = sender.frame
//            
//            var selectedFrame = tabButtons[self.selectIndex].frame
//            
//            
//            var width =  senderFrame.maxX - selectedFrame.minX
//            
//            
//            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
//             
//             
//                self.lineIndecator.frame = CGRect.init(x:  selectedFrame.minX, y: self.lineIndecator.frame.minY, width: width, height: frame.height)
//                
//            
//                
//            },completion: { finish in
//                
//                UIView.animate(withDuration: 1, delay: 0.25,options: UIViewAnimationOptions.curveEaseOut,animations: {
//                
//                    var frame = self.lineIndecator.frame
//                    var senderFrame = sender.frame
//                    
//                    self.lineIndecator.frame = CGRect.init(x: senderFrame.minX, y: frame.minY, width: buttonWidth , height: frame.height)
//                    
//                    
//                    
//                },completion: nil)})
//            
//        
//            
            
            
          
            
      
            
            UIView.animate(withDuration: 0.5, animations: {
                var frame = self.lineIndecator.frame
                var senderFrame = sender.frame
                
                self.lineIndecator.frame = CGRect.init(x: senderFrame.minX, y: frame.minY, width: buttonWidth  , height: frame.height)
                
                
        
                
                
            }, completion: { (true) in
                
                
                self.lineIndecator.shake()
                
                
            })
            
        
            
            selectIndex = sender.tag
        }
            
            
        else if  sender.tag < selectIndex{
  
            UIView.animate(withDuration: 0.5, animations: {
                var frame = self.lineIndecator.frame
                var senderFrame = sender.frame
                
                self.lineIndecator.frame = CGRect.init(x: senderFrame.minX, y: frame.minY, width: frame.width  , height: frame.height)
                
            }, completion: { (true) in
                
                
                self.lineIndecator.shake()
                
                
            })
        
            
            selectIndex = sender.tag
        
        }
        
    }
    
    
    
    
    
    
    
    
    
    func setButtons(){
        
        var buttonWidth = self.frame.width / CGFloat.init(buttonNumber)

        // remove all button object from temprory array and from view
        if tabButtons.count > 0 {
        
            
            for i in  0...(tabButtons.count - 1){
                tabButtons[i].removeFromSuperview()
            }
            tabButtons.removeAll()
            
        
        }
        
    // check number button > 0
        
        //and add button object depend the button number
        if buttonNumber > 0 {
            for i in  0...(buttonNumber - 1){

                var tempButton = UIButton.init(frame: CGRect.init(x: CGFloat.init(i) * buttonWidth , y: 0, width: buttonWidth , height: barHight))
            
            
              /// set titles of button in view
                if buttonTitle.count > 0 {
                    
                    if i < buttonTitle.count {
                        
                        tempButton.setTitle( buttonTitle[i], for: .normal)
                    }
                    else{
                        tempButton.setTitle( "NULL", for: .normal)
                        
                    }
                    
                    
                }
               else  if buttonImges.count > 0  {
                
                        if i < buttonImges.count {
                            tempButton.setImage(buttonImges[i], for: .normal)
                        }
                    }
                
                else {
                    tempButton.setTitle( "NULL", for: .normal)

                
                }
                
                tempButton.setTitleColor(textColor, for: .normal)
                tempButton.backgroundColor = barBackgroundColor
                tempButton.tag = i
                tabButtons.append(tempButton)
                addSubview(tempButton)
            
            }
            
     
            
            
            
            
            // set action in all button
            initActionAndDelegete()


         // remove line bar
            if lineBar != nil {
            
                lineBar.removeFromSuperview()
            }
            if lineIndecator != nil {
                
                lineIndecator.removeFromSuperview()
            }
        lineBar = UILabel.init(frame: CGRect.init(x: 0, y: barHight + 1 , width: self.frame.width, height: lineHight))
        lineBar.backgroundColor = lineColor
        
        addSubview(lineBar)
        
            
            
        //indecator show whhich button select
           lineIndecator = UILabel.init(frame: CGRect.init(x: 0, y: barHight , width: buttonWidth, height: lineHight + 2))
        lineIndecator.backgroundColor = indecatorColor
        addSubview(lineIndecator)
            
            
            var y = barHight + lineIndecator.frame.height
            //var  = lineIndecator
            var height = self.frame.height - (lineIndecator.frame.height + barHight)
            
            ContainerView = UIView.init(frame: CGRect.init(x: 0, y: y, width: self.frame.width, height: height))
            
            ContainerView.backgroundColor = UIColor.clear
            addSubview(ContainerView)
            
        
        
        }
        
        
        
        
        // hightlight first button
        tabButtons[0].setTitleColor(titleTint, for: .normal)
        
        if buttonImgesHighLight.count > 0 && buttonImges.count > 0 {
            tabButtons[0].setImage(buttonImgesHighLight[0], for: .normal)
            
        }
        
        if dataSourceItem.count > 0  &&  ContainerView != nil {
            
            var tempView = dataSourceItem[0].view
            
            tempView?.frame = ContainerView.frame
            ContainerView.addSubview(tempView!)
            
        }
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    //MARK : used to reload view after change 
    func changelayOut(){
        
        
        var buttonWidth = self.frame.width / CGFloat.init(buttonNumber)
 
        if tabButtons.count > 0 {
        
                for i in  0...(tabButtons.count - 1){
                    tabButtons[i].removeFromSuperview()
                }
            tabButtons.removeAll()
        }
        
        
        // check if number of button > 0
        if buttonNumber > 0 {
            for i in  0...(buttonNumber - 1){
                
                var tempButton = UIButton.init(frame: CGRect.init(x: CGFloat.init(i) * buttonWidth , y: 0, width: buttonWidth , height: barHight))
                
                
                tempButton.setTitleColor(textColor, for: .normal)
                tempButton.backgroundColor = barBackgroundColor
                tempButton.tag = i
                tabButtons.append(tempButton)
                addSubview(tempButton)
                
            }
          
            tabButtons[0].setTitleColor(titleTint, for: .normal)

        }
        
        
        if lineBar != nil && lineIndecator != nil
            {
        
                lineBar.frame =  CGRect.init(x: 0, y: barHight + 1 , width: self.frame.width, height: lineHight)
            
                lineIndecator.frame =  CGRect.init(x: 0, y: barHight , width: buttonWidth, height: lineHight + 2)
        
            }
        
        // update container view 
        if ContainerView != nil {
            var y = barHight + lineIndecator.frame.height
            var height = self.frame.height - (lineIndecator.frame.height + barHight)
            
            ContainerView.frame =  CGRect.init(x: 0, y: y, width: self.frame.width, height: height)
            
        
        }
        //update layout in storyBoard
        self.setNeedsDisplay()
        
        ///add target to button when change number

        }
        
    
    
    
    
    
}





extension UIView {
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.9
        animation.values = [-15.0, 15.0, -15.0, 15.0, -7.0, 7.0, -2.50, 2.50, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
}
