class NewsEditType < News
  include ApplicationType

  permit :title, :body, :published_at, :photo

  def body=(body)
    write_attribute(:body, body)
  end
end
