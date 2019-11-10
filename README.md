# TopTabBar-Chtar
Build with native Swift targeting iphone and ipad, main functionality to make developer develop like native ios tab bar.
But. can put it any where of design, im talking about just bar not all tabBar controller.

# result from one live project using it:-
not this result only you can get from library, but you have full access to modify every parameter in component.

 ![alt tag](https://github.com/ragaie/TopTabBar-Chtar/blob/master/IMG_3325.jpg)
 
 ###Getting Started

 ##  Installing
 Add blow for your pod file 
   ```
   pod 'TopTabBar-Chtar' 
   run pod update
   ```

```
import TopTabBar-Chtar
```

1- add custom view in your storyBoard -->. TopTabBar

![](https://github.com/ragaie/TopTabBar-Chtar/blob/master/Screen%20Shot%202017-08-30%20at%2011.43.25%20AM.png)

2- leave project build and update view 

3- then you will get screen like this

![](https://github.com/ragaie/TopTabBar-Chtar/blob/master/Screen%20Shot3.png)

# below what is every parameter in which change

1- @IBInspectable var buttonNumber : Int 
   Represent number of button that bar will provide, you will also need to provide array of string that provide button title with same numbe. 
    
2- @IBInspectable var barBackgroundColor : UIColor
   Represent bar background color.
   
3- @IBInspectable var itemBackgroundColor : UIColor
    Represent button background color when it selected.

4- @IBInspectable var textColor : UIColor 
    Represent text default color for buttons.
 
5-  @IBInspectable var titleTint: UIColor
    Represent button title text color when it is selected.
    
6-  @IBInspectable var spaceing : CGFloat 
    Reperesnt spacing between button inside stackview.
    
7-  @IBInspectable var contentInsets : CGFloat 
    Represent spacing before and after button title text.
    
8-  @IBInspectable var lineColor : UIColor 
    Represent line bar background color.
    
9-  @IBInspectable var lineHight : CGFloat 
    Reperesnt line hight.
    
10- @IBInspectable var indecatorColor : UIColor
    Represent background color of line that indicate selected item in bar.
    
11- you can also access stackView that contain items from code and modify aligned of item, as your business need.

12- Can you also make bar working with images only by provide, to array for default image and selected image.
for code 
Hint :- still beta under development, but you can try it.

# to get slected index
you have conform delegate -->
```TopTabBarDelegate
```
and set tabBar outlet with it

this delegate contain :
```
  func topTabBarSelected(index: Int) {
        
        print("Index \(index) had been selected")
    }
  ```  
 
 # to select item from code :
 ```
   <TopTabBarOutlet>.selectitemAt(index: 2)
   ```
# some result that you can achive from it:

![](https://github.com/ragaie/TopTabBar-Chtar/blob/master/ScreenShot2.png)

 
 


