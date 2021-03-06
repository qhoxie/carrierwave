# encoding: utf-8

###
# EXISTENCE

Then /^there should be a file at '(.*?)'$/ do |file|
  File.exist?(file_path(file)).should be_true
end

Then /^there should not be a file at '(.*?)'$/ do |file|
  File.exist?(file_path(file)).should be_false
end

Then /^there should be a file called '(.*?)' somewhere in a subdirectory of '(.*?)'$/ do |file, directory|
  Dir.glob(File.join(file_path(directory), '**', file)).any?.should be_true
end

###
# IDENTICAL

Then /^the file at '(.*?)' should be identical to the file at '(.*?)'$/ do |one, two|
  File.read(file_path(one)).should == File.read(file_path(two))
end

Then /^the file at '(.*?)' should not be identical to the file at '(.*?)'$/ do |one, two|
  File.read(file_path(one)).should_not == File.read(file_path(two))
end

Then /^the file called '(.*?)' in a subdirectory of '(.*?)' should be identical to the file at '(.*?)'$/ do |file, directory, other|
  File.read(Dir.glob(File.join(file_path(directory), '**', file)).first).should == File.read(file_path(other))
end

Then /^the file called '(.*?)' in a subdirectory of '(.*?)' should not be identical to the file at '(.*?)'$/ do |file, directory, other|
  File.read(Dir.glob(File.join(file_path(directory), '**', file)).first).should_not == File.read(file_path(other))
end

###
# REVERSING

Then /^the file at '(.*?)' should be the reverse of the file at '(.*?)'$/ do |one, two|
  File.read(file_path(one)).should == File.read(file_path(two)).reverse
end