require "ruboty/no_more_bocchi/actions/no_more_bocchi"

module Ruboty
  module Handlers
    class NoMoreBocchi < Base
      on /no more bocchi ?(?<group_count>.+)? groups ?(?<people>.+)?/, name: 'no_more_bocchi', description: 'TODO: write your description'

      def no_more_bocchi(message)
        Ruboty::NoMoreBocchi::Actions::NoMoreBocchi.new(message).call
      end
    end
  end
end
