module ExpensesHelper
  def index_title(type)
    case type
    when :external then title = 'All my external expenses'
    when :group then title = 'Group expenses'
    when :all then title = 'All my expenses'
    end
    title
  end

  def add_expense_button(type, group_id)
    return link_to 'Add expense', new_user_expense_path(current_user.id), class: 'new-btn' unless type == :group

    link_to 'Add expense', new_user_expense_path(current_user.id, type: type.to_s, group_id: group_id), class: 'new-btn'
  end

  def image_url_chooser(type, expense, group_id)
    url = if type == :group
            Group.find(group_id).icon
          elsif expense.groups.first
            expense.groups.first.icon
          else
            'https://cdn4.iconfinder.com/data/icons/stop-virus-outline-iconset/128/ic_gathering-512.png'
          end
  end

  def show_select_group(form, group_id, groups)
    return form.hidden_field :group, value: group_id unless group_id.zero?

    form.select :group, (groups.map { |g| [g.name, g.id] }).unshift(['No group', -1])
  end
end
