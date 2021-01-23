require_relative 'item'
require_relative 'controller'
require_relative 'view'
require_relative 'repository'
require_relative 'router'

new_repo = Repository.new
new_view = View.new
new_control = Controller.new(new_repo, new_view)
router = Router.new(new_control)

router.run_shopping
