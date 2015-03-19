ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
:address => "smtp-mail.outlook.com",
:port => 587,
:domain => "outlook.com",
:user_name => "sunil.prajapati590@outlook.com",
:password => "sunilaA2@",
:authentication => "plain",
:enable_starttls_auto => true
}
