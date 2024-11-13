$.noConflict();

jQuery(document).ready(function ($) {

    "use strict";

    // Initialize SelectFx on elements with the class 'cs-select'
    [].slice.call(document.querySelectorAll('select.cs-select')).forEach(function (el) {
        new SelectFx(el);
    });

    // Initialize selectpicker (assuming you want to call selectpicker function here)
    $('.selectpicker').selectpicker();

    // Search trigger open
    $('.search-trigger').on('click', function (event) {
        event.preventDefault();
        event.stopPropagation();
        $('.search-trigger').parent('.header-left').addClass('open');
    });

    // Search close
    $('.search-close').on('click', function (event) {
        event.preventDefault();
        event.stopPropagation();
        $('.search-trigger').parent('.header-left').removeClass('open');
    });

    // Equal height for elements
    $('.equal-height').matchHeight({
        property: 'max-height'
    });

    // Counter number animation
    $('.count').each(function () {
        $(this).prop('Counter', 0).animate({
            Counter: $(this).text()
        }, {
            duration: 3000,
            easing: 'swing',
            step: function (now) {
                $(this).text(Math.ceil(now));
            }
        });
    });

    // Menu trigger
    $('#menuToggle').on('click', function () {
        var windowWidth = $(window).width();
        if (windowWidth < 1010) {
            $('body').removeClass('open');
            if (windowWidth < 760) {
                $('#left-panel').slideToggle();
            } else {
                $('#left-panel').toggleClass('open-menu');
            }
        } else {
            $('body').toggleClass('open');
            $('#left-panel').removeClass('open-menu');
        }
    });

    // Menu item with children dropdown
    $(".menu-item-has-children.dropdown").each(function () {
        $(this).on('click', function () {
            var $tempText = $(this).children('.dropdown-toggle').html();
            $(this).children('.sub-menu').prepend('<li class="subtitle">' + $tempText + '</li>');
        });
    });

    // Load and resize event
    $(window).on("load resize", function () {
        var windowWidth = $(window).width();
        if (windowWidth < 1010) {
            $('body').addClass('small-device');
        } else {
            $('body').removeClass('small-device');
        }
    });

});
