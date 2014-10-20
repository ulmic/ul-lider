class PageEditType < Page
  include ApplicationType

  permit :title, :body, :slug
end
