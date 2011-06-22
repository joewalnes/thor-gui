#!/usr/bin/env ruby1.9

require 'sinatra'
require 'json'
require 'thor/runner'

# Overrides standard Thor Runner (which already has everything
# in place to list all the available tasks) and just stops
# it dumping anything to the console.
class QuietThorRunner < Thor::Runner
  no_tasks do
    def display_tasks(namespace, list)
      # be quiet
    end
  end
end

# Convert the tasks returned by Thor::Runner.list into a
# JSON structure that can drive GCLI
def thor_tasks_to_gcli_json(tasks)
  { 
    :cmds => tasks.map {|group| 
      prefix = group[0] == 'root' ? '' : (group[0] + ':')
      group[1].map {|cmd| 
        {
          :name => prefix + cmd[0].gsub(/^.+? /, '').gsub(/ .*/, ''),
          :description => cmd[1].gsub(/^# /, ''),
          :params => [], # TODO
          :returnType => 'string'
        }
      }
    }.flatten
  }
end

get '/thor-metadata.json' do
  content_type :json
  thor_tasks_to_gcli_json(QuietThorRunner.new.list).to_json
end

get '/' do
  redirect '/index.html'
end

