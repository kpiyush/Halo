#!/usr/bin/env ruby

require 'rubygems'
require 'pdf/reader'

class Resume
  def Resume.squash_to_single_line
    File.open("data/all_resumes.txt", 'w') do |resume_text_file|
      Dir.foreach("data") do |file|
        next unless file.end_with?('.pdf')
        doc_in_single_line = ""
        PDF::Reader.open("data/#{file}") do |f|
          f.pages.each do |page|
            doc_in_single_line.concat(page.text.gsub("\n", " "))
          end
        end
        resume_text_file.write(doc_in_single_line.concat("\n"))
      end
    end
  end
end

Resume.squash_to_single_line


