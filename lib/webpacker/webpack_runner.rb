require "shellwords"
require "webpacker/runner"

module Webpacker
  class WebpackRunner < Webpacker::Runner
    def run
      env = { "NODE_PATH" => @node_modules_path.shellescape }
      cmd = [ "#{@node_modules_path}/.bin/webpack", "--config", @webpack_config, "--info-verbosity", "verbose", "--verbose" ] + @argv

      Dir.chdir(@app_path) do
        exec env, *cmd
      end
    end
  end
end
