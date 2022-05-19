//
//  AboutUsViewController.swift
//  MineMitra
//
//  Created by Swamy on 01/05/22.
//

import UIKit

class AboutUsViewController: UIViewController {
    @IBOutlet var firstLbl:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        firstLbl.text = "Directorate of Geology & Mining, UP, from its inception in 1955 is actively engaged in search of mineral wealth as promotion of scientific development of mineral resources along with conservation and development of mineral based industries in the state." + "\n" +  "All activities of the department are being spearheaded from its headquarters at Lucknow and Regional Offices based at Jhansi, Prayagraj, Agra, Sonbhadra, Ayodhya, Bareilly, Gorakhpur, Ghaziabad and Lucknow." + "\n" + "The Directorate aims to provide access of mineral for sustainable economic growth, equal benefit and prosperity to all the citizens of Uttar Pradesh and to formulate policies that effectively regulate activities in the Mining and Geology sector."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
