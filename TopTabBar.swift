//
//  TopTabBar.swift
//  topTabBar
//
//  Created by Ragaie alfy on 8/27/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

@IBDesignable open class TopTabBar: UIView {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet open weak var stackViewContainer: UIStackView!
    @IBOutlet weak var linebar: UILabel!
    private var lineIndecator : UILabel!
    private var tabButtons : [UIButton]! = []
    open var selectIndex : Int! = 0
    open var buttonTitle : [String]! = []
    open var buttonImges : [UIImage]! = []
    open var buttonImgesHighLight : [UIImage]! = []
    var delegate : TopTabBarDelegate?
    open var font : UIFont = UIFont.systemFont(ofSize: 12)
    open var selectedFont : UIFont = UIFont.boldSystemFont(ofSize: 14)
    //MARK: Initializers
    //MARK: tabbar parameter
    @IBInspectable var buttonNumber : Int = 0 {
        didSet{
            if buttonNumber > 0 {
                changelayOut()
            }
            stackViewContainer.distribution = .fill
        }
    }
    
    @IBInspectable var barBackgroundColor : UIColor = UIColor.blue {
        didSet{
            changelayOut()
        }
    }
    
    @IBInspectable var itemBackgroundColor : UIColor = UIColor.clear {
        didSet{
            changelayOut()
        }
    }
    
    @IBInspectable var textColor : UIColor = UIColor.white {
        didSet{
            changelayOut()
        }
    }
    
    @IBInspectable var titleTint: UIColor = UIColor.green {
        didSet{
            changelayOut()
        }
    }
    
    @IBInspectable var spaceing : CGFloat = 0 {
        didSet{
            // changelayOut()
            stackViewContainer.spacing = spaceing
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var contentInsets : CGFloat = 10 {
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
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        addLineBar()
        setButtons()
        //wait until button renders in screen to get same width of it and display it.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if self.tabButtons.count > 0{
                self.setupButtonIndicator(sender: self.tabButtons[0])
            }
        }
    }
    
    public func initSubviews() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TopTabBar", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        // to make view fit view in design you welcome.
        view.frame = self.bounds
        // Make the view stretch with containing view
        // to fit like you want in storyboard
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        // nib.contentView.frame = bounds
        addSubview(view)
    }
    
    // add action of to buttons
    func initActionAndDelegete()  {
        for item in tabButtons{
            item.addTarget(self, action: #selector(TopTabBar.showSelection(_:)), for: .touchUpInside)
        }
    }
    
    //func to select spescif index
    func selectitemAt(index : Int){
        if index >= 0 && index < tabButtons.count{
            setupButtonIndicator(sender: tabButtons[index])
            scrollView.scrollRectToVisible(tabButtons![index].frame, animated: true)
            selectIndex = index
            if delegate != nil {
                delegate?.topTabBarSelected(index: index)
            }
        }
        else{
            assertionFailure("select item should be in range")
        }
    }
    
    // this action in button
    @objc func showSelection(_ sender : UIButton)  {
        /// hightLight button that selected
        /// change title color
        //change background color
        //change font
        if tabButtons.count > 0 {
            if buttonTitle.count > 0 {
                for item in tabButtons {
                    item.setTitleColor(textColor, for: .normal)
                    item.backgroundColor = .clear
                    item.titleLabel?.font = font
                }
                tabButtons[sender.tag].setTitleColor(titleTint, for: .normal)
                tabButtons[sender.tag].backgroundColor = itemBackgroundColor
                tabButtons[sender.tag].titleLabel?.font = selectedFont
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001, execute: {
            self.setupButtonIndicator(sender: sender)
        })
        selectIndex = sender.tag
        if delegate != nil {
            delegate?.topTabBarSelected(index: sender.tag)
        }
    }
    
    func setButtons(){
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
                let tempButton = UIButton.init(frame: CGRect.init(x: 0 , y: 0, width: 10 , height: 0))
                tempButton.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: contentInsets, bottom: 0, right: contentInsets)
                tempButton.titleLabel?.font = font
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
                tempButton.backgroundColor = .clear
                tempButton.tag = i
                tabButtons.append(tempButton)
                stackViewContainer.addArrangedSubview(tempButton)
                //need to add indicator
            }
            // set action in all button
            initActionAndDelegete()
            // hightlight first button
            tabButtons[0].setTitleColor(titleTint, for: .normal)
            tabButtons[0].backgroundColor = itemBackgroundColor
            tabButtons[0].titleLabel?.font = selectedFont
            if buttonImgesHighLight.count > 0 && buttonImges.count > 0 {
                tabButtons[0].setImage(buttonImgesHighLight[0], for: .normal)
                
            }
            
        }
    }
    
    func addLineBar(){
        linebar.backgroundColor = lineColor
        
    }
    
    func setupButtonIndicator(sender : UIButton ){
        //remove line indicator
        if tabButtons.count > 0 {
            for item in tabButtons {
                for  subItem in  item.subviews{
                    if subItem.restorationIdentifier == "lineIndicate"{
                        subItem.removeFromSuperview()
                    }
                }
                //update button color
                item.backgroundColor = .clear
                item.setTitleColor(textColor, for: .normal)
            }
        }
        
        //add line indicator
        let lineIndicate = UILabel.init(frame: CGRect.init(x: (0 - spaceing / 2), y: sender.frame.height - lineHight , width: sender.frame.width + spaceing  , height: lineHight))
        lineIndicate.backgroundColor = indecatorColor
        lineIndicate.layer.cornerRadius = lineHight / 2
        lineIndicate.clipsToBounds = true
        lineIndicate.restorationIdentifier = "lineIndicate"
        //update also color of button for title and color
        sender.backgroundColor = itemBackgroundColor
        sender.setTitleColor(titleTint, for: .normal)
        sender.addSubview(lineIndicate)
        sender.setNeedsDisplay()
    }
    
    //MARK : used to reload view after change
    func changelayOut(){
        if tabButtons.count > 0 {
            for i in  0...(tabButtons.count - 1){
                tabButtons[i].removeFromSuperview()
            }
            tabButtons.removeAll()
        }
        if buttonNumber > 0 {
            for i in  0...(buttonNumber - 1){
                let tempButton = UIButton.init(frame: CGRect.init(x: 0 , y: 0, width: 0 , height: 0))
                tempButton.titleLabel?.font = font
                tempButton.setTitleColor(textColor, for: .normal)
                tempButton.backgroundColor = .clear
                tempButton.tag = i
                tabButtons.append(tempButton)
                stackViewContainer.addArrangedSubview(tempButton)
            }
            tabButtons[0].setTitleColor(titleTint, for: .normal)
            tabButtons[0].backgroundColor = itemBackgroundColor
        }
        linebar.backgroundColor = lineColor
        if tabButtons.count > 0 {
            setupButtonIndicator(sender: tabButtons[0])
        }
        self.backgroundColor = barBackgroundColor
        //update layout in storyBoard
        self.setNeedsDisplay()
    }
}

