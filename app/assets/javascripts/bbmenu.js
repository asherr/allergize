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
      url: $.trim($('#menusassurances').text()),
      selected_ids: function() {
        var ids = [];
        this.forEach(function(assurance) {
          if(assurance.get("selected")) {
            ids.push(assurance.get("id"));
          }
        });
        return ids;
      }
    });
    var AssuranceView = Backbone.View.extend({
      initialize: function() {
        this.template = Handlebars.compile($("#assurance-view").html());
        this.insert();
      },
      events: {
        "click": "toggle_select"
      },
      insert: function() {
        this.render();
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


    var Food = Backbone.Model.extend({
      initialize: function() {
        _.bindAll(this, "check_validity");
        assurance_group.on("change", this.check_validity);
        this.set("valid", true);
      },
      check_validity: function() {
                        // alert("wep");
        ids = assurance_group.selected_ids();
        food_ids = _.map(this.get("assurances"), function(a) { return a["id"]; })
        if(_.intersection(ids, food_ids).length < ids.length)
          this.set("valid", false);
        else
          this.set("valid", true);
      }
    });

    var Menu = Backbone.Collection.extend({
      model: Food,
      url: $.trim($('#menusfoods').text())
    });

    var FoodView = Backbone.View.extend({
      initialize: function() {
        _.bindAll(this, "render");
        this.template = Handlebars.compile($("#food-view").html());
        this.insert();
        this.model.on("change", this.render);
      },
      insert: function() {
        this.render();
        $(this.$el).addClass("food-blurb");
        $("#food-list").append(this.$el);
      },
      render: function() {
        this.$el.html(this.template(this.model.attributes));
        if(this.model.get("valid"))
          $(this.$el).show();
        else
          $(this.$el).hide();
      }
    });

    var menu = new Menu();

    menu.fetch({
      success: function() { 
        menu.forEach(function(food) {
          var view = new FoodView({ model: food });
        });
      }
    });
  }
});
