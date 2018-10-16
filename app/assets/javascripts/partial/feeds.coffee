# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $slider = $('.js-slider01')
  _sliderOptions = {
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
  }
  $slider.slick(_sliderOptions);
