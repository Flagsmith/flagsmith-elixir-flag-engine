defmodule Notifier.Email do
  import Bamboo.Email

  def notification do
    new_email(
      to: "ooskar1233@gmail.com",
      from: "noreply@notifier.app",
      subject: "Notification",
      text_body: "Very important content"
    )
  end
end
