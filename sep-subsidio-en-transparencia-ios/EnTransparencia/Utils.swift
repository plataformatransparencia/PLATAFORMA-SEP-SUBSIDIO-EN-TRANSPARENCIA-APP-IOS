import Foundation
import SwiftUI
import UIKit


func DownlondFromUrl(url: String, fileName: String){
    // destino
    let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
    let destinationFileUrl = documentsUrl.appendingPathComponent("\(fileName).pdf")
    //URL de descarga
    let fileURL = URL(string: url)
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfig)
    let request = URLRequest(url:fileURL!)
    let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
        if let tempLocalUrl = tempLocalUrl, error == nil {
            // Success
            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                print("Se descargo el archivo. Codigo de Respuesta: \(statusCode)")
            }
            do {
                try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
            } catch (let writeError) {
                print("Error al crear el Archivo \(destinationFileUrl) : \(writeError)")
            }
        } else {
            print("Se produjo un error al descargar el archivo. Description: \(error!.localizedDescription)");
        }
    }
    task.resume()
}

func calcularPorcentaje(monto: Double, montoPublico: Double) -> Double{
    let porcentaje = (monto * 100)/montoPublico
    return porcentaje
}

func formatResultForRegion(basedOn: String)-> String{
    let number = NumberFormatter()
    number.numberStyle = .decimal
    number.usesGroupingSeparator = true
    number.maximumFractionDigits = 2
    number.minimumFractionDigits = 2
    if let asNumber = Double(basedOn){
        let numberNS = NSNumber(value: asNumber)
        return number.string(from: numberNS)!
    }
    return "Ocurrio un error al canvertir el numero. Intenta de nuevo"
    
}

func toRoman(numero: Int) -> String {
    let conversionTable: [(intNumber: Int, romanNumber: String)] =
        [(1000, "M"),
         (900, "CM"),
         (500, "D"),
         (400, "CD"),
         (100, "C"),
         (90, "XC"),
         (50, "L"),
         (40, "XL"),
         (10, "X"),
         (9, "IX"),
         (5, "V"),
         (4, "IV"),
         (1, "I")]
    var roman = ""
    var remainder = 0
    for entry in conversionTable {
        let quotient = (numero - remainder) / entry.intNumber
        remainder += quotient * entry.intNumber
        roman += String(repeating: entry.romanNumber, count: quotient)
    }
    return roman
}

func downloadImage(urlstr: String, imageView: UIImageView){
    let url = URL(string: urlstr)!
    let task = URLSession.shared.dataTask(with: url){ data, _, _ in
        guard let data = data else {
            return NSLog("Fallo la carga de la imagen.")
        }
        DispatchQueue.main.async {
            imageView.image = UIImage(data: data)
        }
    }
    task.resume()
}

func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
    image.draw(in: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: newSize.width, height: newSize.height)))
    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
}



extension String {
        // Returns true if the String starts with a substring matching to the prefix-parameter.
        // If isCaseSensitive-parameter is true, the function returns false,
        // if you search "sA" from "San Antonio", but if the isCaseSensitive-parameter is false,
        // the function returns true, if you search "sA" from "San Antonio"

        func hasPrefixCheck(prefix: String, isCaseSensitive: Bool) -> Bool {

            if isCaseSensitive == true {
                return self.hasPrefix(prefix)
            } else {
                var thePrefix: String = prefix, theString: String = self

                while thePrefix.count != 0 {
                    if theString.count == 0 { return false }
                    if theString.lowercased().first != thePrefix.lowercased().first { return false }
                    theString = String(theString.dropFirst())
                    thePrefix = String(thePrefix.dropFirst())
                }; return true
            }
        }
        // Returns true if the String ends with a substring matching to the prefix-parameter.
        // If isCaseSensitive-parameter is true, the function returns false,
        // if you search "Nio" from "San Antonio", but if the isCaseSensitive-parameter is false,
        // the function returns true, if you search "Nio" from "San Antonio"
        func hasSuffixCheck(suffix: String, isCaseSensitive: Bool) -> Bool {

            if isCaseSensitive == true {
                return self.hasSuffix(suffix)
            } else {
                var theSuffix: String = suffix, theString: String = self

                while theSuffix.count != 0 {
                    if theString.count == 0 { return false }
                    if theString.lowercased().last != theSuffix.lowercased().last { return false }
                    theString = String(theString.dropLast())
                    theSuffix = String(theSuffix.dropLast())
                }; return true
            }
        }
        // Returns true if the String contains a substring matching to the prefix-parameter.
        // If isCaseSensitive-parameter is true, the function returns false,
        // if you search "aN" from "San Antonio", but if the isCaseSensitive-parameter is false,
        // the function returns true, if you search "aN" from "San Antonio"
        func containsSubString(theSubString: String, isCaseSensitive: Bool) -> Bool {

            if isCaseSensitive == true {
                return self.range(of: theSubString) != nil
            } else {
                return self.range(of: theSubString, options: .caseInsensitive) != nil
            }
        }
        func reemplazo() -> String{
            let num = [
                1 : "\u{00B9}", 2 : "\u{00B2}", 3 : "\u{00B3}",
                4 : "\u{2074}", 5 : "\u{2075}", 6 : "\u{2076}",
                7 : "\u{2077}", 8 : "\u{2078}", 9 : "\u{2076}",
                10 : "\u{00B9}\u{2070}", 11 : "\u{00B9}\u{00B9}",
                12 : "\u{00B9}\u{00B2}",
                13 : "\u{00B9}\u{00B3}",
                14 : "\u{00B9}\u{2074}",
                15 : "\u{00B9}\u{2075}",
                16 : "\u{00B9}\u{2076}",
                17 : "\u{00B9}\u{2077}",
                18 : "\u{00B9}\u{2078}",
                19 : "\u{00B9}\u{2076}",
            ]
            var resultado = ""
            for i in 1...19{
                let result = self.range(of: "[" + String(i) + "]") != nil
                if result{
                    resultado =  self.replacingOccurrences(of: "[" + String(i) + "]", with: num[i] ?? "")
                    break
                }else{
                    resultado = self
                }
            }
            return resultado
        }
        
    
    
    }

func searchSubStringTermingCharacters(cadena:String, busqueda: String) -> String {
    return cadena.trimmingCharacters(in: CharacterSet(charactersIn: busqueda))
}
