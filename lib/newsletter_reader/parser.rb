require 'newsletter_reader/parsers/pretty_good_weekly_parser'

module NewsletterReader
  class Parser
    PARSERS = {
      "Pretty Good Weekly" => Parsers::PrettyGoodWeeklyParser
    }

    def self.for(newsletter_name)
      PARSERS[newsletter_name].new
    end
  end
end
