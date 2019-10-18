class Shared::FieldErrors(T) < BaseComponent
  needs field : Avram::PermittedAttribute(T)

  # Customize the markup and styles to match your application
  def render
    unless @field.valid?
      div class: "error", flow_id: "#{@field.name}_error" do
        label_text = Wordsmith::Inflector.humanize(@field.name.to_s)
        text "#{label_text} #{@field.errors.first}"
      end
    end
  end
end
