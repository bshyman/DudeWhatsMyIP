module ApplicationHelper
	def image_submit_tag(source, options = {})
        options = options.stringify_keys
        tag :input, { "alt" => image_alt(source), "type" => "image", "src" => path_to_image(source) }.update(options)
      end

     
end
