# Adds the PulseWidgets widget extension (home widget + Live Activity) to
# ios/Runner.xcodeproj, replacing the manual Xcode steps. Safe to re-run.
#   ruby tool/add_ios_widget_target.rb
# Uses the xcodeproj gem that ships with CocoaPods.
require 'xcodeproj'

project = Xcodeproj::Project.open('ios/Runner.xcodeproj')
runner = project.targets.find { |t| t.name == 'Runner' }

if project.targets.any? { |t| t.name == 'PulseWidgets' }
  puts 'PulseWidgets target already exists'
  exit
end

ext = project.new_target(:app_extension, 'PulseWidgets', :ios, '17.0')
group = project.main_group.find_subpath('PulseWidgets', true)
group.set_source_tree('<group>')
group.set_path('PulseWidgets')
ext.add_file_references([group.new_reference('PulseWidgets.swift')])
group.new_reference('Info.plist')
group.new_reference('PulseWidgets.entitlements')

ext.build_configurations.each do |config|
  s = config.build_settings
  s['PRODUCT_BUNDLE_IDENTIFIER'] = 'com.example.gymApp.PulseWidgets'
  s['PRODUCT_NAME'] = '$(TARGET_NAME)'
  s['INFOPLIST_FILE'] = 'PulseWidgets/Info.plist'
  s['GENERATE_INFOPLIST_FILE'] = 'NO'
  s['CODE_SIGN_ENTITLEMENTS'] = 'PulseWidgets/PulseWidgets.entitlements'
  s['SWIFT_VERSION'] = '5.0'
  s['TARGETED_DEVICE_FAMILY'] = '1,2'
  s['IPHONEOS_DEPLOYMENT_TARGET'] = '17.0'
  s['MARKETING_VERSION'] = '1.0.0' # keep in step with pubspec `version`
  s['CURRENT_PROJECT_VERSION'] = '1'
  s['SKIP_INSTALL'] = 'YES'
  s['LD_RUNPATH_SEARCH_PATHS'] = ['$(inherited)', '@executable_path/Frameworks', '@executable_path/../../Frameworks']
end

runner.build_configurations.each do |config|
  config.build_settings['CODE_SIGN_ENTITLEMENTS'] = 'Runner/Runner.entitlements'
end
runner_group = project.main_group.find_subpath('Runner')
runner_group.new_reference('Runner.entitlements') unless runner_group.files.any? { |f| f.path == 'Runner.entitlements' }

# Embed the .appex in the app, before Flutter's "Thin Binary" script (else Xcode reports a cycle).
runner.add_dependency(ext)
embed = runner.new_copy_files_build_phase('Embed Foundation Extensions')
embed.dst_subfolder_spec = '13' # PlugIns
build_file = embed.add_file_reference(ext.product_reference)
build_file.settings = { 'ATTRIBUTES' => ['RemoveHeadersOnCopy'] }
phases = runner.build_phases
phases.delete(embed)
thin = phases.index { |p| p.respond_to?(:name) && p.name == 'Thin Binary' } || phases.length
phases.insert(thin, embed)

project.save
puts 'Added PulseWidgets target'
