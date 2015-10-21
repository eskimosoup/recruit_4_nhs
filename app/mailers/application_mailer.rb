class ApplicationMailer < ActionMailer::Base

  def site_email
    @site_email = begin
      site_setting = Optimadmin::SiteSetting.where(environment: Rails.env).find_by(key: "Email")
      if site_setting
        site_setting.value
      else
        "support@optimised.today"
      end
    end
  end

  default from: site_email
  layout "mailer"

  def application_created(global_site_settings, application)
    @site_settings = global_site_settings
    @application = application
    attachments[File.basename(@application.cv.path)] = File.read(@application.cv.path) if @application.cv.present?
    mail from: @site_settings['Email'], to: @site_settings['Email'], subject: "Application form completed #{ @site_settings['Name'] }"
  end

  def site_name
    @site_name = begin
      site_setting = Optimadmin::SiteSetting.where(environment: Rails.env).find_by(key: "Name")
      if site_setting
        site_setting.value
      else
        "Optimised"
      end
    end
  end
end
