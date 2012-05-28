#!/usr/bin/env ruby

require 'rubygems'
require 'wukong'

class ResumeExperienceMapper < Wukong::Streamer::LineStreamer
  def process line
      resume_in_single_line = line
      puts "length of resume - #{resume_in_single_line.length}"
      index_of_years_of_experience = resume_in_single_line.index("years")

      if index_of_years_of_experience
        puts "after getting index of years of experience - #{index_of_years_of_experience}"
        text_around_years_of_experience = resume_in_single_line[index_of_years_of_experience-20, 40]
        puts "text around years - #{text_around_years_of_experience}"
        if match = text_around_years_of_experience.match(/\d+/)
          years_of_experience = match[0]
        end
      end
      puts years_of_experience
  end
end

Wukong::Script.new(ResumeExperienceMapper, nil).run
