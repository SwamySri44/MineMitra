//
//  Extensions.swift
//  FITMIRCHI
//
//  Created by Radiant Web Tech on 25/07/19.
//  Copyright © 2019 Radiant Web Tech. All rights reserved.
//

import UIKit
import Security
import AVFoundation
import AdSupport
import WebKit
import AVKit
extension UIView {
    
    
    func setRoundedView() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
    
    
    func roundedcorner()
    {
        self.layer.cornerRadius = 33
    }
    
    func viewborder()
    {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0).cgColor
    }
    
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    @IBInspectable var shadow1: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow1()
            }
        }
    }
    @IBInspectable var shadow2: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow2()
            }
        }
    }
    @IBInspectable var shadow3: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow3()
            }
        }
    }
    
    
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 2.0, height: 3.0),
                   shadowOpacity: Float = 0.6,
                   shadowRadius: CGFloat = 5.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }

    func addShadow1(shadowColor: CGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2693857021),
                   shadowOffset: CGSize = CGSize(width: 0, height:3),
                   shadowOpacity: Float = 0.5,
                   shadowRadius: CGFloat = 0.8) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
    
    
    func addShadow3(shadowColor: CGColor = UIColor.white.cgColor ,
                   shadowOffset: CGSize = CGSize(width: 0, height:3),
                   shadowOpacity: Float = 0.5,
                   shadowRadius: CGFloat = 0.8) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
    func addShadow2(shadowColor: CGColor = UIColor.gray.cgColor,
                   shadowOffset: CGSize = CGSize(width: 0, height:2),
                   shadowOpacity: Float = 1,
                   shadowRadius: CGFloat = 4) {
        layer.masksToBounds = false
       layer.shadowRadius = 4
        layer.shadowOpacity = 1
       layer.shadowColor = UIColor.gray.cgColor
      layer.shadowOffset = CGSize(width: 0 , height:2)
    }
    
    func bottomshadow()
    {
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 8.0
        self.layer.shadowOpacity = 4
        
    }
    func bottomshadow1()
    {
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 2
        
    }
    
    
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func roundedBottomLeft(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft,.topRight],
                                     cornerRadii: CGSize(width: 15, height: 15))
        let maskLayer1 = CAShapeLayer()
       
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    func roundedBottomRight(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomRight],
                                     cornerRadii: CGSize(width: 15, height: 15))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
}



extension UIImageView {
    
     func setRoundedImg() {
        
        
        let radius: CGFloat = self.bounds.size.height / 2.0

        self.layer.cornerRadius = radius
//        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.clipsToBounds = true
    }
}
extension UILabel {
    
     func setRoundedLbl() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}

extension UIView {
    
     func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}
    



extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
class RoundShadowView: UIView {
    
    let containerView = UIView()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.init()
        ////fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView() {
        
        // set the shadow of the view's layer
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
        let path = UIBezierPath(roundedRect:self.bounds, byRoundingCorners:[.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 40, height: 40))
                let maskLayer = CAShapeLayer()
                maskLayer.frame = self.bounds;
                maskLayer.path = path.cgPath
                self.layer.mask = maskLayer;
        // set the cornerRadius of the containerView's layer
        //containerView.layer.cornerRadius = cornerradius
       // containerView.layer.masksToBounds = true
        
        addSubview(containerView)
        
        //
        // add additional views to the containerView here
        //
        
        // add constraints
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//
//        // pin the containerView to the edges to the view
//        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension Date {
    func adding(Hours: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: Hours, to: self)!
    }
}
extension Dictionary {
    func mergedWith(otherDictionary: [Key: Value]) -> [Key: Value] {
        var mergedDict: [Key: Value] = [:]
        [self, otherDictionary].forEach { dict in
            for (key, value) in dict {
                mergedDict[key] = value
            }
        }
        return mergedDict
    }
}
private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
               return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let t = textField.text ?? ""
        print("Maximum lenght\(t)")
        let text = t.prefix(maxLength)
        if t.count == 10{
            self.resignFirstResponder()
        }else{
            self.becomeFirstResponder()
        }
        textField.text = String(text)
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
extension String {
    
    func matches(for regex: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range:  NSRange(self.startIndex..., in: self))
            return results.map {
                //self.substring(with: Range($0.range, in: self)!)
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
extension String {
    
    func base64ToImage() -> UIImage? {
        
        if let url = URL(string: self),let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
            return image
        }
        
        return nil
        
    }
}

extension UILabel{

func animation(typing value:String,duration: Double){
  let characters = value.map { $0 }
  var index = 0
  Timer.scheduledTimer(withTimeInterval: duration, repeats: true, block: { [weak self] timer in
      if index < value.count {
          let char = characters[index]
          self?.text! += "\(char)"
          index += 1
      } else {
          timer.invalidate()
      }
  })
}

     func textWithAnimation(text:String,duration:CFTimeInterval){
        fadeTransition(duration)
        self.text = text
      }

      //followed from @Chris and @winnie-ru
      func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
      }

    }



extension UITableView {
func reloadWithAnimation() {
    self.reloadData()
    let tableViewHeight = self.bounds.size.height
    let cells = self.visibleCells
    var delayCounter = 6
    for cell in cells {
        cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
    }
    for cell in cells {
        UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 8, initialSpringVelocity: 8, options: .curveEaseInOut, animations: {
            cell.transform = CGAffineTransform.identity
        }, completion: nil)
        delayCounter += 1
    }
}
}

extension String{
    func getShortFormatDate(input:String)->String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd-MM-yyyy"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        if let date = dateFormatterGet.date(from: input ) {
            print("am excuted payback date")
           return  dateFormatterPrint.string(from: date)
        } else {
            return ""
            
        }
    }
}
extension UICollectionView {
func reloadWithAnimation() {
    self.reloadData()
    let tableViewHeight = self.bounds.size.height
    let cells = self.visibleCells
    var delayCounter = 0
    for cell in cells {
        cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
    }
    for cell in cells {
        UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            cell.transform = CGAffineTransform.identity
        }, completion: nil)
        delayCounter += 1
    }
}
}

@IBDesignable
class UIRoundedImageView: UIImageView {

    var color = UIColor.red
    @IBInspectable var isRoundedCorners: Bool = false {
        didSet { setNeedsLayout() }
    }
    @IBInspectable var shadowForCircel: UIColor = .white {
        didSet { setNeedsLayout() }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if isRoundedCorners {
            let shapeLayer = CAShapeLayer()
       shapeLayer.path = UIBezierPath(ovalIn:
                CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height
            )).cgPath
           
           
           layer.mask = shapeLayer
           
        }
            
            
            
        else {
            layer.mask = nil
           
           // layer.mask = shapeLayer
        }

    }
    func addShadowColor(shadowColor: CGColor) {
         let Slayer = CAShapeLayer()
           Slayer.shadowColor = shadowColor
           Slayer.shadowOffset = CGSize(width: 2.0, height: 3.0)
        Slayer.shadowOpacity = 0.6
           Slayer.shadowRadius = 5
       }

}









extension UIViewController {
  func toastMessage(_ message: String){
    guard let window = UIApplication.shared.keyWindow else {return}
    let messageLbl = UILabel()
    messageLbl.text = message
    messageLbl.textAlignment = .center
    messageLbl.font = UIFont.systemFont(ofSize: 12)
    messageLbl.textColor = .white
    messageLbl.backgroundColor = UIColor(white: 0, alpha: 0.5)

    let textSize:CGSize = messageLbl.intrinsicContentSize
    let labelWidth = min(textSize.width, window.frame.width - 40)

    messageLbl.frame = CGRect(x: 20, y: window.frame.height - 90, width: labelWidth + 30, height: textSize.height + 20)
    messageLbl.center.x = window.center.x
    messageLbl.layer.cornerRadius = messageLbl.frame.height/2
    messageLbl.layer.masksToBounds = true
    window.addSubview(messageLbl)

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

    UIView.animate(withDuration: 1, animations: {
        messageLbl.alpha = 0
    }) { (_) in
        messageLbl.removeFromSuperview()
    }
    }
}}

 
extension UITableView {
    func updateHeaderViewHeight() {
        if let header = self.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: self.bounds.width, height: 0))
            header.frame.size.height = newSize.height 
        }
    }
}
//extension UICollectionView 


class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
extension String {
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }
}
class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    var tempCellAttributesArray = [UICollectionViewLayoutAttributes]()
    let leftEdgeInset: CGFloat = 10
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let cellAttributesArray = super.layoutAttributesForElements(in: rect)
        //Oth position cellAttr is InConvience Emoji Cell, from 1st onwards info cells are there, thats why we start count from 2nd position.
        if(cellAttributesArray != nil && cellAttributesArray!.count > 1) {
            for i in 1..<(cellAttributesArray!.count) {
                let prevLayoutAttributes: UICollectionViewLayoutAttributes = cellAttributesArray![i - 1]
                let currentLayoutAttributes: UICollectionViewLayoutAttributes = cellAttributesArray![i]
                let maximumSpacing: CGFloat = 8
                let prevCellMaxX: CGFloat = prevLayoutAttributes.frame.maxX
                //UIEdgeInset 30 from left
                let collectionViewSectionWidth = self.collectionViewContentSize.width - leftEdgeInset
                let currentCellExpectedMaxX = prevCellMaxX + maximumSpacing + (currentLayoutAttributes.frame.size.width )
                if currentCellExpectedMaxX < collectionViewSectionWidth {
                    var frame: CGRect? = currentLayoutAttributes.frame
                    frame?.origin.x = prevCellMaxX + maximumSpacing
                    frame?.origin.y = prevLayoutAttributes.frame.origin.y
                    currentLayoutAttributes.frame = frame ?? CGRect.zero
                } else {
                    // self.shiftCellsToCenter()
                    currentLayoutAttributes.frame.origin.x = leftEdgeInset
                    //To Avoid InConvience Emoji Cell
                    if (prevLayoutAttributes.frame.origin.x != 0) {
                        currentLayoutAttributes.frame.origin.y = prevLayoutAttributes.frame.origin.y + prevLayoutAttributes.frame.size.height + 08
                    }
                }
                // print(currentLayoutAttributes.frame)
            }
            //print("Main For Loop End")
        }
        // self.shiftCellsToCenter()
        return cellAttributesArray
    }
    
    func shiftCellsToCenter() {
        if (tempCellAttributesArray.count == 0) {return}
        let lastCellLayoutAttributes = self.tempCellAttributesArray[self.tempCellAttributesArray.count-1]
        let lastCellMaxX: CGFloat = lastCellLayoutAttributes.frame.maxX
        let collectionViewSectionWidth = self.collectionViewContentSize.width - leftEdgeInset
        let xAxisDifference = collectionViewSectionWidth - lastCellMaxX
        if xAxisDifference > 0 {
            for each in self.tempCellAttributesArray{
                each.frame.origin.x += xAxisDifference/2
            }
        }
        
    }
}

 class Spinner {

fileprivate static var activityIndicator: UIActivityIndicatorView?
    fileprivate static var style: UIActivityIndicatorView.Style = .whiteLarge
fileprivate static var baseBackColor = UIColor(white: 0, alpha: 0.6)
fileprivate static var baseColor = UIColor.white

/**
Add spinner to `UIView`

- Parameters:
    - view: The `UIView` being used to add the `UIActivityIndicatorView` onto
    - style: Style used for the `UIActivityIndicatorView`
    - backgroundColor: Display color
    - baseColor: Tint color of the spinner
*/
    public static func start(from view: UIView,
                             style: UIActivityIndicatorView.Style = Spinner.style,
                       backgroundColor: UIColor = Spinner.baseBackColor,
                       baseColor: UIColor = Spinner.baseColor) {
    
    guard Spinner.activityIndicator == nil else { return }
    
        let spinner = UIActivityIndicatorView(style: style)
    spinner.backgroundColor = backgroundColor
    spinner.color = baseColor
    spinner.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(spinner)
    
    // Auto-layout constraints
    addConstraints(to: view, with: spinner)
    
    Spinner.activityIndicator = spinner
    Spinner.activityIndicator?.startAnimating()
}

/// Stops and removes `UIActivityIndicatorView`
    public static func stop() {
    Spinner.activityIndicator?.stopAnimating()
    Spinner.activityIndicator?.removeFromSuperview()
    Spinner.activityIndicator = nil
}

/**
Add auto-layout constraints to provided `UIActivityIndicatorView`

- Parameters:
    - view: The view used to provide layout constraints
    - spinner: The `UIActivityIndicatorView` used to display
*/
fileprivate static func addConstraints(to view: UIView, with spinner: UIActivityIndicatorView) {
    spinner.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    spinner.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    spinner.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    spinner.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
}
}
extension UIView{

    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            activityIndicator.style = .whiteLarge
        } else {
            activityIndicator.style = .whiteLarge
        }
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)

        self.addSubview(backgroundView)
    }

    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}
extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()

        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }

        return result
    }
}
extension UITableView {

    //Variable-height UITableView tableHeaderView with autolayout
    func layoutTableHeaderView() {

        guard let headerView = self.tableHeaderView else { return }
        headerView.translatesAutoresizingMaskIntoConstraints = false

        let headerWidth = headerView.bounds.size.width
        let temporaryWidthConstraint = headerView.widthAnchor.constraint(equalToConstant: headerWidth)

        headerView.addConstraint(temporaryWidthConstraint)

        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()

        let headerSize = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let height = headerSize.height
        var frame = headerView.frame

        frame.size.height = height
        headerView.frame = frame

        self.tableHeaderView = headerView

        headerView.removeConstraint(temporaryWidthConstraint)
        headerView.translatesAutoresizingMaskIntoConstraints = true
    }

}
extension Array where Element : Equatable {
    func allEqual() -> Bool {
        if let firstElem = first {
            return !dropFirst().contains { $0 != firstElem }
        }
        return true
    }
}


extension String {
var capitalizeEachWord:String {
    //break it into an array by delimiting the sentence using a space
    var breakupSentence = self.components(separatedBy: " ")
    var newSentence = ""

    //Loop the array and concatinate the capitalized word into a variable.
    for wordInSentence  in breakupSentence {
        newSentence = "\(newSentence) \(wordInSentence.capitalized)"
    }

    // send it back up.
    return newSentence
}
}
extension UIScrollView {
   func scrollToBottom(animated: Bool) {
     if self.contentSize.height < self.bounds.size.height { return }
     let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
     self.setContentOffset(bottomOffset, animated: animated)
  }
}
public extension UIView {
    public func safeAddSubView(subView: UIView, viewTag: Int = 1000000) {
        guard tag != viewTag else { return }

        let addedView = subviews.flatMap { $0.viewWithTag(viewTag) }.first

        if let _addedView = addedView {
            _addedView.removeFromSuperview()
        }

        subView.tag = viewTag
        addSubview(subView)
    }
}

// MARK: - Nib Loadable

public protocol NibLoadable: class {
    static var nibName: String { get }
    static var bundle: Bundle? { get }
}

public extension NibLoadable {
    static var bundle: Bundle? {
        return Bundle(for: Self.self)
    }

    static var nibName: String {
        return String(describing: Self.self)
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: bundle)
    }
}

public extension NibLoadable where Self: UIView {
    static func createFromNib(_ owner: AnyObject? = nil) -> Self {
        return (nib.instantiate(withOwner: owner, options: nil).first as? Self)!
    }
}
extension String {
    func checkBackspace1() -> Bool {
        if let char = self.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                return true
            }
            return false
        }
        return false
    }
}
extension UILabel {

    // MARK: - spacingValue is spacing that you need
    func addInterlineSpacing(spacingValue: CGFloat = 2) {

        // MARK: - Check if there's any text
        guard let textString = text else { return }
       
        // MARK: - Create "NSMutableAttributedString" with your text
        let attributedString = NSMutableAttributedString(string: textString)

        // MARK: - Create instance of "NSMutableParagraphStyle"
        let paragraphStyle = NSMutableParagraphStyle()

        // MARK: - Actually adding spacing we need to ParagraphStyle
        paragraphStyle.lineSpacing = spacingValue

        // MARK: - Adding ParagraphStyle to your attributed String
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))

        // MARK: - Assign string that you've modified to current attributed Text
        attributedText = attributedString
    }
    func addInterlineSpacing1(spacingValue: CGFloat = 2) {

        // MARK: - Check if there's any text
        guard let textString = text else { return }
       
        // MARK: - Create "NSMutableAttributedString" with your text
        let attributedString = NSMutableAttributedString(string: textString)

        // MARK: - Create instance of "NSMutableParagraphStyle"
        let paragraphStyle = NSMutableParagraphStyle()

        // MARK: - Actually adding spacing we need to ParagraphStyle
        paragraphStyle.lineSpacing = spacingValue
        self.textAlignment = .center
        // MARK: - Adding ParagraphStyle to your attributed String
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))
       
        // MARK: - Assign string that you've modified to current attributed Text
        attributedText = attributedString
    }

}

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}


class CircleView: UIView {

    weak var circleView: UIView?
    lazy var isAnimating = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setup() {
        let rectSide = (frame.size.width > frame.size.height) ? frame.size.height : frame.size.width
        let circleRect = CGRect(x: (frame.size.width-rectSide)/2, y: (frame.size.height-rectSide)/2, width: rectSide, height: rectSide)
        let circleView = UIView(frame: circleRect)
        circleView.backgroundColor = .clear
        circleView.layer.cornerRadius = rectSide/2
        circleView.layer.borderWidth = 2.0
        circleView.layer.borderColor = UIColor.clear.cgColor
        addSubview(circleView)
        self.circleView = circleView
    }

    func resizeCircle (summand: CGFloat) {

        guard let circleView = circleView else { return }
        frame.origin.x -= summand/2
        frame.origin.y -= summand/2
        frame.size.height += summand
        frame.size.width += summand

        circleView.frame.size.height += summand
        circleView.frame.size.width += summand
    }

    private func animateChangingCornerRadius (toValue: Any?, duration: TimeInterval) {
        guard let circleView = circleView else { return }
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fromValue = circleView.layer.cornerRadius
        animation.toValue =  toValue
        animation.duration = duration
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        circleView.layer.add(animation, forKey:"cornerRadius")
    }


    private func circlePulseAinmation(_ summand: CGFloat, duration: TimeInterval, completionBlock:@escaping ()->()) {

        guard let circleView = circleView else { return }
        UIView.animate(withDuration: duration, delay: 0,  options: .curveEaseInOut, animations: { [weak self] in
            self?.resizeCircle(summand: summand)
        }) { _ in completionBlock() }

        animateChangingCornerRadius(toValue: circleView.frame.size.width/2, duration: duration)
    }

    func resizeCircleWithPulseAinmation(_ summand: CGFloat,  duration: TimeInterval) {
        if (!isAnimating) {
            isAnimating = true
            circlePulseAinmation(summand, duration:duration) { [weak self] in
                guard let self = self else { return }
                self.circlePulseAinmation((-1)*summand, duration:duration) {self.isAnimating = false}
            }
        }
    }
}
class ConfettiView: UIView {
    
    private let dimension = 4
    private var velocities = [50, 100, 150, 200]
    private var imagesNames = ["box", "circle", "spiral", "triangle"]
    private var colors: [UIColor] = [.red, .green, .blue, .magenta]
    
    private let rootLayer = CALayer()
    private let confettiViewEmitterLayer = CAEmitterLayer()
    private let confettiViewEmitterCell = CAEmitterCell()
    
    // MARK: - Initializers
    override public init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required public init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonInit()
    }
    
    private func commonInit() {
       
        
        
        setupRootLayer()
        setupConfettiEmitterLayer()
        
        confettiViewEmitterLayer.emitterCells = generateConfettiEmitterCells()
        rootLayer.addSublayer(confettiViewEmitterLayer)
    }
    
    // MARK: - Setup Layers
    private func setupRootLayer() {
        rootLayer.backgroundColor = UIColor.white.cgColor
    }
    
    private func setupConfettiEmitterLayer() {
        confettiViewEmitterLayer.emitterSize = CGSize(width: bounds.width, height: 2)
        confettiViewEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
      //  confettiViewEmitterLayer.emitterPosition = CGPoint(x: Width(bounds) / 2, y: NSHeight(bounds))
    }
    
    // MARK: - Generator
    private func generateConfettiEmitterCells() -> [CAEmitterCell] {
        var cells = [CAEmitterCell]()
        
        for index in 0..<10 {
            let cell = CAEmitterCell()
            cell.color = nextColor(i: index)
            cell.contents = nextImage(i: index)
            cell.birthRate = 4.0
            cell.lifetime = 14.0
            cell.lifetimeRange = 0
            cell.scale = 0.1
            cell.scaleRange = 0.25
            cell.velocity = -CGFloat(randomVelocity)
            cell.velocityRange = 0
            cell.emissionLongitude = CGFloat.pi
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 1
        
            cells.append(cell)
        }
        
        return cells
    }
    
    // MARK: - Helpers
    var randomNumber: Int {
        return Int(arc4random_uniform(UInt32(dimension)))
    }
    
    var randomVelocity: Int {
        return velocities[randomNumber]
    }
    
    private func nextColor(i: Int) -> CGColor {
        return colors[i % dimension].cgColor
    }
    
    private func nextImage(i: Int) -> CGImage? {
        let image = UIImage(named:imagesNames[i % dimension])
        return image?.cgImage
    }
}
extension UIImageView {
  func enableZoom() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
    isUserInteractionEnabled = true
    addGestureRecognizer(pinchGesture)
  }

  @objc
  private func startZooming(_ sender: UIPinchGestureRecognizer) {
    let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
    guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
    sender.view?.transform = scale
    sender.scale = 1
  }
}
extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.numberOfLines = 0
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
class Toast {
    static func show(message: String, controller: UIViewController) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 25;
        toastContainer.clipsToBounds  =  true

        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        if UserDefaults.standard.bool(forKey: "Interface") == true{
            toastLabel.backgroundColor = UIColor.white.withAlphaComponent(0.6)
            toastLabel.textColor = .black
        }else{
            toastLabel.backgroundColor = .clear
            toastLabel.textColor = .white
        }
        toastLabel.font = UIFont(name: "Rubic-Regular", size: 15)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0

        toastContainer.addSubview(toastLabel)
        
        controller.view.addSubview(toastContainer)
        controller.view.bringSubviewToFront(toastContainer)
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false

        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([a1, a2, a3, a4])
        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: controller.view, attribute: .leading, multiplier: 1, constant: 65)
                let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -65)
                let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: controller.view, attribute: .bottom, multiplier: 1, constant: -75)
                controller.view.addConstraints([c1, c2, c3])

                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                    toastContainer.alpha = 1.0
                }, completion: { _ in
                    UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                        toastContainer.alpha = 0.0
                    }, completion: {_ in
                        toastContainer.removeFromSuperview()
                    })
                })
            }
        }



extension UILabel {
    func setTextWithTypeAnimation(typedText: String, characterDelay: TimeInterval = 5.0) {
        text = ""
        var writingTask: DispatchWorkItem?
        writingTask = DispatchWorkItem { [weak weakSelf = self] in
            for character in typedText {
                DispatchQueue.main.async {
                    weakSelf?.text!.append(character)
                }
                Thread.sleep(forTimeInterval: characterDelay/100)
            }
        }
        
        if let task = writingTask {
            let queue = DispatchQueue(label: "typespeed", qos: DispatchQoS.userInteractive)
            queue.asyncAfter(deadline: .now() + 0.05, execute: task)
        }
    }
    
}
extension UIImage {
    convenience init?(withContentsOfUrl imageUrlString: String) throws {
        let imageUrl = URL(string: imageUrlString)!
        let imageData = try Data(contentsOf: imageUrl)
        
        self.init(data: imageData)
    }
    
}

extension String {
    var youtubeID: String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
        
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        
        guard let result = regex?.firstMatch(in: self, range: range) else {
            return nil
        }
        
        return (self as NSString).substring(with: result.range)
    }
    
}
extension NSAttributedString {
     public func attributedStringByTrimmingCharacterSet(charSet: CharacterSet) -> NSAttributedString {
         let modifiedString = NSMutableAttributedString(attributedString: self)
        modifiedString.trimCharactersInSet(charSet: charSet)
         return NSAttributedString(attributedString: modifiedString)
     }
}
extension NSMutableAttributedString {
     public func trimCharactersInSet(charSet: CharacterSet) {
        var range = (string as NSString).rangeOfCharacter(from: charSet as CharacterSet)

         // Trim leading characters from character set.
         while range.length != 0 && range.location == 0 {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: charSet)
         }

         // Trim trailing characters from character set.
        range = (string as NSString).rangeOfCharacter(from: charSet, options: .backwards)
         while range.length != 0 && NSMaxRange(range) == length {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: charSet, options: .backwards)
         }
     }
}
extension DispatchQueue {

    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }

}

//@IBDesignable class GradientView: UIView {
//    @IBInspectable var firstColor: UIColor = UIColor.hexStringToUIColor(hex: "#F2934D")
//    @IBInspectable var secondColor: UIColor = UIColor.hexStringToUIColor(hex: "#D95337")
////F2934D D95337
//    @IBInspectable var vertical: Bool = true
//
//    lazy var gradientLayer: CAGradientLayer = {
//        let layer = CAGradientLayer()
//        layer.colors = [firstColor.cgColor, secondColor.cgColor]
//        layer.startPoint = CGPoint.zero
//        return layer
//    }()
//
//    //MARK: -
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        applyGradient()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        applyGradient()
//    }
//
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        applyGradient()
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        updateGradientFrame()
//    }
//
//    //MARK: -
//
//    func applyGradient() {
//        updateGradientDirection()
//        layer.sublayers = [gradientLayer]
//    }
//
//    func updateGradientFrame() {
//        gradientLayer.frame = bounds
//    }
//
//    func updateGradientDirection() {
//        gradientLayer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
//    }
//}
extension UILabel {
    var numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return rHeight / charSize
    }
}
extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
   }
}
extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}





extension UIColor{
    static func hexStringToUIColor (hex:String, alpha: CGFloat = 1.0) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    static func hexStringToUIColorvalue (hex:String, alpha:CGFloat) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
   
}
//@IBDesignable class GradientView: UIView {
//    @IBInspectable var firstColor: UIColor = UIColor.red
//    @IBInspectable var secondColor: UIColor = UIColor.green
//
//    @IBInspectable var vertical: Bool = true
//
//    lazy var gradientLayer: CAGradientLayer = {
//        let layer = CAGradientLayer()
//        layer.colors = [firstColor.cgColor, secondColor.cgColor]
//        layer.startPoint = CGPoint.zero
//        return layer
//    }()
//
//    //MARK: -
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        applyGradient()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        applyGradient()
//    }
//
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        applyGradient()
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        updateGradientFrame()
//    }
//
//    //MARK: -
//
//    func applyGradient() {
//        updateGradientDirection()
//        layer.sublayers = [gradientLayer]
//    }
//
//    func updateGradientFrame() {
//        gradientLayer.frame = bounds
//    }
//
//    func updateGradientDirection() {
//        gradientLayer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
//    }
//}
