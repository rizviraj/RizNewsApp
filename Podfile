source 'https://github.com/CocoaPods/Specs.git'

target 'RizNewsApp' do
    use_frameworks!
    
    pod 'SnapKit'
    
    pod 'SwiftMessages'
    
    pod 'Alamofire'

    pod 'AlamofireImage'
    
    pod 'HexColors'

    pod 'NVActivityIndicatorView'
    
    pod 'RxSwift'
    pod 'RxCocoa'
    
    pod 'FTPopOverMenu_Swift'
    
    pod 'RealmSwift'
    
    pod 'IQKeyboardManager'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '5.0'
        end
    end
end
