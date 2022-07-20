//
//  ViewController.swift
//  Practice
//
//  Created by yuchanglin on 2019/11/14.
//  Copyright © 2019 yuchanglin. All righlcr reserved.
//

import Foundation
import UIKit
import LCRExtensionSwift

// MARK: -  项目颜色
extension UIColor {
    
    public static var kColorE3E3E3: UIColor {
        get {return UIColor.init(lcr_hexString: "#E3E3E3")}
    }
    public static var kColorC3C3C3:UIColor {
        get {return UIColor.init(lcr_hexString: "#C3C3C3")}
    }
    
    public static var kColorFF3A69:UIColor {
        get {return UIColor.init(lcr_hexString: "#FF3A69")}
    }
    
    public static var kColorF3F3F3:UIColor {
        get {return UIColor.init(lcr_hexString: "#F3F3F3")}
    }
    
    public static var kColor3E278A:UIColor {
        get {return UIColor.init(lcr_hexString: "#3E278A")}
    }
    
    public static var kColor444444:UIColor {
        get {return UIColor.init(lcr_hexString: "#444444")}
    }
    
    public static var kColorAEA2D4:UIColor {
        get {return UIColor.init(lcr_hexString: "#AEA2D4")}
    }
    
    public static var kColor484848:UIColor {
        get {return UIColor.init(lcr_hexString: "#484848")}
    }
    
    public static var kColorAC8A38:UIColor {
        get {return UIColor.init(lcr_hexString: "#AC8A38")}
    }
    
    public static var kColor3FB0FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#3FB0FF")}
    }
    
    public static var kColor28146A:UIColor {
        get {return UIColor.init(lcr_hexString: "#28146A")}
    }
    
    public static var kColor473191:UIColor {
        get {return UIColor.init(lcr_hexString: "#473191")}
    }
    
    public static var kColor482D9F:UIColor {
        get {return UIColor.init(lcr_hexString: "#482D9F")}
    }
    
    public static var kColorCCCCCC:UIColor {
        get {return UIColor.init(lcr_hexString: "#CCCCCC")}
    }
    
    public static var kColor2D2D46:UIColor {
        get {return UIColor.init(lcr_hexString: "#2D2D46")}
    }
    
    public static var kColor4EBAFF:UIColor {
        get {return UIColor.init(lcr_hexString: "#4EBAFF")}
    }
    
    public static var kColorF75B5C:UIColor {
        get {return UIColor.init(lcr_hexString: "#F75B5C")}
    }
    
    
    public static var kColorFFD403:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFD403")}
    }
    
    public static var kColor40B0FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#40B0FF")}
    }
    
    public static var kColor3A3A5A:UIColor {
        get {return UIColor.init(lcr_hexString: "#3A3A5A")}
    }
    
    public static var kColorFFD503:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFD503")}
    }
    
    public static var kColorC8E5FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#C8E5FF")}
    }
    
    public static var kColor341C80:UIColor {
        get {return UIColor.init(lcr_hexString: "#341C80")}
    }
    
    public static var kColor351B8A:UIColor {
        get {return UIColor.init(lcr_hexString: "#351B8A")}
    }
    
    public static var kColor5D5D78:UIColor {
        get {return UIColor.init(lcr_hexString: "#5D5D78")}
    }
    
    public static var kColor5F4B9F:UIColor {
        get {return UIColor.init(lcr_hexString: "#5F4B9F")}
    }
    
    public static var kColor9E8CDC:UIColor {
        get {return UIColor.init(lcr_hexString: "#9E8CDC")}
    }
    
    public static var kColorB59700:UIColor {
        get {return UIColor.init(lcr_hexString: "#kB59700")}
    }
    
    public static var kColorE5DCFF:UIColor {
        get {return UIColor.init(lcr_hexString: "#E5DCFF")}
    }
    
    public static var kColor7052CF:UIColor {
        get {return UIColor.init(lcr_hexString: "#7052CF")}
    }
    
    public static var kColorF3A824:UIColor {
        get {return UIColor.init(lcr_hexString: "#F3A824")}
    }
    
    public static var kColorFFBA44:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFBA44")}
    }
    
    public static var kColor414B55:UIColor {
        get {return UIColor.init(lcr_hexString: "#414B55")}
    }
    
    public static var kColorFBEAC3:UIColor {
        get {return UIColor.init(lcr_hexString: "#FBEAC3")}
    }
     
    public static var kColorD5AE6C:UIColor {
        get {return UIColor.init(lcr_hexString: "#D5AE6C")}
    }
    
    public static var kColorAC781D:UIColor {
        get {return UIColor.init(lcr_hexString: "#AC781D")}
    }
    
    public static var kColor45D9B4:UIColor {
        get {return UIColor.init(lcr_hexString: "#45D9B4")}
    }
    
    
    public static var kColorFF4A3D:UIColor {
        get {return UIColor.init(lcr_hexString: "#FF4A3D")}
    }
    
    public static var kColorFFAC03:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFAC03")}
    }
    
    public static var kColor7346FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#7346FF")}
    }
    
    public class var kColorEEEEEE: UIColor {
        get {return UIColor.init(lcr_hexString: "#EEEEEE")}
    }
    
    public class var kColorEFEFF6: UIColor {
        get {return UIColor.init(lcr_hexString: "#EFEFF6")}
    }
    
    public class var kColorDEDEDE: UIColor {
        get {return UIColor.init(lcr_hexString: "#DEDEDE")}
    }
    
    public static var kColor6D6D6D:UIColor {
        get {return UIColor.init(lcr_hexString: "#6D6D6D")}
    }
    
    public static var kColorFFD70D:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFD70D")}
    }
    
    public static var kColor222222:UIColor {
        get {return UIColor.init(lcr_hexString: "#222222")}
    }
    
    public static var kColorA0B3CC:UIColor {
        get {return UIColor.init(lcr_hexString: "#A0B3CC")}
    }
    
    public static var kColorF2DB89:UIColor {
        get {return UIColor.init(lcr_hexString: "#F2DB89")}
    }
    
    public static var kColor45A7FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#45A7FF")}
    }
    
    public static var kColorF5F5F5:UIColor {
        get {return UIColor.init(lcr_hexString: "#F5F5F5")}
    }
    
    public static var kColorFFE9EC:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFE9EC")}
    }
    
    public static var kColor5D5D5D:UIColor {
        get {return UIColor.init(lcr_hexString: "#5D5D5D")}
    }
    
    public static var kColorF63329:UIColor {
        get {return UIColor.init(lcr_hexString: "#F63329")}
    }
    
    public static var kColor3B3A3A:UIColor {
        get {return UIColor.init(lcr_hexString: "#3B3A3A")}
    }
    
    public static var kColorE5E5E5:UIColor {
         get {return UIColor.init(lcr_hexString: "#E5E5E5")}
     }
    
    public static var kColor33A7FF:UIColor {
         get {return UIColor.init(lcr_hexString: "#33A7FF")}
     }
    
    public static var kColorC9EBFF:UIColor {
         get {return UIColor.init(lcr_hexString: "#C9EBFF")}
     }
    
    public static var kColor7E7E7E:UIColor {
         get {return UIColor.init(lcr_hexString: "#7E7E7E")}
     }
    
    public static var kColorFFDFC9:UIColor {
         get {return UIColor.init(lcr_hexString: "#FFDFC9")}
     }
    
    public static var kColorFF8000:UIColor {
         get {return UIColor.init(lcr_hexString: "#FF8000")}
     }
    
    public static var kColorF8F8F8:UIColor {
         get {return UIColor.init(lcr_hexString: "#F8F8F8")}
     }
    
    public static var kColorF8F8FB:UIColor {
         get {return UIColor.init(lcr_hexString: "#F8F8FB")}
     }
    
    
    public static var kColorABABAB:UIColor {
         get {return UIColor.init(lcr_hexString: "#ABABAB")}
     }
    
    
    public static var kColorFFC9C9:UIColor {
         get {return UIColor.init(lcr_hexString: "#FFC9C9")}
     }
    
    public static var kColorFF0000:UIColor {
         get {return UIColor.init(lcr_hexString: "#FF0000")}
     }
    
    public static var kColorC91D14:UIColor {
         get {return UIColor.init(lcr_hexString: "#C91D14")}
     }
    
    public static var kColorEB7157:UIColor {
         get {return UIColor.init(lcr_hexString: "#EB7157")}
     }
    
    public static var kColor5FD15B:UIColor {
         get {return UIColor.init(lcr_hexString: "#5FD15B")}
     }
    
    public static var kColorF356B2:UIColor {
         get {return UIColor.init(lcr_hexString: "#F356B2")}
     }
    
    public static var kColorFFFFFF:UIColor {
         get {return UIColor.init(lcr_hexString: "#FFFFFF")}
     }
    
    public static var kColorACACAC:UIColor {
        get {return UIColor.init(lcr_hexString: "#ACACAC")}
    }
    
    public static var kColor4ECB73:UIColor {
        get {return UIColor.init(lcr_hexString: "#4ECB73")}
    }
    
    public static var kColorFF2C21:UIColor {
        get {return UIColor.init(lcr_hexString: "#FF2C21")}
    }
    
    public static var kColorFAD337:UIColor {
        get {return UIColor.init(lcr_hexString: "#FAD337")}
    }
    
    public static var kColor435088:UIColor {
        get {return UIColor.init(lcr_hexString: "#435088")}
    }
    
    public static var kColor505050:UIColor {
        get {return UIColor.init(lcr_hexString: "#505050")}
    }
    
    public static var kColor3E4A5A:UIColor {
        get {return UIColor.init(lcr_hexString: "#3E4A5A")}
    }
    
    
    public static var kColor975FE4:UIColor {
        get {return UIColor.init(lcr_hexString: "#975FE4")}
    }
    
    public static var kColor54BEFF:UIColor {
        get {return UIColor.init(lcr_hexString: "#54BEFF")}
    }
    
    public static var kColorC7E8FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#C7E8FF")}
    }
    
    public static var kColorB4E1FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#B4E1FF")}
    }
   
    public static var kColorFFA648:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFA648")}
    }
    
    public static var kColorFFA25D:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFA25D")}
    }
    
    public static var kColor7BDFFF:UIColor {
        get {return UIColor.init(lcr_hexString: "#7BDFFF")}
    }
    
    public static var kColorFFD04E:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFD04E")}
    }
    
    public static var kColorFEAEAE:UIColor {
        get {return UIColor.init(lcr_hexString: "#FEAEAE")}
    }
    
    public static var kColorFFE07B:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFE07B")}
    }
    
    public static var kColor8DD2FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#8DD2FF")}
    }
    
    public static var kColorEBB2FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#EBB2FF")}
    }
    
    public static var kColorA4D8FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#A4D8FF")}
    }
    
    static var kColorF5FBFF:UIColor {
        get {return UIColor.init(lcr_hexString: "#F5FBFF")}
    }
    
    static var kColor1851EBF:UIColor {
        get {return UIColor.init(lcr_hexString: "#1851EB")}
    }
    
    static var kColorFDE039:UIColor {
        get {return UIColor.init(lcr_hexString: "#FDE039")}
    }
    
    static var kColor66D261:UIColor {
        get {return UIColor.init(lcr_hexString: "#66D261")}
    }
    
    static var kColorFF5A3E:UIColor {
        get {return UIColor.init(lcr_hexString: "#FF5A3E")}
    }
    
    static var kColorAD98FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#AD98FF")}
    }

    static var kColorFFD5D2:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFD5D2")}
    }

    static var kColor06DEA3:UIColor {
        get {return UIColor.init(lcr_hexString: "#06DEA3")}
    }
    
    static var kColor176D55:UIColor {
        get {return UIColor.init(lcr_hexString: "#176D55")}
    }
    
    static var kColor39649F:UIColor {
        get {return UIColor.init(lcr_hexString: "#39649F")}
    }
    static var kColor7ED321:UIColor {
        get {return UIColor.init(lcr_hexString: "#7ED321")}
    }
    
    static var kColor3889E4:UIColor {
        get {return UIColor.init(lcr_hexString: "#3889E4")}
    }
    
    static var kColor8ECA95:UIColor {
        get {return UIColor.init(lcr_hexString: "#8ECA95")}
    }
    
    static var kColor4E5771:UIColor {
        get {return UIColor.init(lcr_hexString: "#4E5771")}
    }
    
    static var kColorFB9B93:UIColor {
        get {return UIColor.init(lcr_hexString: "#FB9B93")}
    }
    
    static var kColorF6F6F6:UIColor {
        get {return UIColor.init(lcr_hexString: "#F6F6F6")}
    }
    static var kColor828282:UIColor {
        get {return UIColor.init(lcr_hexString: "#828282")}
    }
    
    static var kColor707070:UIColor {
        get {return UIColor.init(lcr_hexString: "#707070")}
    }
    
    static var kColorFFAA39:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFAA39")}
    }
    
    static var kColorFFB801:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFB801")}
    }
    
    static var kColorD53232:UIColor {
        get {return UIColor.init(lcr_hexString: "#D53232")}
    }
    
    static var kColor61A360:UIColor {
        get {return UIColor.init(lcr_hexString: "#61A360")}
    }
    
    static var kColorFF5C5C:UIColor {
        get {return UIColor.init(lcr_hexString: "#FF5C5C")}
    }
    
    static var kColorFFDB23:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFDB23")}
    }
    
    static var kColor0E58FF:UIColor {
        get {return UIColor.init(lcr_hexString: "#0E58FF")}
    }
    
    static var kColorEF7B25:UIColor {
        get {return UIColor.init(lcr_hexString: "#EF7B25")}
    }
    
    static var kColorFFF4EC:UIColor {
        get {return UIColor.init(lcr_hexString: "#FFF4EC")}
    }
    
    class var kColorC7C7CC: UIColor {
         get {return UIColor.init(lcr_hexString: "#C7C7CC")}
    }
    
    class var kColorE3F1FA: UIColor {
        get {return UIColor.init(lcr_hexString: "#E3F1FA")}
    }
    
    class var kColorF2F2F2: UIColor {
        get {return UIColor.init(lcr_hexString: "#F2F2F2")}
    }
    
    class var kColor8E8E93: UIColor {
        get {return UIColor.init(lcr_hexString: "#8E8E93")}
    }
    
    class var kColorFC940C: UIColor {
        get {return UIColor.init(lcr_hexString: "#FC940C")}
    }
  
    class var kColorF4BC42: UIColor {
        get {return UIColor.init(lcr_hexString: "#F4BC42")}
    }
    
    class var kColorFFB86D: UIColor {
        get {return UIColor.init(lcr_hexString: "#FFB86D")}
    }
    
    class var kColorFFF700: UIColor {
        get {return UIColor.init(lcr_hexString: "#FFF700")}
    }
    
    class var kColor2E68F0: UIColor {
        get {return UIColor.init(lcr_hexString: "#2E68F0")}
    }
    
    class var kColorFF8123: UIColor {
        get {return UIColor.init(lcr_hexString: "#FF8123")}
    }
    class var kColorBADEFF: UIColor {
        get {return UIColor.init(lcr_hexString: "#BADEFF")}
    }
    class var kColor666666: UIColor {
        get {return UIColor.init(lcr_hexString: "#666666")}
    }
    
    class var kColor444465: UIColor {
        get {return UIColor.init(lcr_hexString: "#444465")}
    }
    
    class var kColorE0EEFF: UIColor {
        get {return UIColor.init(lcr_hexString: "#E0EEFF")}
    }
    
    class var kColor61619C: UIColor {
        get {return UIColor.init(lcr_hexString: "#61619C")}
    }
    
    class var kColorE2E2F5: UIColor {
        get {return UIColor.init(lcr_hexString: "#E2E2F5")}
    }
    
    class var kColor7EB6FF: UIColor {
        get {return UIColor.init(lcr_hexString: "#7EB6FF")}
    }
    
    class var kColorCC7723: UIColor {
        get {return UIColor.init(lcr_hexString: "#CC7723")}
    }
    
    class var kColorFFCDCD: UIColor {
        get {return UIColor.init(lcr_hexString: "#FFCDCD")}
    }
    
    class var kColorAAAAAA: UIColor {
        get {return UIColor.init(lcr_hexString: "#AAAAAA")}
    }
    class var kColor734B37: UIColor {
        get {return UIColor.init(lcr_hexString: "#734B37")}
    }
    
    class var kColor303A4D: UIColor {
        get {return UIColor.init(lcr_hexString: "#303A4D")}
    }
    
    class var kColor2451DB: UIColor {
        get {return UIColor.init(lcr_hexString: "#2451DB")}
    }
    
    class var kColor5B331F: UIColor {
        get {return UIColor.init(lcr_hexString: "#5B331F")}
    }
    
    class var kColorC7A778: UIColor {
        get {return UIColor.init(lcr_hexString: "#C7A778")}
    }
    
    class var kColorBBBBBB: UIColor {
        get {return UIColor.init(lcr_hexString: "#BBBBBB")}
    }
    
    class var kColorFF5703: UIColor {
        get {return UIColor.init(lcr_hexString: "#FF5703")}
    }
    
    class var kColor333333: UIColor {
        get {return UIColor.init(lcr_hexString: "#333333")}
    }
    
    class var kColor434364: UIColor {
        get {return UIColor.init(lcr_hexString: "#434364")}
    }
    
    class var kColor333354: UIColor {
        get {return UIColor.init(lcr_hexString: "#333354")}
    }
    
    class var kColor717196: UIColor {
        get {return UIColor.init(lcr_hexString: "#717196")}
    }
    
    class var kColor8E6E43: UIColor {
        get {return UIColor.init(lcr_hexString: "#8E6E43")}
    }
    
    class var kColorF4E2BD: UIColor {
        get {return UIColor.init(lcr_hexString: "#F4E2BD")}
    }
    
    
    class var kColorF10F31: UIColor {
        get {return UIColor.init(lcr_hexString: "#F10F31")}
    }
    class var kColorA7692C: UIColor {
        get {return UIColor.init(lcr_hexString: "#A7692C")}
    }
    
    class var kColorFFBA03: UIColor {
        get {return UIColor.init(lcr_hexString: "#FFBA03")}
    }
    
    class var kColor8971D6: UIColor {
        get {return UIColor.init(lcr_hexString: "#8971D6")}
    }
    
    class var kColorFF9DBE: UIColor {
        get {return UIColor.init(lcr_hexString: "#FF9DBE")}
    }
    
    class var kColor32E8B6: UIColor {
        get {return UIColor.init(lcr_hexString: "#32E8B6")}
    }
    
    class var kColorB34DFF: UIColor {
        get {return UIColor.init(lcr_hexString: "#B34DFF")}
    }
    
    class var kColor643DFE: UIColor {
        get {return UIColor.init(lcr_hexString: "#643DFE")}
    }
    
    class var kColor21CFEB: UIColor {
        get {return UIColor.init(lcr_hexString: "#21CFEB")}
    }

    class var kColorFF7575: UIColor {
        get {return UIColor.init(lcr_hexString: "#FF7575")}
    }
    
    class var kColorDFDFDF: UIColor {
        get {return UIColor.init(lcr_hexString: "#DFDFDF")}
    }
    
    class var kColorFF9A03: UIColor {
        get {return UIColor.init(lcr_hexString: "#FF9A03")}
    }
    
    class var kColorFFD426: UIColor {
        get {return UIColor.init(lcr_hexString: "#FFD426")}
    }
    
    class var kColor391F8E: UIColor {
        get {return UIColor.init(lcr_hexString: "#391F8E")}
    }

    class var kColor2F1877: UIColor {
        get {return UIColor.init(lcr_hexString: "#2F1877")}
    }
    
    class var kColor352175: UIColor {
        get {return UIColor.init(lcr_hexString: "#352175")}
    }
    
    class var kColorC4B2FF: UIColor {
        get {return UIColor.init(lcr_hexString: "#C4B2FF")}
    }
    
    class var kColor4E78DC: UIColor {
        get {return UIColor.init(lcr_hexString: "#4E78DC")}
    }
    
    class var kColor1F53CC: UIColor {
        get {return UIColor.init(lcr_hexString: "#1F53CC")}
    }
    
    class var kColor2E4FB5: UIColor {
        get {return UIColor.init(lcr_hexString: "#2E4FB5")}
    }
    
    class var kColorE4C297: UIColor {
        get {return UIColor.init(lcr_hexString: "#E4C297")}
    }
    
    class var kColor295EDB: UIColor {
        get {return UIColor.init(lcr_hexString: "#295EDB")}
    }
    
    class var kColorF9BF00: UIColor {
        get {return UIColor.init(lcr_hexString: "#F9BF00")}
    }
    
    class var kColorFBFFD5: UIColor {
        get {return UIColor.init(lcr_hexString: "#FBFFD5")}
    }
    class var kColor197DEF: UIColor {
        get {return UIColor.init(lcr_hexString: "#197DEF")}
    }
    
    
    class var kColorDEA545: UIColor {
        get {return UIColor.init(lcr_hexString: "#DEA545")}
    }
    
    class var kColorF5E2BE: UIColor {
        get {return UIColor.init(lcr_hexString: "#F5E2BE")}
    }
    
    class var kColor098CEE: UIColor {
        get {return UIColor.init(lcr_hexString: "#098CEE")}
    }
    
    class var kColor2986FF: UIColor {
        get {return UIColor.init(lcr_hexString: "#2986FF")}
    }
    
    class var kColor8888AE: UIColor {
        get {return UIColor.init(lcr_hexString: "#8888AE")}
    }
    
    class var kColorFFE4A4: UIColor {
        get {return UIColor.init(lcr_hexString: "#FFE4A4")}
    }
    
    
    class var kColor18C5FF: UIColor {
        get {return UIColor.init(lcr_hexString: "#18C5FF")}
    }
    
    class var kColor004E97: UIColor {
        get {return UIColor.init(lcr_hexString: "#004E97")}
    }

    class var kColorFE931F: UIColor {
        get {return UIColor.init(lcr_hexString: "#FE931F")}
    }
    class var kColor3CAEFF: UIColor {
        get {return UIColor.init(lcr_hexString: "#3CAEFF")}
    }
    
    class var kColor59BCFF: UIColor {
        get {return UIColor.init(lcr_hexString: "#59BCFF")}
    }
    class var kColor999999: UIColor {
        get {return UIColor.init(lcr_hexString: "#999999")}
    }
    
    class var kColor434360: UIColor {
        get {return UIColor.init(lcr_hexString: "#434360")}
    }
    
    class var kColorC8C8C8: UIColor {
        get {return UIColor.init(lcr_hexString: "#C8C8C8")}
    }
    
    class var kColorDEA04B: UIColor {
        get {return UIColor.init(lcr_hexString: "#DEA04B")}
    }
    
    class var kColor363636: UIColor {
        get {return UIColor.init(lcr_hexString: "#363636")}
    }
    
    class var kColor211654: UIColor {
        get {return UIColor.init(lcr_hexString: "#211654")}
    }
    
    class var kColorCF2FA9: UIColor {
        get {return UIColor.init(lcr_hexString: "#CF2FA9")}
    }
    
    class var kColor302365: UIColor {
        get {return UIColor.init(lcr_hexString: "#302365")}
    }
    
    class var kColorA68AFF: UIColor {
        get {return UIColor.init(lcr_hexString: "#A68AFF")}
    }
    
    class var kColor385B92: UIColor {
        get {return UIColor.init(lcr_hexString: "#385B92")}
    }
    
    class var kColor6E798A: UIColor {
        get {return UIColor.init(lcr_hexString: "#6E798A")}
    }
    
    class var kColorB1B9C5: UIColor {
        get {return UIColor.init(lcr_hexString: "#B1B9C5")}
    }
    
    class var kColorFF7003: UIColor {
        get {return UIColor.init(lcr_hexString: "#FF7003")}
    }
    class var kColorD3D9E1: UIColor {
        get {return UIColor.init(lcr_hexString: "#D3D9E1")}
    }
    
    class var kColor4F565D: UIColor {
        get {return UIColor.init(lcr_hexString: "#4F565D")}
    }
    
    class var kColor989FA5: UIColor {
        get {return UIColor.init(lcr_hexString: "#989FA5")}
    }
    
    class var kColorF859A3: UIColor {
        get {return UIColor.init(lcr_hexString: "#F859A3")}
    }
    
    class var kColorEFEFE4: UIColor {
        get {return UIColor.init(lcr_hexString: "#EFEFE4")}
    }
    
    class var kColorFFACD3: UIColor {
        get {return UIColor.init(lcr_hexString: "#FFACD3")}
    }
    
    class var kColorFFE8F3: UIColor {
        get {return UIColor.init(lcr_hexString: "#FFE8F3")}
    }
    
    class var kColorBB3372: UIColor {
        get {return UIColor.init(lcr_hexString: "#BB3372")}
    }
    
    class var kColor0368FF: UIColor {
        get {return UIColor.init(lcr_hexString: "#0368FF")}
    }
    
    class var kColor9B83E6: UIColor {
        get {return UIColor.init(lcr_hexString: "#9B83E6")}
    }
    
    class var kColor7058C2: UIColor {
        get {return UIColor.init(lcr_hexString: "#7058C2")}
    }
    
    class var kColor3C454D: UIColor {
        get {return UIColor.init(lcr_hexString: "#3C454D")}
    }
    
    class var kColor9C8BD6: UIColor {
        get {return UIColor.init(lcr_hexString: "#9C8BD6")}
    }
    
    class var kColorFF662D: UIColor {
        get {return UIColor.init(lcr_hexString: "#FF662D")}
    }
   
    class var kColor3EDB72: UIColor {
        get {return UIColor.init(lcr_hexString: "#3EDB72")}
    }
   
    class var kColorF8F134: UIColor {
        get {return UIColor.init(lcr_hexString: "#F8F134")}
    }

    class var kColor3BD7FF: UIColor {
        get {return UIColor.init(lcr_hexString: "#3BD7FF")}
    }
    
    class var kColor4E369B: UIColor {
        get {return UIColor.init(lcr_hexString: "#4E369B")}
    }
    
    class var kColor69727A: UIColor {
        get {return UIColor.init(lcr_hexString: "#69727A")}
    }
    
    class var kColorFFCCE5: UIColor {
        get {return UIColor.init(lcr_hexString: "#FFCCE5")}
    }
    
    class var kColorFF9900: UIColor {
        get {return UIColor.init(lcr_hexString: "#FF9900")}
    }
   
    class var kColorA77708: UIColor {
        get {return UIColor.init(lcr_hexString: "#A77708")}
    }
    
    class var kColor754CF6: UIColor {
        get {return UIColor.init(lcr_hexString: "#754CF6")}
    }
    
    class var kColor3A208E: UIColor {
        get {return UIColor.init(lcr_hexString: "#3A208E")}
    }
    
    class var kColor593EB2: UIColor {
        get {return UIColor.init(lcr_hexString: "#593EB2")}
    }
    
    class var kColor8529FF: UIColor {
        get {return UIColor.init(lcr_hexString: "#8529FF")}
    }
    
    class var kColorB69EFF: UIColor {
        get {return UIColor.init(lcr_hexString: "#B69EFF")}
    }
    
    class var kColor4D32A5: UIColor {
        get {return UIColor.init(lcr_hexString: "#4D32A5")}
    }
    
    class var kColor3D2392: UIColor {
        get {return UIColor.init(lcr_hexString: "#3D2392")}
    }
    
    class var kColor24D492: UIColor {
        get {return UIColor.init(lcr_hexString: "#24D492")}
    }
    
    class var kColor8B75D4: UIColor {
        get {return UIColor.init(lcr_hexString: "#8B75D4")}
    }
    
    class var kColor331C7E: UIColor {
        get {return UIColor.init(lcr_hexString: "#331C7E")}
    }
    
    class var kColor4F379D: UIColor {
        get {return UIColor.init(lcr_hexString: "#4F379D")}
    }
}

// MARK: -  字体
public class KFont :UIFont {
    public class func Regular(_ number: CGFloat = 13) -> UIFont {
        return UIFont.init(name: Family_Font.Regular.rawValue, size: number)!
    }
    
    public class func Medium(_ number: CGFloat = 13) -> UIFont {
        return UIFont.init(name: Family_Font.Medium.rawValue, size: number)!
    }
    
    public class func Light(_ number: CGFloat = 13) -> UIFont {
        return UIFont.init(name: Family_Font.Light.rawValue, size: number)!
    }
    public class func Bold(_ number: CGFloat = 13) -> UIFont {
        return UIFont.init(name: Family_Font.Bold.rawValue, size: number)!
    }
    public class func Thin(_ number: CGFloat = 13) -> UIFont {
        return UIFont.init(name: Family_Font.Thin.rawValue, size: number)!
    }
    
    public class func Heavy(_ number: CGFloat = 13) -> UIFont {
        let font = try?UIFont(name: Family_Font.Heavy.rawValue, size: number)
        if font == nil {
            return UIFont(name: Family_Font.Bold.rawValue, size: number)!
        }
        return font!
    }

    public class func auto(_ number: CGFloat = 13,_ name:Family_Font = Family_Font.Regular) -> UIFont {
        
        if AppFrame.IS_iPhone6s {
            return UIFont(name: name.rawValue, size: number)!
        } else if AppFrame.IS_iPhone6sp {
            return UIFont(name: name.rawValue, size: number+1)!
        } else if AppFrame.IS_iPhone12_Pro {
            return UIFont(name: name.rawValue, size: number+1)!
        } else if AppFrame.IS_iPhone12_ProMax {
            return UIFont(name: name.rawValue, size: number+2)!
        }
        return UIFont(name: name.rawValue, size: number)!
    }
}
// MARK: - 字体名称
/**
 'PingFang SC'
 font:PingFangSC-Medium
 font:PingFangSC-Semibold
 font:PingFangSC-Light
 font:PingFangSC-Ultralight
 font:PingFangSC-Regular
 font:PingFangSC-Thin
 */
public enum Family_Font:String {
    case Regular = "PingFangSC-Regular"
    case Medium = "PingFangSC-Medium"
    case Light = "PingFangSC-Light"
    case Bold = "PingFangSC-Semibold"
    case Thin = "PingFangSC-Thin"
    case Heavy = "PingFangSC-Heavy"
}



//MARK: - frame 相关
/************************  屏幕尺寸  ***************************/

public enum AppFrame {
    
    public static let ScreenBounds = UIScreen.main.bounds
    
    // 屏幕宽度
    public static let kScreen_Width:CGFloat = ScreenBounds.size.width
    
    // 屏幕高度
    public static let kScreen_Height:CGFloat = ScreenBounds.size.height
    
    // iPhone 8s
    public static let iPhone6 = kScreen_Height  == 667 ? true : false
    
    // iphone 8P
    public static let iPhone6P = kScreen_Height == 736 ? true : false
    
    //判断iPhoneX，Xs（iPhoneX，iPhoneXs）
    public static let IS_IPHONE_X = kScreen_Height == 812 ? true : false
    
    // iphone Xr/iPhoneXsMax/proMax
    public static let IS_IPHONE_Xr = kScreen_Height == 896.0 ? true : false
    
    // iphone mini
    public static let IS_IPHONE_Mini = kScreen_Height == 780 ? true : false
    
    // iphone iphone12 及 iphone12 pro
    public static let IS_IPHONE_Pro = kScreen_Height == 844.0 ? true : false
    
    // iphone12 pro max
    public static let IS_IPHONE_ProMax = kScreen_Height == 926.0 ? true : false
    
    // iPhone 8s
    public static let IS_iPhone6s = kScreen_Width  == 375.0 ? true : false
    // iphone 8P
    public static let IS_iPhone6sp = kScreen_Width == 414.0 ? true : false
    // iphone 8P
    public static let IS_iPhone12_Pro = kScreen_Width == 390.0 ? true : false
    // iphone12 pro max
    public static let IS_iPhone12_ProMax = kScreen_Height == 428.0 ? true : false

    
    // 判断x系列
    public static let IS_PhoneXAll = IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Mini || IS_IPHONE_Pro || IS_IPHONE_ProMax
    
    //
    public static let W_Height_NavContentBar:CGFloat = 44.0
    
    public static let W_Height_StatusBar : CGFloat = IS_PhoneXAll ? 44.0:20.0
    // navigationBarHeight
    public static let W_Height_NavBar : CGFloat = IS_PhoneXAll ? 88 : 64
    
    // tabBarHeight
    public static let W_Height_TabBar : CGFloat = IS_PhoneXAll ? 49 + 34 : 49
    
    /** 如果是iPhoneX按照Plus 尺寸计算比例 */
    public static let Scale_Height = IS_PhoneXAll ? 736.0/667.0 : kScreen_Height / 667
    public static let Scale_Width = kScreen_Width / 375
    
    public static let Bottom_SafeHeight = IS_PhoneXAll ? (34.0):(0)
    public static let Top_SafeHeight = IS_PhoneXAll ? ( 24.0):(0)

    
}

/// RGBA的颜色设置
public func RGB(_ r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    
}

public func RGBA(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    
}

public func ScaleW(_ space:CGFloat) -> CGFloat {
    return AppFrame.Scale_Width * space
}

public func ScaleH(_ space:CGFloat) -> CGFloat {
    return AppFrame.Scale_Height * space
}

//MARK: - 图片资源

public func LCLog<T>(_ message:T, file:String = #file, funcName:String = #function, lineNum:Int = #line) {
    
//    if AppEnvironment.shared.environment == .release {
//        print("");
//        return
//    }
    
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent;
    print("\(fileName):[行数:\(lineNum)]-打印内容:\n\(message)");
    #else
    print("");
    #endif

}
