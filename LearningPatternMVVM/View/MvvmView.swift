//
//  MvvmView.swift
//  LearningPatternMVVM
//
//  Created by Raman Kozar on 11/12/2022.
//

import UIKit

class MvvmView: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var showFirstImageBtn: UIButton!
    @IBOutlet weak var showSecondImageBtn: UIButton!
    
    var viewModel: MvvmViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = MvvmViewModel()
        getState()
        viewModel.showDefaultImage()
        
    }
    
    @IBAction func showFirstImageBtnPressed(_ sender: Any) {
        viewModel.showFirstImage()
    }
    
    @IBAction func showSecondImageBtnPressed(_ sender: Any) {
        viewModel.showSecondImage()
    }
    
    private func update(state: MvvmModel.Model?) {
        
        guard let state = state else { return }
        imageView.image = UIImage(named: state.image)
        activityIndicator.isHidden = state.isHidden
        
    }
    
    private func getState() {
        self.activityIndicator.isHidden = true
        viewModel.updateView = {
            [weak self] data in
            
            guard let self = self else { return }
            switch data {
            case .initial(let initial):
                self.update(state: initial)
                self.activityIndicator.stopAnimating()
            case.loading(let loading):
                self.update(state: loading)
                self.activityIndicator.startAnimating()
            case .success(let success):
                self.update(state: success)
                self.activityIndicator.stopAnimating()
            case .failure(let failure):
                self.update(state: failure)
                self.activityIndicator.stopAnimating()
            }
            
        }
    }
    
}
