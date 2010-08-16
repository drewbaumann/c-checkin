module MembersHelper
  def plan_select_for(member)
    options = select_tag :plan_id, options_for_select([["--Select A Plan--",'']]+
                                                Plan.all.map{|p| [p.name,p.id]},
                                                member.primary_plan_id)
    select_tag :plan_id, options
  end
end
