require 'newsletter_reader/version'
require 'gmail'
require 'mail'
require 'nokogiri'
require 'json'

require 'newsletter_reader/parser'
require 'newsletter_reader/link'

module NewsletterReader
  def self.newsletters
    gmail = Gmail.new(ENV['GMAIL_USERNAME'], ENV['GMAIL_PASSWORD'])
    parsed_links = gmail.label('newsletter').emails.each_with_object({}) do |email, links|
      mail = Mail.read_from_string email.message
      newsletter_name = mail['List-Id'].value[/(.+)</, 1].strip

      doc = Nokogiri::HTML(mail.html_part.body.decoded)

      newsletter_links = Parser.for(newsletter_name).parse(doc)

      links[newsletter_name] = newsletter_links
    end
    gmail.logout

    parsed_links.to_json
  end
end
