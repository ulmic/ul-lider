Configus.build Rails.env do
  env :production do
    chrome_extension do
      url 'https://chrome.google.com/webstore/detail/%D1%8F-%D0%BB%D0%B8%D0%B4%D0%B5%D1%80/lehbmnengpcoaledhaodhjcmibleffmd/'
    end
    sites do
      year_2014 'http://2014.ul-lider.ru'
      ulmic 'http://ulmic.ru'
      this 'http://ul-lider.ru'
      ulnc 'http://ulnc.ru'
      ministry_of_edu 'http://mo73.ru/'
    end
    mailer do
      from "info@ul-lider.ru"
    end
    logos do
      ulmic do
        square 'https://raw.githubusercontent.com/ulmic/ulmicru/develop/app/assets/images/apps/logo-mic-square.png'
      end
    end

    host "ul-lider.ru"
    dates do
      start_of_filling "2015-11-16T00:00:00 +0300"
      #конец приёма заявок на конкурс
      end_of_filling "2016-02-01T00:00:00 +0300"
      #конец приёма заявок на Ярмарку идей
      end_of_filling_on_fair_idea "2015-02-10T00:00:00 +0300"
    end
    api do
      ulmic do
        host 'ulmic.ru'
      end
    end
    current_contest_year 2016
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
    api do
      ulmic do
        host 'localhost:3001'
      end
    end
  end

  env :test, parent: :development do
  end
end
