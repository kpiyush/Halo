#!/usr/bin/env ruby

require 'rubygems'
require 'wukong'

class LineMapper < Wukong::Streamer::LineStreamer

  def process line
    yield line
  end
end

Wukong::Script.new(LineMapper, nil).run
