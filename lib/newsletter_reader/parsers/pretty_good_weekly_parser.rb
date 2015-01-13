module NewsletterReader
  module Parsers
    class PrettyGoodWeeklyParser
      USELESS_LINKS = [
        'Pretty Good Weekly',
        'Unsubscribe',
        ENV['GMAIL_USERNAME']
      ]

      def parse(html_doc)
        @html_doc = html_doc
        html_doc.css('a').each_with_object([]) do |link, links|
          if actual_link?(link)
            links << Link.new(href: link['href'], content: link.content)
          end
        end.compact
      end

      private

      attr_reader :html_doc

      def actual_link?(link)
        content = link.content.strip

        !content.empty? && !USELESS_LINKS.include?(content)
      end
    end
  end
end
