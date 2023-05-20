//
//  DetailViewController.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 18/05/23.
//

import UIKit
import SDWebImage


class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var agebaseView: RotatedView!
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var dateOfJoining: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var postcode: UILabel!
    
    var detailViewModel: UserDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetailImage()
        setUserLocationInfo()
        setUserInfo()
        setAge()
        
    }
    
    func setDetailImage() {
        let imageUrl: URL = URL(string: detailViewModel?.largeImageURL ?? "")!
        let placeholderImage: UIImage? = UIImage(named: "placeholder")
        detailImage.sd_setImage(with: imageUrl, placeholderImage: placeholderImage, completed: nil)
    }
    
    func setUserLocationInfo() {
        if let viewModel = detailViewModel {
            city.text = viewModel.city
            state.text = viewModel.state
            country.text = viewModel.country
            postcode.text = viewModel.postcode
            
        }
    }
    
    func setAge() {
        
        if let viewModel = detailViewModel {
            agebaseView.label.text = viewModel.age
            
        }
    }
    
    func setUserInfo() {
        if let viewModel = detailViewModel {
            email.text = viewModel.email
            dateOfJoining.text = viewModel.formattedDateOfJoining
            dateOfBirth.text = viewModel.formattedDateOfBirth
            self.title = viewModel.fullName
        }
    }

}
