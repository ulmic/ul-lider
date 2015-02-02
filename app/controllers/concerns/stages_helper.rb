module Concerns
  module StagesHelper
    def filling_is_during?
      DateTime.now < configus.dates.end_of_filling
    end
    def filling_on_fair_idea_is_during?
      DateTime.now < configus.dates.end_of_filling_on_fair_idea
    end
  end
end
