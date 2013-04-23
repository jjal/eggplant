Then /^I should download an Excel document$/ do
  assert_equal 'binary',                   page.response_headers['Content-Transfer-Encoding']
  assert_equal 'application/vnd.ms-excel', page.response_headers['Content-Type']
  assert_equal 'attachment',               page.response_headers['Content-Disposition']
  assert page.source.length > 0  # not ideal but better than nothing
end