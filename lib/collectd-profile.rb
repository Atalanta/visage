#!/usr/bin/env ruby

require 'yaml'

class CollectdProfile

  def initialize(opts={})
    @profile = opts[:profile]
  end

  def graphs
    @profile
  end

  class << self

    attr_accessor :config_filename

    def get(id)
      id.gsub!(/\s+/, '+')
      if @config_filename && File.exists?(@config_filename)
        config = YAML::load(File.read(@config_filename))
        CollectdProfile.new(:profile => config['data_profiles'][id])
      end
    end

  end

end
