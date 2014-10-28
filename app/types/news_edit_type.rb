class NewsEditType < News
  include ApplicationType

  permit :title, :body, :published_at, :photo
end
