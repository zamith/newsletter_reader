module NewsletterReader
  class Link
    attr_reader :href, :content

    def initialize(href:, content:)
      @href = href
      @content = content
    end

    def to_json(*args)
      {
        href: href,
        content: content
      }.to_json(*args)
    end
  end
end
