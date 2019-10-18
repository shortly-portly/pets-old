class Owners::EditPage < MainLayout
    needs save_owner : SaveOwner
    needs owner : Owner
  
    def content
      render_form(@save_owner)
    end
  
    private def render_form(so)

      form_for Owners::Update.with(@owner.id) do
        mount Shared::Field.new(so.first_name)
        mount Shared::Field.new(so.last_name)
        mount Shared::Field.new(so.age)
  
        submit "Update Owner", flow_id: "update-owner"
      end
    end
  end
  