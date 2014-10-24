Configus.build Rails.env do
  env :production do
    chrome_extension do
      url 'https://chrome.google.com/webstore/detail/%D1%8F-%D0%BB%D0%B8%D0%B4%D0%B5%D1%80/lehbmnengpcoaledhaodhjcmibleffmd/'
    end
    sites do
      year_2014 'http://2014.ul-lider.ru'
    end
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
