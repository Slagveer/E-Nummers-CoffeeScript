/**
 * Created with JetBrains WebStorm.
 * User: pslagveer
 * Date: 22-02-13
 * Time: 10:01
 * To change this template use File | Settings | File Templates.
 */
"use strict";
ko.bindingHandlers.clickWithParams = {
    init: function(element, valueAccessor, allBindingsAccessor, viewModel) {
        var options = valueAccessor();
        var newValueAccessor = function() {
            return function() {
                options.action.apply(viewModel, options.params);
            };
        };
        ko.bindingHandlers.click.init(element, newValueAccessor, allBindingsAccessor, viewModel);
    },
    update: function(element, valueAccessor, allBindingsAccessor, viewModel) {
        // This will be called once when the binding is first applied to an element,
        // and again whenever the associated observable changes value.
        // Update the DOM element based on the supplied values here.
    }
};

ko.extenders.logChange = function(target, option) {
    target.subscribe(function(newValue) {
        console.log(newValue);
    });
    return target;
};

ko.bindingHandlers.id = {
    init: function(element, valueAccessor, allBindingsAccessor, viewModel) {
        $(element).attr('id',valueAccessor);
    }
}
