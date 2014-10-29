class PageEditType < Page
  include ApplicationType

  permit :title, :body, :slug, :view
end
