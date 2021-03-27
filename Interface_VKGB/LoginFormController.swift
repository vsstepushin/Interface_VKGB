//
//  LoginFormController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 19.01.2021.
//

import UIKit
import Alamofire
import WebKit


class LoginFormController: UIViewController {
    
    @IBOutlet weak var webViewLoginVK: WKWebView! {
        didSet{
        webViewLoginVK.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewLoginVK.load(VKRequests.vkLoginRequests())
    }
}
extension LoginFormController: WKNavigationDelegate{
 
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            
            guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                decisionHandler(.allow)
                return
            }
            
            let params = fragment
                .components(separatedBy: "&")
                .map { $0.components(separatedBy: "=") }
                .reduce([String: String]()) { result, param in
                    var dict = result
                    let key = param[0]
                    let value = param[1]
                    dict[key] = value
                    return dict
            }
        
        guard let token = params["access_token"],
              let userId = Int(params["user_id"]!)
        else {
            decisionHandler(.cancel)
            return
        }
        Session.sharedSession.token = token
        Session.sharedSession.userId = userId
            print(token)
            print(userId)
         
        performSegue(withIdentifier: "VKLogIn", sender: nil)
        decisionHandler(.cancel)
        }
        
}
    //
//    @IBAction func exitVK(segue: UIStoryboardSegue) {
//
//            }
//
//    @IBOutlet var loginInput: UITextField!
//    @IBOutlet var passwordInput: UITextField!
//    @IBOutlet var vkUIScrollView: UIScrollView!
//
//    @IBAction func myUnwindingAction(unwindSegue: UIStoryboardSegue) {}
//        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//            guard checkingUser() else {
//                shownAlert()
//                return false
//            }
//            return true
//        }
//
//        internal func checkingUser() -> Bool {
//            guard
//                 //получаем логин
//            let logInVK = loginInput.text,
//            //получаем пароль
//            let passwordVK = passwordInput.text
//            //проверяем на верность
//            else { return false }
//            return logInVK == "1" && passwordVK == "1"
//        }
//
//        private func shownAlert() {
//            let alertController = UIAlertController(
//                title: "Ошибка",
//                message: "Неверный логин или пароль!",
//                preferredStyle: .alert)
//            let alertItem = UIAlertAction(
//                title: "Ok:(",
//                style: .cancel)
//            { _ in
//                self.loginInput.text = ""
//                self.passwordInput.text = ""
//            }
//            alertController.addAction(alertItem)
//            present(alertController,
//                    animated: true,
//                    completion: nil)
//        }
//    @IBAction func loginButton(_ sender: Any) {
//
//    }
//
//    // Когда клава появляется
//    @objc func keyboardWasShown (notification: Notification) {
//        // Получаем размер клавиатуры
//        let info = notification.userInfo! as NSDictionary
//        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
//        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
//
//        // Добавляем отступ внизу СкроллВью, равный размеру клавиатуры
//        self.vkUIScrollView.contentInset = contentInsets
//        vkUIScrollView?.scrollIndicatorInsets = contentInsets
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //жест нажатия
//        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        //присваbdftv его СкроллВью
//        vkUIScrollView?.addGestureRecognizer(hideKeyboardGesture)
//
//    }
//
//    //Когда клава исчезает
//    @objc func keyboardWillBeHidden (notification: Notification) {
//        //Устанавливаем отступ снизу СкроллВью, равный 0
//        let contentInsets = UIEdgeInsets.zero
//        vkUIScrollView?.contentInset = contentInsets
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        //Подписываемся на уведомления
//        //1.Появление клавы
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
//        //2.Исчезновение клавы
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    @objc func hideKeyboard() {
//        self.vkUIScrollView?.endEditing(true)
//    }

