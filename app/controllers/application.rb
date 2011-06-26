class ApplicationController < ActionController::Base
  include ExceptionNotifiable
end
ExceptionNotifier.exception_recipients = %w(rff_rff@yahoo.it)
