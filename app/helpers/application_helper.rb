module ApplicationHelper
  include ActionView::Helpers::DateHelper

  def minutes_in_words(minutes)
    distance_of_time_in_words(Time.at(0), Time.at(minutes * 60))
  end

  def days_in_words(days)
    minutes_in_words(days * 24 * 60)
  end

  def markdown(text)
    options = {hard_wrap: true, autolink: true, fenced_code: true, fenced_code_blocks: true, gh_blockcode: true, tables: true}
    renderer = PygmentizeHTML # Redcarpet::Render::HTML.new(options)
    md = Redcarpet::Markdown.new(renderer, options)
    md.render(text).html_safe
    #syntax_highlighter(md.render(text)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end

  def time_ago(date)
    (Date::today - date).try(:days) > 0 ? time_ago_in_words( date ) + ' ago' : 'currently using'
  end

  def format_date(date)
    date.strftime('%m/%Y') if date.is_a? Date
  end

  def duration_in_words (since, till)
    days_in_words( (till || Date::today()) - since )
  end

  def title(text = nil)
    @headers ||= []
    @headers.push text if text.present?
    @site_title = @headers.join(' - ')
  end

  class PygmentizeHTML < Redcarpet::Render::HTML
    def block_code(code, language)
      require 'pygmentize'
      Pygmentize.process(code, language)
    end
  end

end
