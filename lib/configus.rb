Configus.build Rails.env do
  env :production do

    mailer do
      from "info@ul-lider.ru"
    end

    host "ul-lider.ru"
  end

  env :staging, parent: :production do
    mailer do
      from "info@ul-lider.ru"
    end

    host "ul-lider.ru"

    basic_auth do
      username "user"
      password "staging"
    end
  end

  env :development, parent: :staging do
  end

  env :test, parent: :development do
  end
end
