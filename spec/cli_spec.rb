require_relative './spec_helper'

describe "File and folder creation" do

  describe "test.html" do
    it 'is a file in the main folder of this lesson' do
      expect(File.exists?("test.html")).to be(true), "Expected 'test.html' to exist. Use `touch test.html` to create it"
    end
  end

  describe "example_folder" do
    it 'is a folder in the main folder of this lesson' do
      is_directory = File.exists? "#{Dir.pwd}/example_folder"
      expect(is_directory).to be_truthy, "Expected 'example_folder' to exist. Use `mkdir example_folder` to create it"
    end

    describe "test.md" do
      it 'is a file within example_folder' do
        file_is_present = File.exists? "#{Dir.pwd}/example_folder/test.md"
        expect(file_is_present).to be_truthy, "Expected 'test.md' to exist inside 'example_folder'"
      end
    end
  end

  describe "second_example_folder" do
    it 'is a folder in the main folder of this lesson' do
      is_directory = File.exists? "#{Dir.pwd}/second_example_folder"
      expect(is_directory).to be_truthy, "Expected 'second_example_folder' to exist"
    end

    describe "final_test.css" do
      it 'is a file within second_example_folder' do
        file_is_present = File.exists? "#{Dir.pwd}/second_example_folder/final_test.css"
        expect(file_is_present).to be_truthy, "Expected 'final_test.css' to exist inside 'second_example_folder'"
      end
    end
  end

end
