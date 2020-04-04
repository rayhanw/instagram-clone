module DirectMessages
  class ShowPresenter < BasePresenter
    attr_reader :direct_message

    def initialize(direct_message)
      @direct_message = direct_message
    end

    def other_person
      @other_person ||= direct_message.other_person(h.current_user)
    end

    def other_person_username
      @other_person_username ||= other_person.username
    end

    def other_person_name
      @other_person_name ||= other_person.name
    end

    def messages
      @messages ||= direct_message.messages.with_author
    end

    def new_message
      @new_message ||= Message.new
    end
  end
end
