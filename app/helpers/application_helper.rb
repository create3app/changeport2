module ApplicationHelper

    def follow_buttons current_user, user
        if current_user.following?(user)
            return link_to('Unfollow', user_unfollow_path(user), :class => 'btn').html_safe
        else
            return link_to('Follow', user_follow_path(user), :class => 'btn').html_safe
        end
    end
end
