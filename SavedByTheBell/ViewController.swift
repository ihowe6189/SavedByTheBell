 //
//  ViewController.swift
//  SavedByTheBell
//
//  Created by Ian Howe on 9/7/15.
//  Copyright (c) 2015 Ian Howe. All rights reserved.
//

/*
 TODO:
 -Animations
 -Get vertical Indicator working

 -Options Menu
    -Themes
    -Types of Images
        -Different shapes for indicators
        -Filled in vs. Outlined
 
*/
import UIKit

 //http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios 
 extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    /*
    Example:
    var color = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF)
    var color2 = UIColor(netHex:0xFFFFFF)
    */
 }
 
class ViewController: UIViewController {
    
    //Highlights behind the Schedule Buttons
    @IBOutlet weak var scheduleSelection1: UIImageView!
    @IBOutlet weak var scheduleSelection2: UIImageView!
    @IBOutlet weak var scheduleSelection3: UIImageView!
    @IBOutlet weak var scheduleSelection4: UIImageView!
    @IBOutlet weak var scheduleSelection5: UIImageView!
    @IBOutlet weak var scheduleSelection6: UIImageView!
    @IBOutlet weak var scheduleSelection7: UIImageView!
    
    //Highlights behind the Period Listings
    @IBOutlet weak var periodSelection1: UIImageView!
    @IBOutlet weak var periodSelection2: UIImageView!
    @IBOutlet weak var periodSelection3: UIImageView!
    @IBOutlet weak var periodSelection4: UIImageView!
    @IBOutlet weak var periodSelection5: UIImageView!
    @IBOutlet weak var periodSelection6: UIImageView!
    @IBOutlet weak var periodSelection7: UIImageView!
    @IBOutlet weak var periodSelection8: UIImageView!
    
    //Labels used to show the start/end times for each period
    @IBOutlet weak var periodStartEndLabel1: UILabel!
    @IBOutlet weak var periodStartEndLabel2: UILabel!
    @IBOutlet weak var periodStartEndLabel3: UILabel!
    @IBOutlet weak var periodStartEndLabel4: UILabel!
    @IBOutlet weak var periodStartEndLabel5: UILabel!
    @IBOutlet weak var periodStartEndLabel6: UILabel!
    @IBOutlet weak var periodStartEndLabel7: UILabel!
    @IBOutlet weak var periodStartEndLabel8: UILabel!
    
    //Labels that state the corespoding period # for each row
    @IBOutlet weak var periodnumberLabel1: UILabel!
    @IBOutlet weak var periodnumberLabel2: UILabel!
    @IBOutlet weak var periodnumberLabel3: UILabel!
    @IBOutlet weak var periodnumberLabel4: UILabel!
    @IBOutlet weak var periodnumberLabel5: UILabel!
    @IBOutlet weak var periodnumberLabel6: UILabel!
    @IBOutlet weak var periodnumberLabel7: UILabel!
    @IBOutlet weak var periodnumberLabel8: UILabel!
    
    //Other UI Elements
    @IBOutlet weak var schedulesLabel: UILabel!
    @IBOutlet weak var ihGearImage: UIImageView!
    @IBOutlet weak var classInLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var verticalIndicator: UIImageView!
    
        
    //Schedule Buttons
    @IBAction func scheduleButton1(sender: UIButton) {
        hideAllScheduleSelectors()
        printArrayToSchedule(schedule1Strings)
        scheduleSelection1.alpha = 1
        updateTimeBasedElements()
    }
    @IBAction func scheduleButton2(sender: UIButton) {
        hideAllScheduleSelectors()
        printArrayToSchedule(schedule2Strings)
        scheduleSelection2.alpha = 1
        updateTimeBasedElements()
    }
    @IBAction func scheduleButton3(sender: UIButton) {
        hideAllScheduleSelectors()
        printArrayToSchedule(schedule3Strings)
        scheduleSelection3.alpha = 1
        updateTimeBasedElements()
    }
    @IBAction func scheduleButton4(sender: UIButton) {
        hideAllScheduleSelectors()
        printArrayToSchedule(schedule4Strings)
        scheduleSelection4.alpha = 1
        updateTimeBasedElements()
    }
    @IBAction func scheduleButton5(sender: UIButton) {
        hideAllScheduleSelectors()
        printArrayToSchedule(schedule5Strings)
        scheduleSelection5.alpha = 1
        updateTimeBasedElements()
    }
    @IBAction func scheduleButton6(sender: UIButton) {
        hideAllScheduleSelectors()
        printArrayToSchedule(schedule6Strings)
        scheduleSelection6.alpha = 1
        updateTimeBasedElements()
    }
    @IBAction func scheduleButton7(sender: UIButton) {
        hideAllScheduleSelectors()
        printArrayToSchedule(schedule7Strings)
        scheduleSelection7.alpha = 1
        updateTimeBasedElements()
    }
    
    //Variables
    var timer = NSTimer()
    var hours = ""
    var minutes = ""
    var numberOfMinutes = 0
    
    //Settings
    var minutesAndSeconds = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hideAllScheduleSelectors()
        hideAllPeriodSelectors()
        printArrayToSchedule(schedule1Strings)
        scheduleSelection1.alpha = 1
        updateTimeBasedElements()
        initializeTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //Makes all Highlights for the Schedule Buttons Transparent
    func hideAllScheduleSelectors() {
        scheduleSelection1.alpha = 0
        scheduleSelection2.alpha = 0
        scheduleSelection3.alpha = 0
        scheduleSelection4.alpha = 0
        scheduleSelection5.alpha = 0
        scheduleSelection6.alpha = 0
        scheduleSelection7.alpha = 0
    }
    //Makes all Highlights for the Period Listings Transparent
    func hideAllPeriodSelectors() {
        periodSelection1.alpha = 0
        periodSelection2.alpha = 0
        periodSelection3.alpha = 0
        periodSelection4.alpha = 0
        periodSelection5.alpha = 0
        periodSelection6.alpha = 0
        periodSelection7.alpha = 0
        periodSelection8.alpha = 0
    }
    
    //Makes all period selectors set to the default image
    func resetPeriodSelectorImages() {
        periodSelection1.image = UIImage(named: "orangeBar.png")
        periodSelection2.image = UIImage(named: "orangeBar.png")
        periodSelection3.image = UIImage(named: "orangeBar.png")
        periodSelection4.image = UIImage(named: "orangeBar.png")
        periodSelection5.image = UIImage(named: "orangeBar.png")
        periodSelection6.image = UIImage(named: "orangeBar.png")
        periodSelection7.image = UIImage(named: "orangeBar.png")
        periodSelection8.image = UIImage(named: "orangeBar.png")
    }

    //Sets period labels to the imported schedule
    func printArrayToSchedule(input: Array<String>){
        periodStartEndLabel1.text = input[0]
        periodStartEndLabel2.text = input[1]
        periodStartEndLabel3.text = input[2]
        periodStartEndLabel4.text = input[3]
        periodStartEndLabel5.text = input[4]
        periodStartEndLabel6.text = input[5]
        periodStartEndLabel7.text = input[6]
        periodStartEndLabel8.text = input[7]
    }
    
    //Gets the current time in hours:minutes:seconds
    func getCurrentTime() -> String{
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let defaultTimeZoneStr = formatter.stringFromDate(date);
        return defaultTimeZoneStr
    }
    
    //Sets up the NSTimer
    func initializeTimer()
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "utilizeTimer", userInfo: nil, repeats: true)
    }
    
    //Used by the NSTimer to keep elements updated
    func utilizeTimer()
    {
        let time = getCurrentTime()
        let newHours = time.substringWithRange(Range<String.Index>(start: time.startIndex.advancedBy(0), end: time.endIndex.advancedBy(-6)))
        let newMinutes = time.substringWithRange(Range<String.Index>(start: time.startIndex.advancedBy(3), end: time.endIndex.advancedBy(-3)))
        let newNumberOfMinutes = Int(newHours)! * 60 + Int(newMinutes)!
        if(numberOfMinutes < newNumberOfMinutes)
        {
            numberOfMinutes = newNumberOfMinutes
            updateTimeBasedElements()
        }
    }
    
    //Updates UIElements  with the current time
    func updateTimeBasedElements()
    {
        let time = getCurrentTime()
        let NSStringTime = time
        let hours = time.substringWithRange(Range<String.Index>(start: time.startIndex.advancedBy(0), end: time.endIndex.advancedBy(-6)))
        let minutes = time.substringWithRange(Range<String.Index>(start: time.startIndex.advancedBy(3), end: time.endIndex.advancedBy(-3)))
        let combinedInt = Int(hours)! * 100 + Int(minutes)!
        let numberOfMinutes = Int(hours)! * 60 + Int(minutes)!
        //debug: time tester
        //combinedInt = 829 //8:29
        //numberOfMinutes = 489 //8:29
        
        var activeSchedule = [Int]()
        if scheduleSelection1.alpha == 1 {activeSchedule = schedule1Times}
        if scheduleSelection2.alpha == 1 {activeSchedule = schedule2Times}
        if scheduleSelection3.alpha == 1 {activeSchedule = schedule3Times}
        if scheduleSelection4.alpha == 1 {activeSchedule = schedule4Times}
        if scheduleSelection5.alpha == 1 {activeSchedule = schedule5Times}
        if scheduleSelection6.alpha == 1 {activeSchedule = schedule6Times}
        if scheduleSelection7.alpha == 1 {activeSchedule = schedule7Times}
        hideAllPeriodSelectors()
        switch combinedInt
        {
        case activeSchedule[0]..<activeSchedule[1]: periodSelection1.alpha = 1
        case activeSchedule[2]..<activeSchedule[3]: periodSelection2.alpha = 1
        case activeSchedule[4]..<activeSchedule[5]: periodSelection3.alpha = 1
        case activeSchedule[6]..<activeSchedule[7]: periodSelection4.alpha = 1
        case activeSchedule[8]..<activeSchedule[9]: periodSelection5.alpha = 1
        case activeSchedule[10]..<activeSchedule[11]: periodSelection6.alpha = 1
        case activeSchedule[12]..<activeSchedule[13]: periodSelection7.alpha = 1
        case activeSchedule[14]..<activeSchedule[15]: periodSelection8.alpha = 1
        default: hideAllPeriodSelectors()
        }

        //Countdown timer
        var futureMinutes = 0
        var counter = -1
        for futureTime in activeSchedule{
            ++counter
            futureMinutes = (futureTime/100) * 60 + (futureTime%100)
            if futureMinutes > numberOfMinutes
            {
                countdownLabel.text = String(futureMinutes - numberOfMinutes)
                break
            }
            
        }
        switch counter
        {
            
        case 0...1:
                periodSelection1.image = UIImage(named: "hollowed2.png")
                periodSelection1.alpha = 1
        case 2...3:
                periodSelection2.image = UIImage(named: "hollowed2.png")
                periodSelection2.alpha = 1
        case 4...5:
                periodSelection3.image = UIImage(named: "hollowed2.png")
                periodSelection3.alpha = 1
        case 6...7:
                periodSelection4.image = UIImage(named: "hollowed2.png")
                periodSelection4.alpha = 1
        case 8...9:
                periodSelection5.image = UIImage(named: "hollowed2.png")
                periodSelection5.alpha = 1
        case 10...11:
                periodSelection6.image = UIImage(named: "hollowed2.png")
                periodSelection6.alpha = 1
        case 12...13:
                periodSelection7.image = UIImage(named: "hollowed2.png")
                periodSelection7.alpha = 1
        case 14...15:
                periodSelection8.image = UIImage(named: "hollowed2.png")
                periodSelection8.alpha = 1
        default:
            resetPeriodSelectorImages() //Ideally won't be used, just needed a default case
        }
        if (counter % 2) != 0
        {
            classInLabel.text = "class ends in"
            resetPeriodSelectorImages()
        }
        else
        {
            classInLabel.text = "class begins in"
        }
        if (futureMinutes - numberOfMinutes == 1)
        {
            minutesLabel.text = "minute"
        }
        else
        {
            minutesLabel.text = "minutes"
        }
        
        //Color Assignment based on amount of time left
        if (futureMinutes - numberOfMinutes) > 20
        {
            countdownLabel.textColor = UIColor(netHex: 0x009900)//darker green than the default
        }
        else if (futureMinutes - numberOfMinutes) <= 20 && (futureMinutes - numberOfMinutes) > 10
        {
            countdownLabel.textColor = UIColor.orangeColor()
        }
        else if (futureMinutes - numberOfMinutes) <= 10 && (futureMinutes - numberOfMinutes) > 0
        {
            countdownLabel.textColor = UIColor.redColor()
        }
        if countdownLabel.text == "99+" || (futureMinutes - numberOfMinutes) > 60 || (futureMinutes - numberOfMinutes) < 0
        {
            countdownLabel.textColor = UIColor.blackColor()
        }
        
        //Before/After School Conditions
        if (numberOfMinutes > futureMinutes) || (futureMinutes - numberOfMinutes > 99)
        {
            countdownLabel.text = "99+"
        }
        if (numberOfMinutes > futureMinutes)
        {
            hideAllPeriodSelectors()
            periodSelection1.image = UIImage(named: "hollowed2.png")
            periodSelection1.alpha = 1
            classInLabel.text = "class begins at"
            countdownLabel.text = (String)(activeSchedule[0]/100) + ":" + (String)(activeSchedule[0]%100)
            countdownLabel.font = UIFont(name: countdownLabel.font.fontName, size: 80)
            minutesLabel.text = "am"
        }
        else
        {
            countdownLabel.font = UIFont(name: countdownLabel.font.fontName, size: 110)
        }
    }


}

