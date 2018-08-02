# Uncomment the next line to define a global platform for your project
workspace 'taipei-tourist-site-swift.xcworkspace'
platform :ios, '8.0'

abstract_target 'Dependency' do
    # pod 'SwiftLint'
    pod 'SDWebImage'
    pod 'RxSwift', '~> 3.0'
    pod 'RxCocoa', '~> 3.0'
    pod 'Moya/RxSwift', '~> 8.0.0-beta.1'
    pod 'Cell+Rx', '~> 1.2.1'
    pod 'RxOptional', '~> 3.1.3'
    pod 'RxDataSources'
    # pod 'RxTimer'
    pod 'RxResult', '~> 2.0.3'
    # pod 'RxColor'
    pod 'Moya-ObjectMapper', '~> 2.2.1'
    pod 'Result', '~> 3.1.0'
    pod 'RxAlamofire', '~> 3.0.2'
    pod 'SnapKit', '~> 3.1.2'
    pod 'RealmSwift', '2.8.1'
    pod 'AwesomeCache', '~> 5.0'
    # pod 'SimulatorStatusMagic', :configurations => ['Debug']
    
    target 'taipei-tourist-site-swift' do
        use_frameworks!
        pod 'Kingfisher', '~> 3.2.4'
        pod 'PullToRefresher', '~> 2.0'
        pod 'Fabric'
        pod 'Crashlytics'
    end
    
    target 'TMBase' do
        project 'TMBase/TMBase.xcodeproj'
        use_frameworks!
    end
    
end

target 'taipei-tourist-site-swiftTests' do
    inherit! :search_paths
    use_frameworks!
    # Pods for testing
    pod 'Nimble'
    pod 'Quick'
end

target 'taipei-tourist-site-swiftUITests' do
    inherit! :search_paths
    use_frameworks!
    # Pods for testing
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.2'
        end
    end
end
