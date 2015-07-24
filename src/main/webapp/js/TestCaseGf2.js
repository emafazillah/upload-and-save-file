/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var strresult = "";

var app = {
    // Create this closure to contain the cached modules
    module: function () {
        // Internal module cache.
        var modules = {};

        // Create a new module reference scaffold or load an
        // existing module.
        return function (name) {
            // If this module has already been created, return it.
            if (modules[name]) {
                return modules[name];
            }

            // Create a module and save it under this name
            return modules[name] = {Views: {}};
        };
    }()
};

(function (models) {

// Model for Testcasetxn2 entity
    models.Testcasetxn2 = Backbone.Model.extend({
        urlRoot: "http://testcase2-emafazillahphp.rhcloud.com/api/testcasetxn2/",
        idAttribute: 'id',
        defaults: {
            weightage3: "",
            testedFunction: "",
            weightage1: "",
            weightage2: "",
            weightage: "",
            functionInput: "",
            functionExpectedOutput: "",
            functionStatus: ""
        },
        toViewJson: function () {
            var result = this.toJSON(); // displayName property is used to render item in the list
            result.displayName = this.get('id');
            strresult += JSON.stringify(result) + ",";
            $('input:hidden[name=strjson]').val(strresult);            
            return result;
        },
        isNew: function () {
            // default isNew() method imlementation is
            // based on the 'id' initialization which
            // sometimes is required to be initialized.
            // So isNew() is rediefined here
            return this.notSynced;
        },
        sync: function (method, model, options) {
            options || (options = {});
            var errorHandler = {
                error: function (jqXHR, textStatus, errorThrown) {
                    // TODO: put your error handling code here
                    // If you use the JS client from the different domain
                    // (f.e. locally) then Cross-origin resource sharing 
                    // headers has to be set on the REST server side.
                    // Otherwise the JS client has to be copied into the
                    // some (f.e. the same) Web project on the same domain
                    alert('Unable to fulfil the request');
                }}

            if (method == 'create') {
                options.url = 'http://testcase2-emafazillahphp.rhcloud.com/api/testcasetxn2/';
            }
            var result = Backbone.sync(method, model, _.extend(options, errorHandler));
            return result;
        }


    });


    // Collection class for Testcasetxn2 entities
    models.Testcasetxn2Collection = Backbone.Collection.extend({
        model: models.Testcasetxn2,
        url: "http://testcase2-emafazillahphp.rhcloud.com/api/testcasetxn2/",
        sync: function (method, model, options) {
            options || (options = {});
            var errorHandler = {
                error: function (jqXHR, textStatus, errorThrown) {
                    // TODO: put your error handling code here
                    // If you use the JS client from the different domain
                    // (f.e. locally) then Cross-origin resource sharing 
                    // headers has to be set on the REST server side.
                    // Otherwise the JS client has to be copied into the
                    // some (f.e. the same) Web project on the same domain
                    alert('Unable to fulfil the request');
                }}

            var result = Backbone.sync(method, model, _.extend(options, errorHandler));
            return result;
        }
    });


})(app.module("models"));

(function (views) {

    views.ListView = Backbone.View.extend({
        tagName: 'tbody',
        initialize: function (options) {
            this.options = options || {};
            this.model.bind("reset", this.render, this);
            var self = this;
            this.model.bind("add", function (modelName) {
                var row = new views.ListItemView({
                    model: modelName,
                    templateName: self.options.templateName
                }).render().el;
                $(self.el).append($(row));
            });
        },
        render: function (eventName) {
            var self = this;
            _.each(this.model.models, function (modelName) {
                $(this.el).append(new views.ListItemView({
                    model: modelName,
                    templateName: self.options.templateName
                }).render().el);
            }, this);
            return this;
        }
    });

    views.ListItemView = Backbone.View.extend({
        tagName: "tr",
        initialize: function (options) {
            this.options = options || {};
            this.model.bind("change", this.render, this);
            this.model.bind("destroy", this.close, this);
        },
        template: function (json) {
            /*
             *  templateName is element identifier in HTML
             *  $(this.options.templateName) is element access to the element
             *  using jQuery 
             */
            return _.template($(this.options.templateName).html())(json);
        },
        render: function (eventName) {
            $(this.el).html(this.template(this.model.toViewJson()));
            return this;
        },
        close: function () {
            $(this.el).unbind();
            $(this.el).remove();
        }

    });

    views.ModelView = Backbone.View.extend({
        initialize: function (options) {
            this.options = options || {};
            this.model.bind("change", this.render, this);
        },
        render: function (eventName) {
            $(this.el).html(this.template(this.model.toViewJson()));
            return this;
        },
        template: function (json) {
            /*
             *  templateName is element identifier in HTML
             *  $(this.options.templateName) is element access to the element
             *  using jQuery 
             */
            return _.template($(this.options.templateName).html())(json);
        },
        /*
         *  Classes "save"  and "delete" are used on the HTML controls to listen events.
         *  So it is supposed that HTML has controls with these classes.
         */
        events: {
            "change input": "change",
            "click .save": "save",
            "click .delete": "drop",
            "click input[type=checkbox]": "onCheckboxClick"
        },
        change: function (event) {
            var target = event.target;
            console.log('changing ' + target.id + ' from: ' + target.defaultValue + ' to: ' + target.value);
        },
        save: function () {
            // TODO : put save code here
            var hash = this.options.getHashObject();
            this.model.set(hash);
            if (this.model.isNew() && this.collection) {
                var self = this;
                this.collection.create(this.model, {
                    success: function () {
                        // see isNew() method implementation in the model
                        self.model.notSynced = false;
                        self.options.navigate(self.model.id);
                    }
                });
            } else {
                this.model.save();
            }
            return false;
        },
        drop: function () {
            this.model.destroy({
                success: function () {
                    /*
                     *  TODO : put your code here
                     *  f.e. alert("Model is successfully deleted");
                     */
                    window.history.back();
                }
            });
            return false;
        },
        onCheckboxClick: function () {
            var total = 0;
            var countcheck = 0;
            $('input:checkbox[name=weightageval]:checked').each(function () {
                total += +this.value;
                countcheck = countcheck + 1;
            });
            switch (total) {
                case 6:
                    $('input:hidden[name=weightage3]').val("checked");
                    $('input:hidden[name=weightage2]').val("checked");
                    $('input:hidden[name=weightage1]').val("checked");
                    break;
                case 5:
                    $('input:hidden[name=weightage3]').val("checked");
                    $('input:hidden[name=weightage2]').val("checked");
                    $('input:hidden[name=weightage1]').val("");
                    break;
                case 4:
                    $('input:hidden[name=weightage3]').val("checked");
                    $('input:hidden[name=weightage2]').val("");
                    $('input:hidden[name=weightage1]').val("checked");
                    break;
                case 3:
                    if(countcheck === 1){
                        $('input:hidden[name=weightage3]').val("checked");
                        $('input:hidden[name=weightage2]').val("");
                        $('input:hidden[name=weightage1]').val("");
                    }else{
                        $('input:hidden[name=weightage3]').val("");
                        $('input:hidden[name=weightage2]').val("checked");
                        $('input:hidden[name=weightage1]').val("checked");
                    }
                    break;
                case 2:
                    $('input:hidden[name=weightage3]').val("");
                    $('input:hidden[name=weightage2]').val("checked");
                    $('input:hidden[name=weightage1]').val("");
                    break;
                case 1:
                    $('input:hidden[name=weightage3]').val("");
                    $('input:hidden[name=weightage2]').val("");
                    $('input:hidden[name=weightage1]').val("checked");
                    break;
                default:
                    $('input:hidden[name=weightage3]').val("");
                    $('input:hidden[name=weightage2]').val("");
                    $('input:hidden[name=weightage1]').val("");
                    break;
            }
            $('input:hidden[name=weightage]').val(total);
            if (total > 0) {
                $('input:hidden[name=functionStatus]').val("Updated");
            } else {
                $('input:hidden[name=functionStatus]').val("");
            }
            return total;
        },
        close: function () {
            $(this.el).unbind();
            $(this.el).empty();
        }
    });

    // This view is used to create new model element
    views.CreateView = Backbone.View.extend({
        initialize: function (options) {
            this.options = options || {};
            this.render();
        },
        render: function (eventName) {
            $(this.el).html(this.template());
            return this;
        },
        template: function (json) {
            /*
             *  templateName is element identifier in HTML
             *  $(this.options.templateName) is element access to the element
             *  using jQuery 
             */
            return _.template($(this.options.templateName).html())(json);
        },
        /*
         *  Class "new" is used on the control to listen events.
         *  So it is supposed that HTML has a control with "new" class.
         */
        events: {
            "click .new": "create"
        },
        create: function (event) {
            this.options.navigate();
            return false;
        }
    });

})(app.module("views"));


$(function () {
    var models = app.module("models");
    var views = app.module("views");

    var AppRouter = Backbone.Router.extend({
        routes: {
            '': 'list',
            'new': 'create',
            ':id': 'details'
        },
        initialize: function () {
            /*
            var self = this;
            $('#header').html(new views.CreateView({
                // tpl-create is template identifier for 'create' block
                templateName: '#tpl-create',
                navigate: function () {
                    self.navigate('new', true);
                }
            }).render().el);
            */
        },
        list: function () {
            this.collection = new models.Testcasetxn2Collection();
            var self = this;
            this.collection.fetch({
                success: function () {
                    self.listView = new views.ListView({
                        model: self.collection,
                        // tpl-testcasetxn2-list-itemis template identifier for item
                        templateName: '#tpl-testcasetxn2-list-item'
                    });
                    $('#datatable').html(self.listView.render().el).append(_.template($('#theader').html())()).append(_.template($('#tfooter').html())());
                    if (self.requestedId) {
                        self.details(self.requestedId);
                    }
                    // Tablesorting
                    // NOTE: $.tablesorter.theme.bootstrap is ALREADY INCLUDED in the jquery.tablesorter.widgets.js
                    // file; it is included here to show how you can modify the default classes
                    $.tablesorter.themes.bootstrap = {
                        // these classes are added to the table. To see other table classes available,
                        // look here: http://getbootstrap.com/css/#tables
                        table: 'table table-bordered table-striped',
                        caption: 'caption',
                        // header class names
                        header: 'bootstrap-header', // give the header a gradient background (theme.bootstrap_2.css)
                        sortNone: '',
                        sortAsc: '',
                        sortDesc: '',
                        active: '', // applied when column is sorted
                        hover: '', // custom css required - a defined bootstrap style may not override other classes
                        // icon class names
                        icons: '', // add "icon-white" to make them white; this icon class is added to the <i> in the header
                        iconSortNone: 'bootstrap-icon-unsorted', // class name added to icon when column is not sorted
                        iconSortAsc: 'icon-chevron-up glyphicon glyphicon-chevron-up', // class name added to icon when column has ascending sort
                        iconSortDesc: 'icon-chevron-down glyphicon glyphicon-chevron-down', // class name added to icon when column has descending sort
                        filterRow: '', // filter row class
                        footerRow: '',
                        footerCells: '',
                        even: '', // even row zebra striping
                        odd: ''  // odd row zebra striping
                    };

                    // call the tablesorter plugin and apply the uitheme widget
                    $("table").tablesorter({
                        // this will apply the bootstrap theme if "uitheme" widget is included
                        // the widgetOptions.uitheme is no longer required to be set
                        theme: "bootstrap",
                        widthFixed: true,
                        headerTemplate: '{content} {icon}', // new in v2.7. Needed to add the bootstrap icon!

                        // widget code contained in the jquery.tablesorter.widgets.js file
                        // use the zebra stripe widget if you plan on hiding any rows (filter widget)
                        widgets: ["uitheme", "filter", "zebra"],
                        widgetOptions: {
                            // using the default zebra striping class name, so it actually isn't included in the theme variable above
                            // this is ONLY needed for bootstrap theming if you are using the filter widget, because rows are hidden
                            zebra: ["even", "odd"],
                            // reset filters button
                            filter_reset: ".reset"

                                    // set the uitheme widget to use the bootstrap theme class names
                                    // this is no longer required, if theme is set
                                    // ,uitheme : "bootstrap"

                        }
                    })
                            .tablesorterPager({
                                // target the pager markup - see the HTML block below
                                container: $(".ts-pager"),
                                // target the pager page select dropdown - choose a page
                                cssGoto: ".pagenum",
                                // remove rows from the table to speed up the sort of large tables.
                                // setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
                                removeRows: false,
                                // output string - default is '{page}/{totalPages}';
                                // possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
                                output: '{startRow} - {endRow} / {filteredRows} ({totalRows})'

                            });
                    // Tablesorting                    
                }
            });
        },
        details: function (id) {
            if (this.collection) {
                this.testcasetxn2 = this.collection.get(id);
                if (this.view) {
                    this.view.close();
                }
                var self = this;
                this.view = new views.ModelView({
                    model: this.testcasetxn2,
                    // tpl-testcasetxn2-details is template identifier for chosen model element
                    templateName: '#tpl-testcasetxn2-details',
                    getHashObject: function () {
                        return self.getData();
                    }
                });
                $('#content').html(this.view.render().el);
            } else {
                this.requestedId = id;
                this.list();
            }
        },
        create: function () {
            if (this.view) {
                this.view.close();
            }
            var self = this;
            var dataModel = new models.Testcasetxn2();
            // see isNew() method implementation in the model
            dataModel.notSynced = true;
            this.view = new views.ModelView({
                model: dataModel,
                collection: this.collection,
                // tpl-testcasetxn2-details is a template identifier for chosen model element
                templateName: '#tpl-testcasetxn2-details',
                navigate: function (id) {
                    self.navigate(id, false);
                },
                getHashObject: function () {
                    return self.getData();
                }
            });
            $('#content').html(this.view.render().el);
        },
        getData: function () {
            return {
                id: $('#id').val(),
                testedFunction: $('#testedFunction').val(),
                weightage: $('#weightage').val(),
                weightage3: $('#weightage3').val(),
                weightage2: $('#weightage2').val(),
                weightage1: $('#weightage1').val(),
                functionInput: $('#functionInput').val(),
                functionExpectedOutput: $('#functionExpectedOutput').val(),
                functionStatus: $('#functionStatus').val()
            };
        }
    });
    new AppRouter();


    Backbone.history.start();
});
