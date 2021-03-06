require 'open-uri'
require 'yaml'
require 'net/http'
require 'uri'
require 'yaml'
require 'fileutils'

module Neurogami
  class GHIssues
    class << self

      # Maybe some prompts?
      def configure *args
 STDERR.puts( ":DEBUG #{__FILE__}:#{__LINE__}" ) if ENV['JAMES_SCA_JDEV_MACHINE'] # JGBDEBUG
        File.open('.ghissues', 'w') { |f|
        f.puts "owner:  RepoOwnerName
repo: repo-name
issues_cache_file: .ghcache/issues.yaml"
         }
      end

      def open *args
        nocache = args && args.first =~ /reload|refresh/i
        paged_issues  nocache
      end


      def create
        ARGV.clear
        print "Issue title:  "
        title = gets.strip
        print "Issue body:  "
        body = gets.strip
        create_issue title, body
      end

      private

      def read_config
        STDERR.puts( ":DEBUG #{__FILE__}:#{__LINE__}" ) if ENV['JAMES_SCA_JDEV_MACHINE'] # JGBDEBUG 
        begin
          @@config_file =  "#{Dir.pwd}/.ghissues"
          unless File.exist? @@config_file
            warn "You need to have config properties in #{@@config_file}"
            exit 
          end
          @@config = YAML.load IO.read(@@config_file)
        end
      end

      def config
        @@config ||= read_config
      end
      
      def create_issue title, body
        token = ENV['GH_AUTH_TOKEN']
        url = "http://github.com/api/v2/yaml/issues/open/#{config['owner']}/#{config['repo']}"
        res = Net::HTTP.post_form(URI.parse(url), {'title'=> title, 'body' => body, 'login' => config['owner'], 'token'=> token })
        if res.body.to_s.strip.empty?
          raise "There was problem creating the new issue: #{res.error!}"
        else
          warn "Posted issue\n" + res.body
        end
      end

      def ___
        warn "\n" + '_' * 30
      end

      def paged_issues no_cache = false
        ARGV.clear 
        warn "Hit enter after each issue to see the next one"
        
        # Yeah, this is some flow-control spooky code.  But it works! Do not try this at home. :)
        ( issues(no_cache) || (warn("No issues."); return ) ).each do |issue|
          ___    
          warn "Title: #{issue['title']}"
          warn "Details: \n#{issue['body']}"
          ___
          gets
        end
        warn "\nThat's it!"
      end


      def issues no_cache = false
        issues_cache =  config['issues_cache_file'] || 'issues.yaml'
        if no_cache || !File.exist?(issues_cache)
          warn "Reloading issues from GitHub ..."
          config_dir = File.dirname( File.expand_path(issues_cache) )
          FileUtils.mkdir_p config_dir unless File.exist?(config_dir)
          File.open(issues_cache, 'w'){ |f| f.puts get_issues }
        end
        YAML.load(IO.read(issues_cache))['issues']
      end

      def get_issues
        url = "http://github.com/api/v2/yaml/issues/list/#{config['owner']}/#{config['repo']}/open"
        issues =  Kernel.open(url).read
        raise "Failed to get issues" if issues.to_s.strip.empty?
        issues
      end


    end
  end
end
