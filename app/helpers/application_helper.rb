module ApplicationHelper
  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Rails Feed"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # 日付をJSTに変換
  def time_zone_jst(date, ymd = false)
    d = date.in_time_zone('Tokyo')
    if ymd
      d.strftime('%Y-%m-%d')
    else
      d.strftime('%Y-%m-%d %H:%M')
    end
  end

  def user_image_path(user)
    if user.image?
      path = user.image.url
    else
      path = "profile/img_profile_default.png"
    end
  end
end
