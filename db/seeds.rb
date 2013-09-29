require 'active_record/fixtures'

def load_fixture(name)
  ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/spec/fixtures", name)
end

["organizations", "menus", "foods", "assurances"].each { |name| load_fixture(name) }