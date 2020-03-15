Pod::Spec.new do |s|
  s.name             = 'SwiftEssentialsKit'
  s.version          = '1.0.0'
  s.summary          = 'My own set of convenience methods,functions and classes. Written in Swift.'
  s.description      = <<-DESC
EssentialsKit is own set of convenience methods, functions and classes to speed up development. Written in Swift.
                       DESC

  s.homepage         = 'https://github.com/andreadelfante/SwiftEssentialsKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andrea Del Fante' => 'andreadelfante94@gmail.com' }
  s.source           = { :git => 'https://github.com/andreadelfante/SwiftEssentialsKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/a_delfante'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.1'
  
  s.default_subspec = 'Basic'

  s.subspec 'Basic' do |b|
    b.dependency 'SwiftEssentialsKit/PackageDTO'
    b.dependency 'SwiftEssentialsKit/AlertControllerBuilder'
    b.dependency 'SwiftEssentialsKit/Convenient'
  end

  s.subspec 'PackageDTO' do |p|
    p.source_files = 'SwiftEssentialsKit/PackageDTO/Classes/**/*'
  end

  s.subspec 'AlertControllerBuilder' do |a|
    a.source_files = 'SwiftEssentialsKit/AlertControllerBuilder/Classes/**/*'
  end

  s.subspec 'Convenient' do |m|
    m.source_files = 'SwiftEssentialsKit/Convenient/Classes/**/*'
  end

  s.subspec 'UI' do |u|
    u.dependency 'SwiftEssentialsKit/PackageDTO'
    u.dependency 'SwiftEssentialsKit/Convenient'
    u.dependency 'JTAppleCalendar', '~> 8.0.0'
    u.dependency 'R.swift', '~> 5.1.0'

    u.source_files = [
      'SwiftEssentialsKit/UI/Classes/**/*',
      'SwiftEssentialsKit/UI/Generated/**/*'
    ]

    u.resource = [
      'SwiftEssentialsKit/UI/Assets/**/*.{storyboard,xib,xcassets,lproj/*}'
    ]
  end

  # Development subspecs. DO NOT USE IN PRODUCTION!!

  s.subspec 'UI-Dev' do |ud|
    ud.dependency 'SwiftEssentialsKit/UI'

    ud.script_phases = [
      {
        :name => 'R.swift for SwiftEssentialsKit/UI',
        :script => '"$PODS_ROOT/R.swift/rswift" generate "$SRCROOT/R.generated.swift"',
        :input_files => ['$TEMP_DIR/rswift-lastrun'],
        :output_files => ['$SRCROOT/R.generated.swift'],
        :execution_position => :before_compile
      },
      {
        :name => 'Move R.swift for SwiftEssentialsKit/UI in correct folder',
        :script => 'mv "$SRCROOT/R.generated.swift" "$SRCROOT/../../SwiftEssentialsKit/UI/Generated/"',
        :execution_position => :before_compile
      }
    ]
  end
end
