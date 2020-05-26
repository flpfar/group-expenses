module ExpensesHelper
  def index_title(type)
    case type
    when :external then title = 'All my external expenses'
    when :group then title = 'Group expenses'
    when :all then title = 'All my expenses'
    end
    title
  end
end
