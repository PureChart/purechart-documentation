#require 'github/markup'
#require 'uri'

#require 'commonmarker'

class ArticlesController < ApplicationController
  class HTMLwithPygments < Redcarpet::Render::HTML
      def block_code(code, language)
          Pygments.highlight(code, lexer: language)
      end
  end

  def markdown(text)
      renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)

      options = {
          autolink: true,
          no_intra_emphasis: true,
          fenced_code_blocks: true,
          lax_html_blocks: true,
          strikethrough: true,
          superscript: true,
      }
      
      Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def index
    @parent_path = request.path
    puts "PATH = " + @parent_path
  end

  def open_article
    title = Rails.root.to_s + "/app/markdown/" + params[:title] + ".md"
    @content = markdown(File.read(title))
  end

  def show

  end
end
