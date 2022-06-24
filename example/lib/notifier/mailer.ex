defmodule Notifier.Mailer do
  require Logger
  use Bamboo.Mailer, otp_app: :notifier

  def send_notification do
    if send?() == true do
      Notifier.Email.notification()
      |> deliver_now()
    else
      Logger.debug("Not sending notification - feature disabled!")
    end
  end

  defp send? do
    Flagsmith.Client.is_feature_enabled("notification")
  end
end
