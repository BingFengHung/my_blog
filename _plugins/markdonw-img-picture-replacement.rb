
# Description: Jekyll plugin to replace Markdown image syntax with {% picture %} tag for crafting responsive images
# place in /_plugins/

Jekyll::Hooks.register :documents, :pre_render do |document, payload|
  docExt = document.extname.tr('.', '')
  # only process if we deal with a markdown file
  if payload['site']['markdown_ext'].include? docExt
		#newContent = document.content.tr('../assets', '{{site.url}}/assets')
		newContent = document.content.gsub('/../assets/', '{{site.url}}/assets')
    newContent = document.content.gsub(/!\[(.*)\]\(([^\)]+)\)(?:{:([^}]+)})*/, '{% picture default \2 --alt \1  %}')
    document.content = newContent
  end
end