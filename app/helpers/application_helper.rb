module ApplicationHelper

  def create_link( title, url, options = {} )
    link_to( title, url, options )
  end

  def create_links( links = {} )
    links.map { |k,v| content_tag :li, create_link( k, v[:url], v[:options ] ) }.join
  end

  def link_list( links = {} )
    content_tag :ul, ( create_links( links ).html_safe )
  end

  def edit_destroy_links( resource )
    return '' unless current_admin
    resource_name = pluralize(2, resource.class.to_s.downcase ).split()[1]
    edit_url      = "/#{resource_name}/#{resource.id}/edit"
    destroy_url   = "/#{resource_name}/#{resource.id}"

    link_list(
      'Edit'    => { url: edit_url },
      'Destroy' => { url: destroy_url, options: { method: :delete } }
    )

  end

end
