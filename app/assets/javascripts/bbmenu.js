$(document).ready(function() {
  // Rather than fix sprockets loading at 5:30am, let's
  // just do a conditional jQuery test for a hidden element!
  if($('#menusassurances').size() > 0) {

    var Assurance = Backbone.Model.extend({
      initialize: function() {
        this.set("selected", false);
      },
      toggle_select: function() {
        this.set("selected", !this.get("selected"));
      }
    });
    var AssuranceGroup = Backbone.Collection.extend({
      model: Assurance,
      url: $.trim($('#menusassurances').text())
    });
    var AssuranceView = Backbone.View.extend({
      initialize: function() {
        this.template = Handlebars.compile($("#assurance-view").html());
        this.$el.html(this.template(this.model.attributes));
        this.insert();
      },
      events: {
        "click": "toggle_select"
      },
      insert: function() {
        $(".menu-sidebar").append(this.$el);
      },
      render: function() {
        this.$el.html(this.template(this.model.attributes));
        return this;
      },
      toggle_select: function() {
        this.model.toggle_select();
        this.render();
      }
    });

    var assurance_group = new AssuranceGroup();

    assurance_group.fetch({
      success: function() { 
        assurance_group.forEach(function(assurance) {
          new AssuranceView({ model: assurance });
        });
      }
    });


    var Food = Backbone.Model.extend({});

    var Menu = Backbone.Collection.extend({
      model: Food,
      url: $.trim($('#menusfoods').text())
    });

    var FoodView = Backbone.View.extend({
      initialize: function() {
        this.template = Handlebars.compile($("#food-view").html());
        this.$el.html(this.template(this.model.attributes));
        $(this.$el).addClass("food-blurb");
        this.insert();
      },
      insert: function() {
        $(".col-md-9").append(this.$el);
      }
    });

    var menu = new Menu();

    menu.fetch({
      success: function() { 
        menu.forEach(function(food) {
          new FoodView({ model: food });
        });
      }
    });
  }
});
