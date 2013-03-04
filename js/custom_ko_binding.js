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

ko.utils.stringStartsWith = function (string, startsWith) {
    string = string || "";
    if (startsWith.length > string.length){
        return false;
    }
    return string.substring(0, startsWith.length) === startsWith;
};

ko.utils.stringContains = function (string, contains) {
    string = string || "";
    if (contains.length > string.length){
        return false;
    }
    return string.split(contains).length > 1;
};

ko.bindingHandlers.cssExtra = {
    init: function(element, valueAccessor, allBindingsAccessor, viewModel) {
        // This will be called when the binding is first applied to an element
        // Set up any initial state, event handlers, etc. here
        switch(valueAccessor()){
            case 1:
                $(element).attr({"class":"animated soort1"});
                break;
            case 2:
                $(element).attr({"class":"animated soort2"});
                break;
            default:
                $(element).attr({"class":"animated soort3"});
        }
    },
    update: function(element, valueAccessor, allBindingsAccessor, viewModel) {
        // This will be called once when the binding is first applied to an element,
        // and again whenever the associated observable changes value.
        // Update the DOM element based on the supplied values here.
    }
};
