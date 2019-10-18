class Owners::IndexPage < MainLayout
  needs owners : Array(Owner)

  def content
    table do
      header ["id", "First Name", "Last Name", "Age", "", ""]

      @owners.each do |owner|
        row(owner)
      end
    end

    link "New", to: Owners::New, flow_id: "new-owner-button"
  end

  private def header(header_labels)
    thead do
      tr do
        header_labels.each do |label|
          th label
        end
      end
    end
  end

  private def row(owner)
    tr do
      td owner.first_name, flow_id: "first_name"
      td owner.last_name, flow_id: "last-name"
      td owner.age, flow_id: "age"
      td do 
        link "Edit", to: Owners::Edit.with(owner.id), flow_id: "edit-owner"
      end
      td do
        link "Delete", to: Owners::Delete.with(owner.id), flow_id: "delete-owner"
      end
    end
  end
end
