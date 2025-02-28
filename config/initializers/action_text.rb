ActiveSupport.on_load(:action_text_rich_text) do
  class ActionText::RichText < ActionText::Record
    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "locale", "name", "record_id", "record_type", "updated_at", "body"]
    end
  end
end