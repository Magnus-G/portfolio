helpers do
  def auto_image_tag(filename, alt_text = nil)
    # Use provided alt text or generate from filename
    if alt_text.nil?
      alt_text = generate_alt_text(filename)
    end
    image_tag(filename, alt: alt_text)
  end

  private

  def generate_alt_text(filename)
    # Improved alt text generation with project-specific descriptions
    project_descriptions = {
      'mindler-concept1' => 'Mindler social anxiety app concept interface design',
      'aerocrine2' => 'Aerocrine Niox Vero medical device project showcase',
      '6_3' => 'Future healthcare concept design by Veryday',
      'insight-pump2' => 'Roche Diagnostics insulin pump interface design',
      '34' => 'Swegon air handling unit interface design project',
      '39_2' => 'ITT Flygt pump station interface design',
      '29_6' => 'Sonicspree music game design by Veryday',
      '27' => 'Spotify design project showcase',
      'mindler' => 'Mindler company logo',
      'tvnu' => 'TV.nu company logo',
      'nyarp' => 'Nyarp company logo',
      'adlibris' => 'Adlibris company logo'
    }

    filename_without_ext = filename.gsub(File.extname(filename), '')
    
    # Return specific description if available, otherwise generate generic one
    project_descriptions[filename_without_ext] || 
      "#{filename_without_ext.gsub(/[-_]/, ' ').split.map(&:capitalize).join(' ')} project image"
  end
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

activate :relative_assets
set :relative_links, true

# GitHub Pages deployment will be handled manually