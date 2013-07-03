class User < ActiveRecord::Base
  has_many :skills, through: :skill_users
  has_many :skill_users

  def proficiency_for(skill)
    user = self.skill_users.where(skill_id: skill.id).first
    user.blank? ? 0 : user.proficiency 
  end

  def set_proficiency_for(skill, value)
    user = self.skill_users.where(skill_id: skill.id).first
    user.update_attributes(proficiency: value)
  end
 
end
