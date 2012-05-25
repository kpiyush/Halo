#!/usr/bin/env ruby

require 'rubygems'
require 'wukong'

class ResumeExperienceMapper < Wukong::Streamer::LineStreamer
  def process line
      resume_in_single_line = line
      index_of_years_of_experience = resume_in_single_line.index("years")

      if index_of_years_of_experience
        text_around_years_of_experience = resume_in_single_line[index_of_years_of_experience-20, 40]
        years_of_experience = text_around_years_of_experience.match(/\d+/)[0]
      end
      puts years_of_experience
  end
end

Wukong::Script.new(ResumeExperienceMapper, nil).run
