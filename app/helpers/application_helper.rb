module ApplicationHelper

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def gravatar_for(user, size = 48)
    gravatar_id = Digest::MD5.hexdigest(user.email)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end