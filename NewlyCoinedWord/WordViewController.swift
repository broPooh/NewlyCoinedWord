//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by bro on 2022/04/29.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet var searchStackView: UIStackView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchBtn: UIButton!
    
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var recommendBtn1: UIButton!
    @IBOutlet var recommendBtn2: UIButton!
    @IBOutlet var recommendBtn3: UIButton!
    @IBOutlet var recommendBtn4: UIButton!
    
    let wordDictinoary : Dictionary<String, String> = ["별다줄" : "별걸 다 줄인다", "jmt" : "졸맛탱", "스드메" : "스튜디오 드레스 메이크업", "주불" : "주소 불러의 줄임말", "스불재" : "스스로 불러온 재앙의 줄임말", "혼틈" : "혼란을 틈탄다는 뜻"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchStackSetting()
        
        recommendBtnSetting(button : recommendBtn1)
        recommendBtnSetting(button : recommendBtn2)
        recommendBtnSetting(button : recommendBtn3)
        recommendBtnSetting(button : recommendBtn4)
    }
    
    func searchStackSetting() {
        searchStackView.layer.borderColor = UIColor.black.cgColor
        searchStackView.layer.borderWidth = 2
    }
    
    func recommendBtnSetting(button btn : UIButton) {
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 15
    }

    
    @IBAction func tapClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func returnKeyClicked(_ sender: UITextField) {
        view.endEditing(true)
        checkSearchText(searchTextField.text)
    }
    
    @IBAction func searchBtnClicked(_ sender: UIButton) {
        view.endEditing(true)
        checkSearchText(searchTextField.text)
    }
    
    
    func checkSearchText(_ searchText : String?) {
        recommendSearch()
        if (searchText != nil && !searchText!.isEmpty) {
            let getSearhResult = getSearchResult(searchText!)
            let result = getSearhResult != nil ? getSearhResult : "검색 결과가 없습니다."
            resultLabel.text = result
        } else {
            resultLabel.text = "검색어를 입력하세요"
            showAlert(title: "검색어 오류", message: "검색어를 입력해주세요!")
        }
    }
    
    func recommendSearch() {
        setBtnTitle(btn: recommendBtn1, wordDictinoary.randomElement()!.key)
        setBtnTitle(btn: recommendBtn2, wordDictinoary.randomElement()!.key)
        setBtnTitle(btn: recommendBtn3, wordDictinoary.randomElement()!.key)
        setBtnTitle(btn: recommendBtn4, wordDictinoary.randomElement()!.key)
    }
    
    func setBtnTitle(btn : UIButton, _ title : String) {
        btn.setTitle(title, for: .normal)
    }
    
    func getSearchResult(_ searchText : String) -> String? {
        return wordDictinoary[searchText]
    }
    
    
    func showAlert(title t : String, message m : String) {
        let alert = UIAlertController(title: t, message: m, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func recommendBtnClicked(_ sender: UIButton) {
        checkSearchText(sender.title(for: .normal))
    }
    
}

