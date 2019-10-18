class Owners::NewPage < MainLayout
  needs save_owner : SaveOwner

  def content
    render_form(@save_owner)
  end

  private def render_form(so)
    form_for Owners::Create do
      mount Shared::Field.new(so.first_name)
      mount Shared::Field.new(so.last_name)
      mount Shared::Field.new(so.age)

      submit "Create Owner", flow_id: "create-owner"
    end
  end
end
