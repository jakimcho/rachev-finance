class JRForm < ActionView::Helpers::FormBuilder
  def monetary_field(objname, value)
    text_field "#{objname}", :value => ("%0.2f" % value), :size => 6
  end
end 