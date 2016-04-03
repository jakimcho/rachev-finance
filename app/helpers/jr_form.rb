class JRForm < ActionView::Helpers::FormBuilder
  def monetary_field(objname, value, classes)
    text_field "#{objname}", :value => ("%0.2f" % value), class: classes, :size => 6
  end
end 