//
//  AllData.swift
//  MINE
//
//  Created by Vemulawada Swamy on 27/04/22.
//

import Foundation
import SwiftyJSON
class DashboardData:NSObject{
    var  PurposeType = ""
    var  RECEIVED = ""
    var  APPROVED = ""
    var  REJECTED = ""
    var  INPROCESS = ""
    var  PurposeId = ""
    var  RuleTypeId = ""

    init(j:JSON){
        self.PurposeType = j["PurposeType"].stringValue
        self.RECEIVED = j["RECEIVED"].stringValue
        self.APPROVED = j["APPROVED"].stringValue
        self.REJECTED = j["REJECTED"].stringValue
        self.INPROCESS = j["INPROCESS"].stringValue
        self.PurposeId = j["PurposeId"].stringValue
        self.RuleTypeId = j["RuleTypeId"].stringValue
    }
}
class LoginData:NSObject,NSCoding{
    var  UserId = ""
    var  UserType = ""
    var  UserRoll = ""
    var  RollId = ""
    var  UserName = ""
    var  PersonName = ""
    var  MobileNo = ""
    var  EmailId = ""
    var  DistrictId = ""
    var  TehshilId = ""
    var IsDepartmentUser:Bool? = false
    var Status = ""
    var Message = ""
    init(j:JSON){
        self.UserId = j["UserId"].stringValue
        self.UserType = j["UserType"].stringValue
        self.UserRoll = j["UserRoll"].stringValue
        self.RollId = j["RollId"].stringValue
        self.UserName = j["UserName"].stringValue
        self.PersonName = j["PersonName"].stringValue
        self.MobileNo = j["MobileNo"].stringValue
        self.EmailId = j["EmailId"].stringValue
        self.DistrictId = j["DistrictId"].stringValue
        self.TehshilId = j["TehshilId"].stringValue
        self.IsDepartmentUser = j["IsDepartmentUser"].boolValue
        self.Status = j["Status"].stringValue
        self.Message = j["Message"].stringValue
    }
    required init(coder aDecoder: NSCoder) {
        UserId = aDecoder.decodeObject(forKey: "UserId") as? String ?? ""
        UserType = aDecoder.decodeObject(forKey: "UserType") as? String ?? ""
        UserRoll = aDecoder.decodeObject(forKey: "UserRoll") as? String ?? ""
        RollId = aDecoder.decodeObject(forKey: "RollId") as? String ?? ""
        UserName = aDecoder.decodeObject(forKey: "UserName") as? String ?? ""
        PersonName = aDecoder.decodeObject(forKey: "PersonName") as? String ?? ""
        MobileNo = aDecoder.decodeObject(forKey: "MobileNo") as? String ?? ""
        EmailId = aDecoder.decodeObject(forKey: "EmailId") as? String ?? ""
        DistrictId = aDecoder.decodeObject(forKey: "DistrictId") as? String ?? ""
        Status = aDecoder.decodeObject(forKey: "Status") as? String ?? ""
        TehshilId = aDecoder.decodeObject(forKey: "TehshilId") as? String ?? ""
        Message = aDecoder.decodeObject(forKey: "Message") as? String ?? ""
        IsDepartmentUser = aDecoder.decodeObject(forKey: "IsDepartmentUser") as? Bool ?? false
        
    }
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(UserId, forKey: "UserId")
        aCoder.encode(UserType, forKey: "UserType")
        aCoder.encode(UserRoll, forKey: "UserRoll")
        aCoder.encode(RollId, forKey: "RollId")
        aCoder.encode(UserName, forKey: "UserName")
        aCoder.encode(PersonName, forKey: "PersonName")
        aCoder.encode(MobileNo, forKey: "MobileNo")
        aCoder.encode(EmailId, forKey: "EmailId")
        aCoder.encode(DistrictId, forKey: "DistrictId")
        aCoder.encode(Status, forKey: "Status")
        aCoder.encode(TehshilId, forKey: "TehshilId")
        aCoder.encode(Message, forKey: "Message")
        aCoder.encode(IsDepartmentUser, forKey: "IsDepartmentUser")
    }
}

class InProcessData:NSObject{
   var ApplicationEnd = ""
    var ApplicationCategory = ""
    var TOTAL = 0
    init(j:JSON){
        self.ApplicationEnd = j["ApplicationEnd"].stringValue
        self.ApplicationCategory = j["ApplicationCategory"].stringValue
        self.TOTAL = j["TOTAL"].intValue
    }

}
class ApplicationData:NSObject{
    var ApplicationEnd = ""
     var ApplicationCategory = ""
     var TOTAL = 0
    var DistrictName = ""
    var DistrictId = 0
     init(j:JSON){
         self.ApplicationEnd = j["ApplicationEnd"].stringValue
         self.ApplicationCategory = j["ApplicationCategory"].stringValue
         self.TOTAL = j["TOTAL"].intValue
         self.DistrictName = j["DistrictName"].stringValue
         self.DistrictId = j["DistrictId"].intValue
     }
}
class SearchData:NSObject{
    var ApplicationNumber = ""
    var ApplicationDate = ""
   var TypeOfApplication = ""
   var ApplicantName = ""
    var ApplicationStatus = ""
    var ApplicationEnd = ""
    init(j:JSON){
        self.ApplicationNumber = j["ApplicationNumber"].stringValue
        self.ApplicationDate = j["ApplicationDate"].stringValue
        self.TypeOfApplication = j["TypeOfApplication"].stringValue
        self.ApplicantName = j["ApplicantName"].stringValue
        self.ApplicationStatus = j["ApplicationStatus"].stringValue
        self.ApplicationEnd = j["ApplicationEnd"].stringValue
    }
   
}
