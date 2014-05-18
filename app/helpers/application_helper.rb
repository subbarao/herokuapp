module ApplicationHelper
  def with_party_info(candidate)
    "#{candidate.candidate} (#{candidate.party.name})"
  end
end
