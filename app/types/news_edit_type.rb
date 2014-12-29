class NewsEditType < News
  include ApplicationType
  include KaramzinHelper

  permit :title, :body, :published_at, :photo

  def body=(body)
    write_attribute(:body, insert(body))
  end
end
