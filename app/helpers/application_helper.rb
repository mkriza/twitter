# frozen_string_literal: true

module ApplicationHelper
  def user_avatar(user, size = '50px')
    if user.present? && user.avatar.attached?
      image_tag(user.avatar, width: size, height: size, class: 'rounded-circle')
    else
      image_tag('default_profile.png', width: size, height: size, class: 'rounded-circle')
    end
  end
end
