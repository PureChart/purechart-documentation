#require 'github/markup'
#require 'uri'

#require 'commonmarker'

class ArticlesController < ApplicationController
  class HTMLwithPygments < Redcarpet::Render::HTML
      def block_code(code, language)
        puts code
        result = Pygments.highlight(code, lexer: language)
        result = "<div class=\"code-block\">
          #{result}
          <button class=\"clipboard-button\" onclick=\"
            parent = this.parentElement;
            content = parent.getElementsByClassName('highlight')[0].textContent;
            navigator.clipboard.writeText(content);
          \">📋</button>
        </div>"
        result
        
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
    puts File.basename(Dir.getwd)
    @nav_tree = walk("./app/markdown", "")
    puts @nav_tree
  end

  def titleize(name)
    lowercase_words = %w{a an the and but or for nor of}
    name.split.each_with_index.map{|x, index| lowercase_words.include?(x) && index > 0 ? x : x.capitalize }.join(" ")
  end

  def walk(start, parent)
    temp_hash = {}

    Dir.foreach(start) do |x|
      path = File.join(start, x)
      if x == "." or x == ".."
        next
      elsif File.directory?(path)
        # puts path + "/" # remove this line if you want; just prints directories
        name = titleize(x.gsub('-', ' '))
        temp_hash[name] = walk(path, parent + "_" + x)
      else
        # Convert path to name
        name = titleize(x[0..-4].gsub('-', ' '))

        temp_hash[name] = parent + '_' + x[0..-4]

        if parent == ""
          temp_hash[name] = name
        end
      end
    end

    temp_hash
  end

  def open_article
    title = Rails.root.to_s + "/app/markdown/" + params[:title].gsub('_', '/') + ".md"
    @content = markdown(File.read(title))
  end

  def show

  end
end
